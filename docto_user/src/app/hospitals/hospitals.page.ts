import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-hospitals',
  templateUrl: './hospitals.page.html',
  styleUrls: ['./hospitals.page.scss'],
})
export class HospitalsPage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  }

 hospital_info() {
    this.route.navigate(['./hospital-info']);
  }  
 map() {
    this.route.navigate(['./hospital-map-view']);
  }  
 search() {
    this.route.navigate(['./specilities']);
  } 
 set_location() {
    this.route.navigate(['./add-address']);
  } 	
}
