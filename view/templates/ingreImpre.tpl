<div  class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Control de Impresoras</h4>
            <p class="categoria">Ingresar las impresora y Ubicación</p>
        </div>
        <div class="card-contenido tabla-responsive">
            <form name="impre" novalidate>

                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="nombreImpr" ng-model="formData.nombreImpr">
                        <label for="nombreImpr">Ubicación de la impresora</label>
                        <span ng-show="!impre.$pristine && impre.nombreImpr.$error.required" class="error letra">campo requerido</span>
                        <span ng-show="!impre.$pristine && impre.nombreImpr.$error.pattern" class="error letra">solo números</span>
                    </div>
                </div>

                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <select class="input-text" name="proImpresoras" ng-model="formData.proImpresoras" required>
                            <option ng-repeat="im in proImpre" value="{{im.id_pro}}" ng-selected="{{im.id_pro == formData.proImpresoras}}">{{im.nombre}}</option>
                        </select>
                        <label for="proImpresoras">Proveedor </label>
                        <span ng-show="!impre.$pristine && impre.proImpresoras.$error.required" class="error letra">Campo requerido</span>
                    </div>
                </div>

                <div class="columna-4">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="modelo" ng-model="formData.modelo">
                        <label for="modelo">Modelo</label>
                        <span ng-show="!impre.$pristine && impre.modelo.$error.required" class="error letra">campo requerido</span>
                        <span ng-show="!impre.$pristine && impre.modelo.$error.pattern" class="error letra">solo números</span>
                    </div>
                </div>
                <div class="columna-4">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" required name="serie" ng-model="formData.serie">
                        <label for="serie">Serie</label>
                        <span ng-show="!impre.$pristine && impre.serie.$error.required" class="error letra">campo requerido</span>
                        <span ng-show="!impre.$pristine && impre.serie.$error.pattern" class="error letra">solo números</span>
                    </div>
                </div>
               

                <div class="columna-4">
                    <button type="submit" class="btn form odoo pull-right" ng-click="submitForm(formData)" ng-disabled="!impre.$valid">
                        <i class="fa fa fa-save"></i>
                        Guardar
                    </button>
                </div>
          </form>
        </div>
    </div>
</div>