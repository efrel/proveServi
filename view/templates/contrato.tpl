<div class="card">
    <div class="card-encabezado">
        <h4 class="titulo">Contratos</h4>
    </div>
    <div class="card-contenido">
        <form name="contrato" novalidate>
            <div class="columna-4">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="proveedores" ng-change="cambio(contra.proveedor)" ng-model="contra.proveedor" required>
                        <option ng-repeat="p in proveedores" value="{{p.id_pro}}" ng-selected="{{p.id_pro == contra.proveedor}}">{{p.nombre}}</option>
                    </select>
                    <label for="proveedor">Proveedor</label>
                    <span ng-show="!contrato.$pristine && contrato.proveedores.$error.required" class="error letra">Campo requerido</span>
                </div>
            </div>
            <div class="columna-12" ng-hide="var == 0">
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="monto" ng-model="contra.monto" >
                        <label for="monto">Monto</label>
                        <!--<span ng-show="" class="error letra">campo requerido</span>-->
                    </div>
                </div>
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="condicion" ng-model="contra.condicion" >
                        <label for="condicion">Condicion de pago</label>
                        <!--<span ng-show="" class="error letra">campo requerido</span>-->
                    </div>
                </div>
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="date" class="input-text" name="fechaInicio" ng-model="contra.fechaInicio" required>
                        <label for="fechaInicio">Fecha Inicio</label>
                        <!--<span ng-show="" class="error letra">Campo requerido</span>-->
                    </div>
                </div>
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="date" class="input-text" name="fechaFin" ng-model="contra.fechaFin" required>
                        <label for="fechaFin">Fecha Fin</label>
                        <!--<span ng-show="" class="error letra">Campo requerido</span>-->
                    </div>
                </div>
                <div ng-if="var == 1">
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="cantBN" ng-model="contra.cantBN" >
                            <label for="cantBN">N° maximo de impresiones B/N</label>
                            <!--<span ng-show="" class="error letra">campo requerido</span>-->
                        </div>
                    </div>
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="costoBN" ng-model="contra.costoBN" >
                            <label for="costoBN">Costo por impresion B/N</label>
                            <!--<span ng-show="" class="error letra">campo requerido</span>-->
                        </div>
                    </div>
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="cantColor" ng-model="contra.cantColor" >
                            <label for="cantColor">N° maximo de impresiones color</label>
                            <!--<span ng-show="" class="error letra">campo requerido</span>-->
                        </div>
                    </div>
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="costoColor" ng-model="contra.costoColor" >
                            <label for="costoColor">Costo por impresion color</label>
                            <!--<span ng-show="" class="error letra">campo requerido</span>-->
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn form odoo pull-right" ng-click="guardarContra(contra)" ng-disabled="!contrato.$valid">
                <i class="fa fa fa-save"></i>
                Guardar
            </button>
            <button type="submit" class="btn form odoo pull-right" ng-hide="var == 0" ng-click="cambia()">
                <i class="fa fa fa-times"></i>
                Cancelar
            </button>

        </form>
    </div>
</div>