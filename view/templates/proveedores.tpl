<div class="card">
	<div class="card-encabezado">
		<h4 class="titulo">Proveedores</h4>
	</div>
	<div class="card-contenido">
        <form name="provee" novalidate>
            <div class="columna-12">
                <div class="form-grupo form-texto-animado">
                    <input type="text" class="input-text" required name="proveedor" ng-model="pro.proveedor">
                    <label for="proveedor">Proveedor</label>
                    <span ng-show="!provee.$pristine && provee.proveedor.$error.required" class="error letra">campo requerido</span>
                </div>
            </div>
            <div class="columna-6">
                <div class="form-grupo form-texto-animado">
                    <input type="text" class="input-text" required name="ubicacion" ng-model="pro.ubicacion">
                    <label for="ubicacion">Ubicación proveedor</label>
                    <span ng-show="!provee.$pristine && provee.ubicacion.$error.required" class="error letra">campo requerido</span>
                </div>
            </div>
            <div class="columna-6">
                <div class="form-grupo form-texto-animado">
                    <input type="text" class="input-text" required name="contacto" ng-model="pro.contacto">
                    <label for="contacto">Contacto</label>
                    <span ng-show="!provee.$pristine && provee.contacto.$error.required" class="error letra">campo requerido</span>
                </div>
            </div>
            <div class="columna-6">
                <div class="form-grupo form-texto-animado">
                    <input type="text" class="input-text" required name="numTel" ng-model="pro.numTel">
                    <label for="numTel">Número de teléfono</label>
                    <span ng-show="!provee.$pristine && provee.numTel.$error.required" class="error letra">campo requerido</span>
                </div>
            </div>
            <div class="columna-6">
                <div class="form-grupo form-texto-animado">
                    <input type="text" class="input-text" required name="correo" ng-model="pro.correo">
                    <label for="correo">Correo Electronico</label>
                    <span ng-show="!provee.$pristine && provee.correo.$error.required" class="error letra">campo requerido</span>
                </div>
            </div>
            <div class="columna-3">
                <div class="form-grupo form-texto-animado">
                    <select class="input-text" name="tipServi" ng-model="pro.tipServi2" required>
                        <option ng-repeat="t in tipServi" value="{{t.id_tp}}" ng-selected="{{t.id_tp == pro.tipServi2}}">{{t.tipo_provee}}</option>
                    </select>
                    <label for="tipServi">Tipo de contrato</label>
                    <span ng-show="!provee.$pristine && provee.tipServi.$error.required" class="error letra">Campo requerido</span>
                </div>
            </div>

              <button type="submit" class="btn form odoo pull-right" ng-click="guardarPro(pro)" ng-disabled="!provee.$valid">
                  <i class="fa fa fa-save"></i>
                  Guardar
              </button> 
          </form>
	</div>
</div>