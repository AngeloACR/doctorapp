import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { UsuarioService } from "../../services/usuario/usuario.service";

@Component({
  selector: 'app-addresses',
  templateUrl: './addresses.page.html',
  styleUrls: ['./addresses.page.scss'],
})
export class AddressesPage implements OnInit {

  constructor(private route: Router, private usuario: UsuarioService) { }

  async ngOnInit() {
    
  }
	
 add_new() {
    this.route.navigate(['./add-address']);
  } 

}
