import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.scss']
})
export class IniciarSesionComponent implements OnInit {
  nombreUsuario: string;
  contraseña: string;

  constructor(private router: Router) { }

  ngOnInit() {
  }

  ValidarSesion(){
    let nombreUsuario = ((document.getElementById("exampleInputEmail1") as HTMLInputElement).value);
    let contraseña = ((document.getElementById("exampleInputPassword1") as HTMLInputElement).value);
    let usuarioAdmin = "admin";
    let contraseñaAdmin = "12345";
    if(nombreUsuario == usuarioAdmin && contraseña == contraseñaAdmin){
      this.router.navigate  (['/pagina-administrador']);
    }
    else{
      alert("El usuario o la contraseña no existen");
    }
  }

}
