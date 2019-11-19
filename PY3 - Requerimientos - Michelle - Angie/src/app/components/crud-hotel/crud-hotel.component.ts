import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-crud-hotel',
  templateUrl: './crud-hotel.component.html',
  styleUrls: ['./crud-hotel.component.scss']
})
export class CrudHotelComponent implements OnInit {
  hoteles:Hotel[];
  hotel:Hotel;

  constructor() {
  }

  llenarHoteles(){
    this.hoteles = [];
    let nuevoHotel:Hotel;
    nuevoHotel = new Hotel("Casa Conde", "27162323", "casaconde@cr.com", true, false);

    for(var i = 0; i < 20; i++){
      this.hoteles.push(nuevoHotel);
    }
  }

  ngOnInit() {
    this.llenarHoteles();
    console.log(this.hoteles.length);
  }

}

class Hotel{
  nombre: string;
  telefono: string;
  sitioWeb: string;
  correoElectronico: string;
  petFriendly: boolean;
  ley7600: boolean;

  constructor(nombre:string, telefono:string, sitioWeb:string, petFriendly:boolean, ley7600:boolean){
    this.nombre = nombre;
    this.telefono = telefono;
    this.sitioWeb = sitioWeb;
    this.petFriendly = petFriendly;
    this.ley7600 = ley7600;
  }
}