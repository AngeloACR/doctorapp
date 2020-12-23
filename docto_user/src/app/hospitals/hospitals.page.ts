import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router'; 

import { HospitalService } from "../../services/hospital/hospital.service";

@Component({
  selector: 'app-hospitals',
  templateUrl: './hospitals.page.html',
  styleUrls: ['./hospitals.page.scss'],
})
export class HospitalsPage implements OnInit {

  imgSlider: any;
  hospitales: any;
  imgHospitales: any;

  constructor(private route: Router, private hospital: HospitalService) { }

  async ngOnInit() {
    this.imgSlider = await this.hospital.getSliderHospitales();
    this.hospitales = await this.hospital.getHospitales();
    this.imgHospitales = await this.hospital.getImgHospitales(); 
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
