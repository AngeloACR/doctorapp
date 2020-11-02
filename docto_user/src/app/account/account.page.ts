import { Component, OnInit, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { NavController } from '@ionic/angular';
import { APP_CONFIG, AppConfig } from '../app.config';

import { UsuarioService } from "../../services/usuario/usuario.service";
@Component({
  selector: 'app-account',
  templateUrl: './account.page.html',
  styleUrls: ['./account.page.scss'],
})
export class AccountPage implements OnInit {

  perfilUsuarios: any;

  constructor(@Inject(APP_CONFIG) public config: AppConfig, private route: Router, private navCtrl: NavController, private usuario: UsuarioService) { }

  async ngOnInit() {
    this.perfilUsuarios = await this.usuario.getPerfilUsuarios();
  }

  my_profile() {
    this.route.navigate(['./my-profile']);
  }
  my_address() {
    this.route.navigate(['./addresses']);
  }
  contact_us() {
    this.route.navigate(['./contact-us']);
  }
  terms_conditions() {
    this.route.navigate(['./tnc']);
  }
  faqs() {
    this.route.navigate(['./faqs']);
  }
  logout() {
    this.navCtrl.navigateRoot(['./sign-in']);
  }
  change_language() {
    this.route.navigate(['./change-language']);
  }
  buyAppAction() {
    window.open("https://bit.ly/cc_DoctoWorld", '_system', 'location=no');
  }

}
