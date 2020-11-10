import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SoporteService {

  constructor() { } 

  async getSoporte(){ // contact-us.page
    let soporte= [
      {
        nombre: "Sam Smiths",
        correo: "samsmith@mail.com",
        mensaje: ""
      }
    ];
    return soporte
  }
}
