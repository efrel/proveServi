app.controller('facturacion', function($scope, $rootScope, $http, $filter, $location) {
    $rootScope.titulo = "Facturación";
    $scope.deta2 = {};
    $scope.fac = {};

    $scope.detaImpr = false;

    $http({
        method: "POST",
        url: "services/cargarProvee.php",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(
        function success(response) {
            $scope.proveedores = response.data;
        },
        function error(response) {
  
    });

    $scope.crearFac = function(fac){
        cargarDetalleImpre(fac);
        
        $rootScope.provee = fac;
        //cargar la fk del tipo de proveedor que es.
        var param = {
            id: fac.proveedor
        };
        $http({
            method: "POST",
            url: "services/selectTp.php",
            data: $.param(param),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $rootScope.fk_tp = response.data.fk_tp;

                $scope.detaImpr = (parseInt($rootScope.fk_tp) === 1);
            },
            function error(response) {
                alert('Se produjo un error');
            }
        );

        $scope.deta2.totalBn = "";
        $scope.deta2.totalCl = "";

        $scope.bnTotal = function(bnInicio, bnFinal){
          $scope.deta2.totalBn = bnFinal - bnInicio;
        }

        $scope.clTotal = function(clInicio, clFinal){
          $scope.deta2.totalCl = clFinal - clInicio;
        }

        //cargar todas las ubicaciones de las impresoras rejistrada anteriormente.en cotrato
        $http({
            method: "POST",
            url: "services/mostrarImpre.php",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $scope.impresoras = response.data;
            },
            function error(response) {
                alert('Se produjo un error');
            }
        );

        $scope.saveDeta = function(deta){
            deta['id_pro'] = fac.proveedor;
            deta['fecha'] = $filter('date')(fac.fecha, 'yyyy-MM-dd');

            console.log(deta);

            $rootScope.detalleImpre = deta;
    
            $http({
                method: "POST",
                url: "services/saveDetalle.php",
                data: $.param(deta),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                }
            }).then(
                function success(response) {
                    alert("Detalle guardado con éxito.");
                    $scope.deta2 = {};

                    cargarDetalleImpre(fac);
                },
                function error(response) {
                    alert("Error al guardar datos.");
                }
            );
        }

        //LIMPIAR DATOS DEL FORMULARIO COMPLETO
        $scope.limpiar = function(){
            $scope.deta2 = {};
            $scope.fac = {};
            $scope.detaImpr = false;
        }

        //CARGA LOS DATOS DEL DETALLE DE CADA IMPRESORA
        function cargarDetalleImpre(detalle){
            detalle['fecha'] = $filter('date')(detalle.fecha, 'yyyy-MM-dd');
            
            $http({
                method: "POST",
                url: "services/selectDetaImpre.php",
                data: $.param(detalle),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                }
            }).then(
                function success(response) {
                    $scope.detalleImpre = response.data;
                    console.log($scope.detalleImpre);
                    
                },
                function error(response) {
                    alert('Se produjo un error al cargar el detalle de impresoras.');
                }
            );
        }
        //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
    }

});