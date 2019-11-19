import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PaginaAdministradorComponent } from './components/pagina-administrador/pagina-administrador.component';
import { PaginaClienteComponent } from './components/pagina-cliente/pagina-cliente.component';
import { HeaderAdministradorComponent } from './components/header-administrador/header-administrador.component';
import { HeaderClienteComponent } from './components/header-cliente/header-cliente.component';
import { FooterComponent } from './components/footer/footer.component';
import { IniciarSesionComponent } from './components/iniciar-sesion/iniciar-sesion.component';
import { RegistrarseComponent } from './components/registrarse/registrarse.component';
import { PaginaInicioComponent } from './components/pagina-inicio/pagina-inicio.component';
import { RegistrarInformacionComponent } from './components/registrar-informacion/registrar-informacion.component';
import { CrudHotelComponent } from './components/crud-hotel/crud-hotel.component';

@NgModule({
  declarations: [
    AppComponent,
    PaginaAdministradorComponent,
    PaginaClienteComponent,
    HeaderAdministradorComponent,
    HeaderClienteComponent,
    FooterComponent,
    IniciarSesionComponent,
    RegistrarseComponent,
    PaginaInicioComponent,
    RegistrarInformacionComponent,
    CrudHotelComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
