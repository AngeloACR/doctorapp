import { Component, OnInit } from '@angular/core';

import { UsuarioService } from "../../services/usuario/usuario.service";

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.page.html',
  styleUrls: ['./my-profile.page.scss'],
})
export class MyProfilePage implements OnInit {

  perfilUsuarios: any;

  constructor(private usuario: UsuarioService) { }

  async ngOnInit() {
    this.perfilUsuarios = await this.usuario.getPerfilUsuarios();
  }

}
