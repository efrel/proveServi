app.controller('contrato', function($scope, $rootScope, $http, $filter, $location) {
    $rootScope.titulo = "Contratos";

    $http({
        method: "POST",
        url: "services/cargarProveedores.php",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
    }).then(
        function success(response) {
            $scope.proveedores = response.data;
            console.log($scope.proveedores[0].fk_tp)
        },
        function error(response) {

        });

    $scope.var = 0;
    $scope.cambio = function (id) {
        for (var i = 0; i < $scope.proveedores.length; i++) {
            if($scope.proveedores[i].id_pro == id){
                $scope.var = $scope.proveedores[i].fk_tp;
            }
        }
        console.log($scope.var);
    }

    $scope.guardarContra = function(dataContra){
        dataContra['fechaInicio'] = $filter('date')(dataContra['fechaInicio'], 'yyyy-MM-dd');
        dataContra['fechaFin'] = $filter('date')(dataContra['fechaFin'], 'yyyy-MM-dd');
        console.log(dataContra);
        $http({
            method: "POST",
            url: "services/saveContrato.php",
            data: $.param(dataContra),
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
});