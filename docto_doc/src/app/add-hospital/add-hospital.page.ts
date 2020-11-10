import { Component, OnInit } from '@angular/core';

import { DoctorService } from "../../services/doctor/doctor.service";

@Component({
  selector: 'app-add-hospital',
  templateUrl: './add-hospital.page.html',
  styleUrls: ['./add-hospital.page.scss'],
})
export class AddHospitalPage implements OnInit {

  constructor(private doctor: DoctorService) { }

  hospital: any

  async ngOnInit() {
    this.hospital = await this.doctor.getHospital();
  }

}
