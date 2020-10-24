import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(

  ) { }

  async getUsuario(){
    let usuario= {
      nombre: "angelo",
      apellido: "crincoli"
    }
    return usuario
  }
}
