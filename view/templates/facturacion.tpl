<div class="card">
	<div class="card-encabezado">
		<h4 class="titulo">Facturación</h4>
	</div>
	<div class="card-contenido">
        <form name="factu" novalidate>

            <div class="columna-5">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="proveedor" ng-model="fac.proveedor" required>
                        <option ng-repeat="p in proveedores" value="{{p.id_pro}}" ng-selected="{{p.id_pro == fac.proveedor}}">{{p.nombre}}</option>
                    </select>
                    <label for="proveedor">Proveedor </label>
                    <span ng-show="!factu.$pristine && factu.proveedor.$error.required" class="error letra">Campo requerido</span>
                </div>
            </div>

           <div class="columna-4">
                <div class="form-grupo form-texto-animado">
                    <input type="date" class="input-text" name="fecha" ng-model="fac.fecha" required>
                    <label class="labelDate" for="fecha">Fecha</label>
                    <span ng-show="!factu.$pristine && factu.fecha.$error.required" class="error letra">Campo requerido</span>
                </div>
            </div>
           
            <div class="columna-3">
                <button type="submit" class="btn form odoo pull-right" ng-click="crearFac(fac)" ng-disabled="!factu.$valid">
                    <i class="fa fa fa-plus"></i>
                    Crear
                </button> 
                <button type="button" class="btn form odoo pull-right" ng-click="limpiar()" ng-disabled="!factu.$valid">
                    <i class="fa fa fa-eraser"></i>
                    Limpiar
                </button> 
            </div>

          </form>
	</div>
</div>

<!-- DETALLE DE FACTURAS -->
<div ng-if="detaImpr">
    <div  class="columna-12 animate-if">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Detalle de Impresoras</h4>
                <p class="categoria">Ingresar el consumo de cada impresora por mes.</p>
            </div>
            <div class="card-contenido tabla-responsive">
                <form name="detaImpre2" novalidate>

                    <div class="columna-12">
                        <div class="form-grupo form-texto-animado">
                            <select class="input-text" name="proveedor" ng-model="deta2.impre" required>
                                <option ng-repeat="im in impresoras" value="{{im.id_printf}}" ng-selected="{{im.id_printf == deta2.impre}}">{{im.ubicacion}}</option>
                            </select>
                            <label for="proveedor">Ubicación</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.proveedor.$error.required" class="error letra">Campo requerido</span>
                        </div>
                    </div>
                
                    <div class="columna-4">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="bnInicio" ng-model="deta2.bnInicio" ng-pattern="/^[0-9.]*$/">
                            <label for="bnInicio">B/N Inicio</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.bnInicio.$error.required" class="error letra">Campo requerido</span>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.bnInicio.$error.pattern" class="error letra">Solo números</span>
                        </div>
                    </div>
                    <div class="columna-4">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="bnFinal" ng-change="bnTotal(deta2.bnInicio, deta2.bnFinal)"  ng-model="deta2.bnFinal" ng-pattern="/^[0-9.]*$/">
                            <label for="bnFinal">B/N Final</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.bnFinal.$error.required" class="error letra">Campo requerido</span>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.bnFinal.$error.pattern" class="error letra">Solo números</span>
                        </div>
                    </div>
                    <div class="columna-4">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="totalBn" ng-model="deta2.totalBn" readonly ng-pattern="/^[0-9.]*$/">
                            <label for="totalBn">B/N Total</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.totalBn.$error.required" class="error letra">Campo requerido</span>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.totalBn.$error.pattern" class="error letra">Solo números</span>
                        </div>
                    </div>

                    <div class="columna-4">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="clInicio" ng-model="deta2.clInicio" ng-pattern="/^[0-9.]*$/">
                            <label for="clInicio">Color Inicio</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.clInicio.$error.required" class="error letra">Campo requerido</span>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.clInicio.$error.pattern" class="error letra">Solo números</span>
                        </div>
                    </div>
                    <div class="columna-4">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="clFinal" ng-change="clTotal(deta2.clInicio, deta2.clFinal)" ng-model="deta2.clFinal" ng-pattern="/^[0-9.]*$/">
                            <label for="clFinal">Color Final</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.clFinal.$error.required" class="error letra">Campo requerido</span>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.clFinal.$error.pattern" class="error letra">Solo números</span>
                        </div>
                    </div>
                    <div class="columna-4">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" required name="totalCl" ng-model="deta2.totalCl" readonly ng-pattern="/^[0-9.]*$/">
                            <label for="totalCl">Color Total</label>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.totalCl.$error.required" class="error letra">Campo requerido</span>
                            <span ng-show="!detaImpre2.$pristine && detaImpre2.totalCl.$error.pattern" class="error letra">Solo números</span>
                        </div>
                    </div>

                    <div class="columna-12">
                        <button type="submit" class="btn form odoo pull-right" ng-click="saveDeta(deta2)" ng-disabled="!detaImpre2.$valid">
                            <i class="fa fa fa-save"></i>
                            Guardar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div  class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Control por mes</h4>
            </div>
            <div class="card-contenido tabla-responsive">
                <form name="indiGraph" novalidate>
                    <table class="tabla" ng-show="detalleImpre.length">
                        <thead style="text-align:center">
                        <th>Ubicación</th>
                        <th>Fecha</th>
                        <th>B/N Inicio</th>
                        <th>B/N Final</th>
                        <th>Total B/N</th>
                        <th>Color Inicio</th>
                        <th>Color Final</th>
                        <th>Total Color</th>
                        </thead>
                        <tbody>
                        <tr ng-repeat="d in detalleImpre">
                            <td>{{d.ubicacion}}</td>
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
                <h3 ng-show="!detalleImpre.length">No hay Impresoras.</h3>
            </div>
        </div>
    </div>
</div>
<!--FIN DETALLE FACTURA-->