import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { AppointmentsService } from "../../services/appointments/appointments.service";

@Component({
  selector: 'app-appointments', 
  templateUrl: './appointments.page.html',
  styleUrls: ['./appointments.page.scss'],
})
export class AppointmentsPage implements OnInit {

  getAppointments: any;

  constructor(private route: Router, private appointments: AppointmentsService) { }

  async ngOnInit() {
    this.getAppointments = await this.appointments.getAppointments();
  }
 chat() {
    this.route.navigate(['./chat']);
  } 
}
