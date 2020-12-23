import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor() { }

  async getPerfilUsuarios(){ // account.page
    let perfilUsuarios= [
      {
        imagenPerfil: "assets/images/doc4.png",
        telefono: "987 654 3210",
        nombre: "Sam Smith",
        hospital: "Apple Hospital",
        correo: "samsmith@mail.com"
      }
    ];
    return perfilUsuarios
  }
}
