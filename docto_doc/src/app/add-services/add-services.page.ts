import { Component, OnInit } from '@angular/core';

import { DoctorService } from "../../services/doctor/doctor.service";

@Component({
  selector: 'app-add-services',
  templateUrl: './add-services.page.html',
  styleUrls: ['./add-services.page.scss'],
})
export class AddServicesPage implements OnInit {

  constructor(private doctor: DoctorService) { }

  servicio: any;

  async ngOnInit() {
    this.servicio = await this.doctor.getServicio();
  }

}
