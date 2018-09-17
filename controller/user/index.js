app.controller('index', function($scope, $rootScope, $http, $location) {
    $rootScope.titulo = "Control de consumo de Impresoras";

    cargarData();

    function cargarData(){
        $http({
            method: "POST",
            url: "services/mostrarImpre.php",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $scope.dataResult = response.data;
            },
            function error(response) {
                alert('Se produjo un error');
            }
        );
    }

    $scope.detaImpre = function (id){
        $rootScope.idImpre = id;
        $location.path('detaImpre');
    }

});
