app.controller('contrato', function($scope, $rootScope, $http, $location) {
    $rootScope.titulo = "Contrato de proveedor";
    
    $scope.guardarPro = function(dataPro){
        console.log(dataPro);
        $http({
            method: "POST",
            url: "services/saveProve.php",
            data: $.param(dataPro),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                alert('Datos guardados correctamente');
            },
            function error(response) {
                alert('Se produjo un error al cargar el proveedor.');
            }
        );
    }

    $http({
        method: "POST",
        url: "services/cargarTipServi.php",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(
        function success(response) {
            $scope.tipServi = response.data;
        },
        function error(response) {
  
    });

});