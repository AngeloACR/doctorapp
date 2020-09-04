import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.page.html',
  styleUrls: ['./my-profile.page.scss'],
})
export class MyProfilePage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  }


 add_degre() {
    this.route.navigate(['./add-degre']);
  }   
 add_hospital() {
    this.route.navigate(['./add-hospital']);
  }  
 add_services() {
    this.route.navigate(['./add-services']);
  }  
 add_specializations() {
    this.route.navigate(['./add-specializations']);
  } 
}
