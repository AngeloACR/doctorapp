import { Component, OnInit } from '@angular/core';

import { DoctorService } from "../../services/doctor/doctor.service";

@Component({
  selector: 'app-add-specializations',
  templateUrl: './add-specializations.page.html',
  styleUrls: ['./add-specializations.page.scss'],
})
export class AddSpecializationsPage implements OnInit {

  constructor(private doctor: DoctorService) { }

  especialidad: any;
 
  async ngOnInit() {
    this.especialidad = await this.doctor.getEspecialidad();
  }

}
