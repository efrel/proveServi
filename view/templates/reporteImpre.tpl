<div  class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">General reportes por mes.</h4>
            <p class="categoria">Muestra listado de todos los detalles de impresoras y la opción para general reportes.</p>
        </div>
        <div class="card-contenido tabla-responsive">
            <form name="reportImpre" novalidate>

                <div class="columna-4">
                    <div class="form-grupo form-texto-animado">
                        <input class="input-text" type="month" name="mes" ng-model="mes" required>
                        <label for="mes">Seleccione Mes</label>
                        <span ng-show="!reportImpre.$pristine && reportImpre.mes.$error.required" class="error letra">Campo requerido</span>
                    </div>
                </div>

                <!--<div class="columna-4">
                    <div class="form-grupo form-texto-animado">
                        <select class="input-text" name="mes" ng-model="mes" required>
                            <option ng-repeat="di in detaImpresoras" value="{{di.fecha | date: 'MM'}}">{{di.fecha | date: "MM"}}</option>
                        </select>
                        <label for="mes">Seleccione Mes</label>
                        <span ng-show="!reportImpre.$pristine && reportImpre.mes.$error.required" class="error letra">Campo requerido</span>
                    </div>
                </div>-->

                <button type="button" class="btn form odoo pull-right" ng-click="printfDeta()"  ng-disabled="reportImpre.anio.$error.required || reportImpre.mes.$error.required ">
                    <i class="fa fa fa-save"></i>
                    Descargar
                </button>

                <table class="tabla" ng-show="detaImpresoras.length">
                    <thead style="text-align:center">
                      <th>Ubicación</th>
                      <th>Modelo</th>
                      <th>Serie</th>
                      <th>Fecha</th>
                      <th>B/N Inicio</th>
                      <th>B/N Final</th>
                      <th>Total B/N</th>
                      <th>Color Inicio</th>
                      <th>Color Final</th>
                      <th>Total Color</th>
                    </thead>
                    <tbody>
                      <tr ng-repeat="d in detaImpresoras|filter : selectedMonthFilter">
                          <td>{{d.ubicacion}}</td>
                          <td>{{d.modelo}}</td>
                          <td>{{d.serie}}</td>
                          <td>{{d.fecha}}</td>
                          <td>{{d.bn_inicio}}</td>
                          <td>{{d.bn_final}}</td>
                          <td>{{d.bn_final - d.bn_inicio}}</td>
                          <td>{{d.cl_inicio}}</td>
                          <td>{{d.cl_final}}</td>
                          <td>{{d.cl_final - d.cl_inicio}}</td>
                      </tr>
                    </tbody>
                </table>
            </form>
            <br>
            <br>
            <h3 ng-show="!detaImpresoras.length">No hay Impresoras.</h3>
        </div>
    </div>
</div>
