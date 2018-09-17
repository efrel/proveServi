<!--<div  class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Indicadores de Rendimiento Clave</h4>
            <p class="categoria">Introducir indicadores de medición</p>
        </div>
        <div class="card-contenido tabla-responsive">
            <form name="indi" novalidate>
                <div class="columna-4" ng-repeat="v in variables">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="var{{$index}}" ng-model="formData.resp2[$index]" ng-pattern="/^[0-9.]*$/">
                        <label for="nombre">% {{v.nameVariable}}</label>
                        <span ng-show="!indi.$pristine && indi.var{{$index}}.$error.required" class="error letra">campo requerido</span>
                        <span ng-show="!indi.$pristine && indi.var{{$index}}.$error.pattern" class="error letra">solo números</span>
                    </div>
                </div>
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="idealResult" ng-model="formData.idealResult" ng-pattern="/^[0-9.]*$/">
                        <label for="nombre">Resultado ideal</label>
                        <span ng-show="!indi.$pristine && indi.idealResult.$error.required" class="error letra">campo requerido</span>
                        <span ng-show="!indi.$pristine && indi.idealResult.$error.pattern" class="error letra">solo números</span>
                    </div>
                </div>
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="metaResult" ng-model="formData.metaResult" ng-pattern="/^[0-9.]*$/">
                        <label for="nombre">Meta</label>
                        <span ng-show="!indi.$pristine && indi.metaResult.$error.required" class="error letra">campo requerido</span>
                        <span ng-show="!indi.$pristine && indi.metaResult.$error.pattern" class="error letra">solo números</span>
                    </div>
                </div>
                <button type="submit" class="btn form odoo pull-right" ng-click="submitForm(formData)" ng-disabled="!indi.$valid">
                    <i class="fa fa fa-save"></i>
                    Guardar
                </button>
            </form>
        </div>
    </div>
</div>


<div  class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Historial indicadores de Rendimiento Clave</h4>
            <p class="categoria">Indicadores de medición</p>
        </div>
        <div class="card-contenido tabla-responsive">
            <form name="indiGraph" novalidate>
                <table class="tabla" ng-show="dataResult.length">
                    <thead style="text-align:center">
                    <th>Fecha de registro</th>
                    <th ng-repeat="v in variables">% {{v.nameVariable}}</th>
                    <th>Resultado ideal</th>
                    <th>Meta</th>
                    </thead>
                    <tbody>
                    <tr ng-click="madeGraph(d.var1,d.var2,d.var3,d.idealResult,d.metaResult)" ng-repeat="d in dataResult">
                        <td>{{d.regisDate}}</td>
                        <td>{{d.var1}}</td>
                        <td>{{d.var2}}</td>
                        <td>{{d.var3}}</td>
                        <td>{{d.idealResult}}</td>
                        <td>{{d.metaResult}}</td>
                    </tr>
                    </tbody>
                </table>
            </form>
            <h3 ng-show="!dataResult.length">No hay historial.</h3>
        </div>
    </div>
</div>


<div class="card" ng-show="showGrap">
    <div class="card-encabezado">
        <h4 class="titulo">KPI</h4>
    </div>
    <div class="columna-12">
        <div class="card-contenido">
            <div class="columna-12">
                <canvas id="grafico" class="grafico" width="100%" height="25%"></canvas>
            </div>
        </div>
    </div>
</div>




<style>
  .error {
    color: red;
  }

  .warning {
    color: #ffcc00;
  }

  .letra {
    font-size: 13px;
  }
</style>-->

<div  class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Impresoras por departamento</h4>
            <p class="categoria">Muestra las impresoras que se encuentran en uso</p>
        </div>
        <div class="card-contenido tabla-responsive">
            <form name="indiGraph" novalidate>
                <table class="tabla" ng-show="dataResult.length">
                    <thead style="text-align:center">
                      <th>Ubicación</th>
                      <th>Modelo</th>
                      <th>Serie</th>
                    </thead>
                    <tbody>
                      <tr ng-click="detaImpre(d.id_printf)" ng-repeat="d in dataResult">
                          <td>{{d.ubicacion}}</td>
                          <td>{{d.modelo}}</td>
                          <td>{{d.serie}}</td>
                      </tr>
                    </tbody>
                </table>
            </form>
            <h3 ng-show="!dataResult.length">No hay Impresoras.</h3>
        </div>
    </div>
</div>
