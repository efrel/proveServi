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
