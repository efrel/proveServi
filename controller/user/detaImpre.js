app.controller('detaImpre', ["$scope", "upload", "$rootScope", "$http", "$location", "$filter", function($scope, upload, $rootScope, $http, $location, $filter) {
  $rootScope.idImpre;

  console.log($rootScope.idImpre);

  var info = {
    id: $rootScope.idImpre
  };

  cargaDetalle();
  cargarDetalleImpre();

  //CARGA LOS DATOS GENERALES POR IMPRESORA
  function cargaDetalle(){
    $http({
        method: "POST",
        url: "services/selectDetaImpre.php",
        data: $.param(info),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(
        function success(response) {
          var x = response.data.impre;
          var x2 = response.data.detaImpre;
          $scope.deta = {
            ubicacion: x.ubicacion,
            modelo: x.modelo,
            serie: x.serie
          };

          console.log(response.data.var);

          $scope.totalBn = "";
          $scope.totalCl = "";

          $scope.bnTotal = function(bnInicio, bnFinal){
            $scope.totalBn = bnFinal - bnInicio;
          }

          $scope.clTotal = function(clInicio, clFinal){
            $scope.totalCl = clFinal - clInicio;
          }

        },
        function error(response) {

      });
    }

    //CARGA LOS DATOS DEL DETALLE DE CADA IMPRESORA
    function cargarDetalleImpre(){
        $http({
            method: "POST",
            url: "services/selectDetaImpre.php",
            data: $.param(info),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $scope.detalleImpre = response.data.detaImpre;
            },
            function error(response) {
                alert('Se produjo un error al cargar el detalle de impresoras.');
            }
        );
    }

    //GUARDA LOS DATOS DE DETALLE POR IMPRESORA Y MES
    //Subir archivos
    // *******************************************************************************
    // $scope.ms = "";
    // $scope.mensa = true;
    $("#file_input_file").on('change', function(event) {
      var file2 = event.target.files[0];
      if (file2.size >= 2 * 1024 * 1024) {
          $scope.mensa = true;
          $scope.ms = "El tamaño máximo de los archivos es 2 MB.";
          /*$("#file_input_text_div").get(0).reset();
          $("#file_input_file").get(0).reset();*/
          return;
      }else if (!file2.type.match('application/pdf') && !file2.type.match('application/msword') && !file2.type.match('application/vnd.openxmlformats-officedocument.wordprocessingml.document') && !file2.type.match('image.*')) {
          $scope.ms = "Solamente puede subir archivos con la extensión .pdf, .doc, .docx";
          $scope.mensa = true;
          /*$("#file_input_text_div").get(0).reset();
          $("#file_input_file").get(0).reset();*/
          return;
      }else{

        console.log("yes");

        $scope.uploadFile = function() {
          console.log("si");

          var bnInicio = $scope.deta2.bnInicio;
          var bnFinal = $scope.deta2.bnFinal;
          var clInicio = $scope.deta2.clInicio;
          var clFinal = $scope.deta2.clFinal;
          var id = $rootScope.idImpre;
      		var fecha = $filter('date')($scope.deta2.fecha,'yyyy-MM-dd');
          var file = $scope.file;

          upload.uploadFile(bnInicio,bnFinal,clInicio,clFinal,id,fecha,file).then(function(res) {
            //window.location.href = "#!impresoras";
            //$location.path('impresoras');
          })
        }
      }

    })

    var fileInputTextDiv = document.getElementById('file_input_text_div');
    var fileInput = document.getElementById('file_input_file');
    var fileInputText = document.getElementById('file_input_text');

    fileInput.addEventListener('change', changeInputText);
    fileInput.addEventListener('change', changeState);

    function changeInputText() {
      var str = fileInput.value;
      var i;
      if (str.lastIndexOf('\\')) {
        i = str.lastIndexOf('\\') + 1;
      } else if (str.lastIndexOf('/')) {
        i = str.lastIndexOf('/') + 1;
      }
      fileInputText.value = str.slice(i, str.length);
    }

    function changeState() {
      if (fileInputText.value.length !== 0) {
        if (!fileInputTextDiv.classList.contains("is-focused")) {
          fileInputTextDiv.classList.add('is-focused');
        }
      } else {
        if (fileInputTextDiv.classList.contains("is-focused")) {
          fileInputTextDiv.classList.remove('is-focused');
        }
      }
    }

}]);

app.directive('uploaderModel', ["$parse", function($parse) {
  return {
    restrict: 'A',
    link: function(scope, iElement, iAttrs) {
      iElement.on("change", function(e) {
        $parse(iAttrs.uploaderModel).assign(scope, iElement[0].files[0]);
      })
    }
  }
}]);

app.service('upload', ["$http", "$q", function($http, $q) {
  this.uploadFile = function(bnInicio,bnFinal,clInicio,clFinal,id,fecha,file) {
    var deferred = $q.defer();
    var formData = new FormData();
    formData.append("bnInicio", bnInicio);
    formData.append("bnFinal", bnFinal);
    formData.append("clInicio", clInicio);
    formData.append("clFinal", clFinal);
    formData.append("id", id);
    formData.append("fecha", fecha);
    formData.append("file", file);
    return $http.post("services/saveDeta.php", formData, {
      headers: {
        "Content-type": undefined
      },
      transformRequest: angular.indentity
    })
    app.success(function(res) {
      deferred.resolve(res);
    })
    app.error(function(msg, code) {
      deferred.reject(msg);
    })
    return deferred.promise;
  }
}]);
