app.controller('facturacion', function($scope, $rootScope, $http, $filter, $location) {
    $rootScope.titulo = "Facturación";

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

        console.log($scope.fac.fecha);
        
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

        $scope.totalBn = "";
        $scope.totalCl = "";

        $scope.bnTotal = function(bnInicio, bnFinal){
          $scope.totalBn = bnFinal - bnInicio;
        }

        $scope.clTotal = function(clInicio, clFinal){
          $scope.totalCl = clFinal - clInicio;
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

                    cargarDetalleImpre(fac);
                },
                function error(response) {
                    alert("Error al guardar datos.");
                }
            );
        }

        //CARGA LOS DATOS DEL DETALLE DE CADA IMPRESORA
        function cargarDetalleImpre(deta2){
            deta2['fecha'] = $filter('date')(deta2.fecha, 'MM');
            
            $http({
                method: "POST",
                url: "services/selectDetaImpre.php",
                data: $.param(deta2),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                }
            }).then(
                function success(response) {
                    $scope.detalleImpre = response.data;
                },
                function error(response) {
                    alert('Se produjo un error al cargar el detalle de impresoras.');
                }
            );
        }
        //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
    }

});