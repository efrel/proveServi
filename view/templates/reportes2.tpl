<div class="card">
    <div class="card-encabezado">
        <h4 class="titulo">Reportes2</h4>
    </div>
    <div class="card-contenido">
        <form >
            <div class="columna-2">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="proveedores" ng-change="" ng-model="rep.proveedor" required>
                        <option ng-repeat="p in proveedores" value="{{p.id_pro}}" ng-selected="{{p.id_pro == proveedor}}">{{p.nombre}}</option>
                    </select>
                    <label for="proveedor">Proveedor</label>
                </div>
            </div>
            <div class="columna-2">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="proveedores" ng-change="condicion(condi)" ng-model="condi" required>
                        <option value="1" ng-selected="{{1 == condi}}">Mensual</option>
                        <option value="2" ng-selected="{{2 == condi}}">Rango de fechas</option>
                    </select>
                    <label for="Condicion">Condicion</label>
                </div>
            </div>
            <div class="columna-2" ng-if="con == 1">
                <div class="form-grupo form-texto-animado">
                    <input type="date" class="input-text" name="fecha" ng-model="rep.fecha">
                    <label for="fecha">Fecha</label>
                </div>
            </div>
            <div class="columna-2" ng-if="con == 2">
                <div class="form-grupo form-texto-animado">
                    <input type="date" class="input-text" name="fecha" ng-model="rep.fecha">
                    <label for="fecha">Fecha Inicio</label>
                </div>
            </div>
            <div class="columna-2" ng-if="con == 2">
                <div class="form-grupo form-texto-animado">
                    <input type="date" class="input-text" name="fecha2" ng-model="rep.fecha2">
                    <label for="fecha2">Fecha Final</label>
                </div>
            </div>
            <div class="columna-2" ng-if="con == 1">
                <button type="submit" class="btn form odoo pull-right" ng-click="generar(rep)">
                    <i class="fa fa fa-refresh"></i>
                    Generar
                </button>
            </div>
            <div class="columna-2" ng-if="con == 2">
                <button type="submit" class="btn form odoo pull-right" ng-click="generar2(rep)">
                    <i class="fa fa fa-refresh"></i>
                    Generar
                </button>
            </div>
        </form>
        <div class="columna-12" ng-if="conn == 1">
            <div class="columna-4">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="impresoras" ng-change="generarImpre(impresora,valFecha,valProv)" ng-model="impresora" required>
                        <option ng-repeat="print in impresoras" value="{{print.id_printf}}" ng-selected="{{print.id_printf == impresora}}">{{print.ubicacion.substr(24)}}</option>
                    </select>
                    <label for="impresora">Impresoras</label>
                </div>
            </div>
        </div>
        <div class="columna-6" ng-if="con == 1">
            <canvas id="bar" class="chart chart-bar"
                    chart-data="data" chart-labels="labels" chart-series="series" chart-options="options">
            </canvas>
        </div>
        <div class="columna-6" ng-if="con == 1">
            <canvas id="barConsumoPrint" class="chart chart-bar"
                    chart-data="dataConsumoPrint" chart-labels="labelsConsumoPrint" chart-series="seriesConsumoPrint" chart-options="optionsConsumoPrint">
            </canvas>
        </div>
        <div class="columna-6" ng-if="con == 1">
            <canvas id="barPrint" class="chart chart-bar"
                    chart-data="dataPrint" chart-labels="labelsPrint" chart-series="seriesPrint" chart-options="optionsPrint">
            </canvas>
        </div>
        <div class="columna-6" ng-if="con == 1">
            <canvas id="barPrintDepa" class="chart chart-bar"
                    chart-data="dataPrintDepa" chart-labels="labelsPrintDepa" chart-series="seriesPrintDepa" chart-options="optionsPrintDepa">
            </canvas>
        </div>
        <div class="columna-12" ng-if="con == 2">
            <canvas id="barPrintMes" class="chart chart-bar"
                    chart-data="dataPrintMes" chart-labels="labelsPrintMes" chart-series="seriesPrintMes" chart-options="optionsPrintMes">
            </canvas>
        </div>
    </div>
</div>