<div class="card">
	<div class="card-encabezado">
		<h4 class="titulo">Proveedor</h4>
	</div>
	<div class="card-contenido">
        <form name="provee" novalidate>
              <div class="columna-12">
                  <div class="form-grupo form-texto-animado">
                      <input type="text" class="input-text" required name="proveedor" ng-model="pro.proveedor" readonly>
                      <label for="proveedor">Proveedor</label>
                      <span ng-show="!provee.$pristine && provee.proveedor.$error.required" class="error letra">campo requerido</span>
                  </div>
              </div>
              <div class="columna-6">
                  <div class="form-grupo form-texto-animado">
                      <input type="text" class="input-text" required name="ubicacion" ng-model="pro.ubicacion" readonly>
                      <label for="ubicacion">Ubicación proveedor</label>
                      <span ng-show="!provee.$pristine && provee.ubicacion.$error.required" class="error letra">campo requerido</span>
                  </div>
              </div>
              <div class="columna-6">
                  <div class="form-grupo form-texto-animado">
                      <input type="text" class="input-text" required name="contacto" ng-model="pro.contacto" readonly>
                      <label for="contacto">Contacto</label>
                      <span ng-show="!provee.$pristine && provee.contacto.$error.required" class="error letra">campo requerido</span>
                  </div>
              </div>
              <div class="columna-6">
                  <div class="form-grupo form-texto-animado">
                      <input type="text" class="input-text" required name="numTel" ng-model="pro.numTel" readonly>
                      <label for="numTel">Número de teléfono</label>
                      <span ng-show="!provee.$pristine && provee.numTel.$error.required" class="error letra">campo requerido</span>
                  </div>
              </div>

              <button type="submit" class="btn form odoo pull-right" ng-click="guardarPro(pro)" ng-disabled="!impre.$valid">
                  <i class="fa fa fa-save"></i>
                  Guardar
              </button> 
          </form>
	</div>
</div>