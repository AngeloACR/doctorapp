import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor() { }

  async getPerfil(){ // profile.page
    let perfil= [
      {
        imgPerfil: "assets/images/img_profile.png",
        nombre: "Jhon William",
        telefono: "+321 879 54 87",
        correo: "deliverymail@gmail.com",
        id_detalle1: "myvoterid.jpg",
        id_detalle2: "not_uploaded_yet"
      }
    ];
    return perfil
  }
}
