app.controller('reporteImpre', function($scope, $rootScope, $http, $location, $filter) {
  $rootScope.titulo = "Control de consumo de Impresoras por mes";

  cargaDetalle();

  //formatear fecha
  $scope.mes = new Date();

  //CARGA LOS DATOS GENERALES POR IMPRESORA
  function cargaDetalle(){
    $http({
        method: "POST",
        url: "services/cargarDetaImpre.php",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(
        function success(response) {
          $scope.detaImpresoras = response.data[0];
        },
        function error(response) {

      });
    }

  $scope.printfDeta = function(){
    //formatear fecha   
    $scope.formattedDate = $filter('date')($scope.mes, "yyyy-MM");
    console.log($scope.formattedDate);

    $scope.selectedMonthFilter = function(element) {
      if(!$scope.mes) return true;
      return element.created.getMonth() == $scope.mes;
    }

    var info ={
      mes: $scope.formattedDate
    };

    $rootScope.reportImpre2;

    $http({
      method: "POST",
      url: "services/selectReport.php",
      data:$.param(info),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
      }
    }).then(
      function success(response) {
        $rootScope.reportImpre2 = response.data;   

        pdf($rootScope.reportImpre2);
      },
      function error(response) {

    });

    function pdf(data){

      var songRows = [];
      var bnInicioM = 0;
      var bnFinalM = 0;
      var totalBN = 0;
      var clInicioM = 0;
      var clFinalM = 0;
      var totalCL = 0;

      angular.forEach(data, function(value, key) {
        songRows.push({Ubicacion: value.ubicacion,Modelo: value.modelo, Serie: value.serie, Fecha: value.fecha, bn_inicio: value.bn_inicio, bn_final: value.bn_final, Total_bn: (value.bn_final-value.bn_inicio), cl_inicio: value.cl_inicio, cl_final: value.cl_final, Total_cl: (value.cl_final - value.cl_inicio)});
      });

      var items;

      items = data.map(function(item) {
        bnInicioM = parseInt(item.bn_inicio) + parseInt(bnInicioM);
        bnFinalM = parseInt(item.bn_final) + parseInt(bnFinalM);
        clInicioM = parseInt(item.cl_inicio) + parseInt(clInicioM);
        clFinalM = parseInt(item.cl_final) + parseInt(clFinalM);
        totalBN = (item.bn_final - item.bn_inicio) + totalBN;
        totalCL = (item.cl_final - item.cl_inicio) + totalCL;
        return [item.ubicacion, item.modelo, item.serie, item.fecha, item.bn_inicio, item.bn_final, (item.bn_final - item.bn_inicio), item.cl_inicio, item.cl_final, (item.cl_final - item.cl_inicio)];
      
      });

      console.log(totalBN, bnInicioM);
      
      //IMPRIMIR
      var reportImprePDF = {
        content: [
          {
            text: [
                {
                    text: 'Reporte Mensual de Contadores\n',
                    style: 'header'
                }
            ],
          },
          {
            style: 'table',
            table: {
                widths: [30, 30, 'auto', 60, '*', '*'],
                body: [
                    [
                      {colSpan: 2, text: 'Contrato: '}, {}, {text: '443', bold: true}, {colSpan: 2, alignment: 'right',text: 'Fecha de corte: '}, {}, { text: data[0].fecha}
                    ],
                    [
                      {colSpan: 2, text: 'Cliente: '}, {}, {bold: true, text: "AGROINDUSTRIAS DIADEMA ZONA FRANCA HONDURAS S.A."}, {}, {}, {},
                    ]
                ]
            },
            layout: 'headerLineOnly'
          },
          {
            style: 'table',
            table: {
                widths: [150, 70, 70, 'auto', '*', '*', '*', '*', '*', '*'],
                body: [
                    [
                        {fillColor: '#6ABAE8', bold: true, text: "Ubicación", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Modelo ", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Serie", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Fecha", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "B/N Inicio", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "B/N Final", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Total B/N", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Color Inicio", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Color Final", decoration: 'underline'},
                        {fillColor: '#6ABAE8', bold: true, text: "Total Color", decoration: 'underline'}
                    ],
                ].concat(items).concat(
                  [
                      [
                        {colSpan: 4, text: '',border: [false, false, true, false]}, {}, {}, {}, {text: bnInicioM}, {text: bnFinalM}, {text: totalBN, bold: true}, {text: clInicioM}, {text: clFinalM}, {text: totalCL, bold: true}
                      ],
                      [
                        {colSpan: 10, text: ""}, {}, {}, {}, {}, {}, {}, {}, {}, {}
                      ],
                      [
                        {colSpan: 10, text: ""}, {}, {}, {}, {}, {}, {}, {}, {}, {}
                      ],
                      [
                        {colSpan: 4, text:''}, {}, {}, {}, {colSpan: 2, text: 'Total B/N: '}, {}, {text: totalBN, bold: true}, {colSpan: 2, text: 'Total Color: '}, {}, {text: totalCL, bold: true}
                      ]
                  ]
                )
            },
            layout: 'headerLineOnly'
          }
        ],
        pageSize: 'letter',
        pageMargins: [30, 25, 30, 30],
        pageOrientation: 'landscape',
        styles: {
            header: {
                bold: true,
                lineHeight: 1.5,
                alignment: 'center',
                fontSize: 14,
                //decoration: 'underline'
            },
            header2: {
                bold: true,
                lineHeight: 1.5,
                alignment: 'center',
                fontSize: 10
                },
            table: {
                margin: [0, 5, 0, 15]
            },
        }
    };

    pdfMake.createPdf(reportImprePDF).download('Reporte de Impresoras.pdf');

   }

  }  

});
