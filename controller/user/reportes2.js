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
            $scope.proveedores = response.data.prov;
            $scope.impresoras = response.data.impre;
            console.log($scope.impresoras);
        },
        function error(response) {

        });

    $scope.generar = function(info){
        info['fecha'] = $filter('date')(info['fecha'], 'yyyy-MM-dd');
        $scope.valFecha = info['fecha'];
        $scope.valProv = info["proveedor"];
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
                var total_costoC = parseInt(diferenciaColor) * parseFloat(contra_costC);
                var total_costoMes = parseFloat(total_costoBN) + parseFloat(total_costoC);
                $scope.labels = ['Monto mensual','Impresiones BN', 'Impresiones Color'];
                $scope.series = ['Contrato', 'Consumo'];

                $scope.data = [
                    [contra_monto],
                    [parseFloat(total_costoMes).toFixed(2),parseFloat(total_costoBN).toFixed(2), parseFloat(total_costoC).toFixed(2)]
                ];
                $scope.options = {
                    title: {
                        display: true,
                        text: 'Consumo mensual en dolares'
                    },
                    legend: {
                        display: true,
                        labels: {
                            fontColor: 'rgb(0, 0, 0)'
                        },
                        position: 'bottom'
                    }
                }

                $scope.labelsConsumoPrint = ['Impresiones BN', 'Impresiones Color'];
                $scope.seriesConsumoPrint = ['Contrato', 'Consumo'];

                $scope.dataConsumoPrint = [
                    [contra_cantBN, contra_cantC],
                    [diferenciaBN, diferenciaColor]
                ];
                $scope.optionsConsumoPrint = {
                    title: {
                        display: true,
                            text: 'Consumo mensual de impresiones'
                    },
                    legend: {
                        display: true,
                        labels: {
                            fontColor: 'rgb(0, 0, 0)'
                        },
                        position: 'bottom'
                    }
                }
            },
            function error(response) {
            }
        );
    }

    $scope.generarImpre = function(value1,value2,value3){
        value2 = $filter('date')(value2, 'yyyy-MM-dd');
        values = {impre:value1,fecha:value2,proveedor:value3}
        $http({
            method: "POST",
            url: "services/reportes2impre.php",
            data: $.param(values),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
        }).then(
            function success(response) {
                $scope.imp = response.data;
                var printImpres = [];
                var printsumaBNini = 0;
                var printsumaCini = 0;
                var printsumaBNfinal = 0;
                var printsumaCfinal = 0;
                for (var o = 0; o < $scope.imp.length; o++){
                    printImpres[o] = $scope.imp[o].nombreImpre.substr(24);
                    printsumaBNini = parseInt(printsumaBNini) + parseInt($scope.imp[o].bn_inicio);
                    printsumaCini = parseInt(printsumaCini) + parseInt($scope.imp[o].cl_inicio);
                    printsumaBNfinal = parseInt(printsumaBNfinal) + parseInt($scope.imp[o].bn_final);
                    printsumaCfinal = parseInt(printsumaCfinal) + parseInt($scope.imp[o].cl_final);
                }
                var printdiferenciaBN = parseInt(printsumaBNfinal) - parseInt(printsumaBNini);
                var printdiferenciaC = parseInt(printsumaCfinal) - parseInt(printsumaCini);

                $scope.labelsPrintDepa = printImpres;
                $scope.seriesPrintDepa = ['Impresiones BN','Impresiones color'];

                $scope.dataPrintDepa = [
                    [printdiferenciaBN],
                    [printdiferenciaC]
                ];
                $scope.optionsPrintDepa = {
                    title: {
                        display: true,
                        text: 'Consumo mensual de impresiones por departamento'
                    },
                    legend: {
                        display: true,
                        labels: {
                            fontColor: 'rgb(0, 0, 0)'
                        },
                        position: 'bottom'
                    }
                }

                var impress = [];
                var impresumaBNini = [];
                var impresumaCini = [];
                var impresumaBNfinal = [];
                var impresumaCfinal = [];
                var imprediferenciaBN = [];
                var imprediferenciaC = [];
                for (var a = 0; a < $scope.reporte.length; a++){
                    impress[a] = $scope.reporte[a].nombreImpre.substr(30);
                    impresumaBNini[a] = 0;
                    impresumaCini[a] = 0;
                    impresumaBNfinal[a] = 0;
                    impresumaCfinal[a] = 0;
                    imprediferenciaBN[a] = 0;
                    imprediferenciaC[a] = 0;
                }
                for (var a = 0; a < $scope.reporte.length; a++){
                    impresumaBNini[a] = parseInt(impresumaBNini[a]) + parseInt($scope.reporte[a].bn_inicio);
                    impresumaCini[a] = parseInt(impresumaCini[a]) + parseInt($scope.reporte[a].cl_inicio);
                    impresumaBNfinal[a] = parseInt(impresumaBNfinal[a]) + parseInt($scope.reporte[a].bn_final);
                    impresumaCfinal[a] = parseInt(impresumaCfinal[a]) + parseInt($scope.reporte[a].cl_final);
                }
                for(var c = 0; c < impress.length; c++){
                    imprediferenciaBN[c] = parseInt(impresumaBNfinal[c]) - parseInt(impresumaBNini[c]);
                    imprediferenciaC[c] = parseInt(impresumaCfinal[c]) - parseInt(impresumaCini[c]);
                }
                $scope.labelsPrint = impress;
                $scope.seriesPrint = ['Impresiones BN','Impresiones color'];

                $scope.dataPrint = [
                    imprediferenciaBN,
                    imprediferenciaC
                ];
                $scope.optionsPrint = {
                    title: {
                        display: true,
                        text: 'Consumo mensual de impresiones'
                    },
                    legend: {
                        display: true,
                        labels: {
                            fontColor: 'rgb(0, 0, 0)'
                        },
                        position: 'bottom'
                    }
                }
            },
            function error(response) {
            }
        );
    }

});