import { Component, OnInit } from '@angular/core';

import { DoctorService } from "../../services/doctor/doctor.service";

@Component({
  selector: 'app-add-degre',
  templateUrl: './add-degre.page.html',
  styleUrls: ['./add-degre.page.scss'],
})
export class AddDegrePage implements OnInit {

  constructor(private doctor: DoctorService) { }

  degree: any;

  async ngOnInit() {
    this.degree = await this.doctor.getDegree();
  }

}
