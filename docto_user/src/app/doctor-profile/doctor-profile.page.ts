import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-doctor-profile',
  templateUrl: './doctor-profile.page.html',
  styleUrls: ['./doctor-profile.page.scss'],
})
export class DoctorProfilePage implements OnInit {
   favorite_icon = false;
  tab: string = "about";		
  constructor(private route: Router) { }

  ngOnInit() {
  }

toggleSaveIcon1() {
    this.favorite_icon = !this.favorite_icon;
  }
	
 book_appointment_now() {
    this.route.navigate(['./appointment-book']);
  }
 give_feedback() {
    this.route.navigate(['./add-feedback']);
  }
}
