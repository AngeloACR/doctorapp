import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
@Component({
  selector: 'app-appointments',
  templateUrl: './appointments.page.html',
  styleUrls: ['./appointments.page.scss'],
})
export class AppointmentsPage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  }
 chat() {
    this.route.navigate(['./chat']);
  } 
}
