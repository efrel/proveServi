app.controller('ingreImpre', function($scope, $rootScope, $http, $location) {
    $rootScope.titulo = "Control de consumo de Impresoras";
    
    $scope.formData = {};
    
    $scope.submitForm = function (formDat){
        $http({
            method: "POST",
            url: "services/insertarImpre.php",
            data:$.param(formDat),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                alert('Datos guardados correctamente');
                $scope.formData = {};
            },
            function error(response) {
                alert('Se produjo un error al cargar las variables');
            }
        );
    }

    //cargar todas las ubicaciones de las impresoras rejistrada anteriormente.en cotrato
    $http({
        method: "POST",
        url: "services/cargarProImpre.php",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
    }).then(
        function success(response) {
            $scope.proImpre = response.data;
        },
        function error(response) {
            alert('Se produjo un error');
        }
    );

});