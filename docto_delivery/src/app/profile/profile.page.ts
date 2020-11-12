import { Component, OnInit } from '@angular/core';

import { UsuarioService } from "../../services/usuario/usuario.service";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {

  gender: string = "male"; 
  user: any;

  constructor(private perfil: UsuarioService) { }

  async ngOnInit() { 
    this.user = await this.perfil.getPerfil();
  }

}
