app.controller('reportes2', function($scope, $rootScope, $http, $filter, $location) {
    $rootScope.titulo = "Reportes2";

    $http({
        method: "POST",
        url: "services/cargarProveedores.php",
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
    }).then(
        function success(response) {
            $scope.proveedores = response.data;
        },
        function error(response) {

        });

    $scope.generar = function(info){
        info['fecha'] = $filter('date')(info['fecha'], 'yyyy-MM-dd');
        console.log(info);
        $http({
            method: "POST",
            url: "services/reportes2.php",
            data: $.param(info),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $scope.reporte = response.data;
                var contra_monto = $scope.reporte[0].monto;
                var contra_cantBN = $scope.reporte[0].print_bn_cant;
                var contra_cantC = $scope.reporte[0].print_color_cant;
                var contra_costBN = parseFloat($scope.reporte[0].print_bn_costo);
                var contra_costC = parseFloat($scope.reporte[0].print_color_costo);
                var sumaBNini = 0;
                var sumaCini = 0;
                var sumaBNfinal = 0;
                var sumaCfinal = 0;
                for (var i = 0; i < $scope.reporte.length; i++) {
                    sumaBNini = parseInt(sumaBNini) + parseInt($scope.reporte[i].bn_inicio);
                    sumaCini = parseInt(sumaCini) + parseInt($scope.reporte[i].cl_inicio);
                    sumaBNfinal = parseInt(sumaBNfinal) + parseInt($scope.reporte[i].bn_final);
                    sumaCfinal = parseInt(sumaCfinal) + parseInt($scope.reporte[i].cl_final);
                }
                var diferenciaBN = parseInt(sumaBNfinal) - parseInt(sumaBNini);
                var diferenciaColor = parseInt(sumaCfinal) - parseInt(sumaCini);

                var total_costoBN = parseInt(diferenciaBN) * parseFloat(contra_costBN);
                var total_costoC = parseInt(diferenciaColor) * parseFloat(contra_cantC);
                var total_costoMes = parseFloat(total_costoBN) + parseFloat(total_costoC);
                console.log(diferenciaBN, " ",total_costoBN, contra_costBN);
                $scope.labels = ['Impresiones BN', 'Impresiones Color', 'Monto mensual'];
                $scope.series = ['Contrato', 'Consumo'];

                $scope.data = [
                    [contra_cantBN, contra_cantC, contra_monto],
                    [total_costoBN, total_costoC, total_costoMes]
                ];
            },
            function error(response) {
            }
        );
    }




});