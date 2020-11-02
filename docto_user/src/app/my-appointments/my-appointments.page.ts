import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { CitasService } from "../../services/citas/citas.service";

@Component({
  selector: 'app-my-appointments',
  templateUrl: './my-appointments.page.html',
  styleUrls: ['./my-appointments.page.scss'],
})
export class MyAppointmentsPage implements OnInit {

  getCitas: any;

  constructor(private route: Router, private citas: CitasService) { }

  async ngOnInit() {
    this.getCitas = await this.citas.getCitas();
  } 

 appointment_detail() {
    this.route.navigate(['./appointment-detail']);
  } 
}
