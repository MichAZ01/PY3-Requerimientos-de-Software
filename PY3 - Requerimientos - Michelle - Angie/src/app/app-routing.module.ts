import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegistrarseComponent } from './components/registrarse/registrarse.component';
import { IniciarSesionComponent } from './components/iniciar-sesion/iniciar-sesion.component';
import { RegistrarInformacionComponent } from './components/registrar-informacion/registrar-informacion.component';
import { PaginaAdministradorComponent } from './components/pagina-administrador/pagina-administrador.component';


const routes: Routes = [
{path: "registrar", component: RegistrarseComponent},
{path: "", component: IniciarSesionComponent},
{path: "registro", component: RegistrarInformacionComponent},
{path: "pagina-administrador", component: PaginaAdministradorComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
