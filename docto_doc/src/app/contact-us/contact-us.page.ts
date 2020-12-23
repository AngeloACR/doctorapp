import { Component, OnInit } from '@angular/core';

import { SoporteService } from "../../services/soporte/soporte.service";

@Component({
  selector: 'app-contact-us',
  templateUrl: './contact-us.page.html',
  styleUrls: ['./contact-us.page.scss'],
})
export class ContactUsPage implements OnInit { 

  soporteUser: any;

  constructor(private soporte: SoporteService) { }

  async ngOnInit() {
    this.soporteUser = await this.soporte.getSoporte();
  }

}
