<div class="card">
    <div class="card-encabezado">
        <h4 class="titulo">Reportes2</h4>
    </div>
    <div class="card-contenido">
        <form >
            <div class="columna-4">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="proveedores" ng-change="" ng-model="rep.proveedor" required>
                        <option ng-repeat="p in proveedores" value="{{p.id_pro}}" ng-selected="{{p.id_pro == proveedor}}">{{p.nombre}}</option>
                    </select>
                    <label for="proveedor">Proveedor</label>
                </div>
            </div>
            <div class="columna-4">
                <div class="form-grupo form-texto-animado">
                    <input type="date" class="input-text" name="fecha" ng-model="rep.fecha" required>
                    <label for="fecha">Fecha</label>
                    <!--<span ng-show="" class="error letra">Campo requerido</span>-->
                </div>
            </div>
            <div class="columna-4">
                <button type="submit" class="btn form odoo pull-right" ng-click="generar(rep)">
                    <i class="fa fa fa-refresh"></i>
                    Generar
                </button>
            </div>
        </form>
        <canvas id="bar" class="chart chart-bar"
                chart-data="data" chart-labels="labels"> chart-series="series"
        </canvas
    </div>
</div>