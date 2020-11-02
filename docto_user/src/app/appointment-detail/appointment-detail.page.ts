import { Component, OnInit } from '@angular/core';

import { CitasService } from "../../services/citas/citas.service";

@Component({
  selector: 'app-appointment-detail',
  templateUrl: './appointment-detail.page.html',
  styleUrls: ['./appointment-detail.page.scss'],
})
export class AppointmentDetailPage implements OnInit {

  getCitas: any;
  getPerfilCitas: any;

  constructor(private citas: CitasService) { }

  async ngOnInit() {
    this.getCitas = await this.citas.getCitas();
    this.getPerfilCitas = await this.citas.getPerfilCitas();
  }

}
