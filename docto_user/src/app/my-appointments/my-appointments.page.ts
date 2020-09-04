import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-my-appointments',
  templateUrl: './my-appointments.page.html',
  styleUrls: ['./my-appointments.page.scss'],
})
export class MyAppointmentsPage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  } 
 appointment_detail() {
    this.route.navigate(['./appointment-detail']);
  } 
}
