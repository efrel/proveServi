var app = angular.module('Aplicacion', ["ngRoute"]);
app.run(function($rootScope, $http) {

	$rootScope.titulo = "Inicio";
	$('.side-bar ul li').click(function(){	
		$('.side-bar ul li').removeClass('activo');	
		$(this).addClass('activo');
	});
	
	$rootScope.cargar = function(fn){
    	//if($rootScope.data == undefined){
    	//var param = {nombre:localStorage['cuenta'], clave : localStorage['clave']};
    	$http({
    		method : "POST",
    		url : "services/alumno.php",
    	//	data:$.param(param),
    		headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'} 
    	}).then(
    		function success(response) {
    		    $rootScope.data = response.data;
    		    fn($rootScope.data);
    		}, 
    		function error(response) {
    			
    		}
    	)
    	;
    	//}else {
    	 //   fn($rootScope.data);
    	//}
	}
}).filter('startFromGrid', function() {
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    }
});