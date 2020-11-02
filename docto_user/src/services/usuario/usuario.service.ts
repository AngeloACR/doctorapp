import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor() { }

  async getPerfilUsuarios(){ // my-profile.page
    let perfilUsuarios= [
      {
        imagenPerfil: "assets/images/my_profile.png",
        telefono: "987 654 3210",
        nombre: "Sam Smith",
        correo: "samsmith@mail.com"
      }
    ];
    return perfilUsuarios
  }
}
