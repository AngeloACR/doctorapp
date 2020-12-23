import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { DoctorService } from "../../services/doctor/doctor.service";

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.page.html',
  styleUrls: ['./my-profile.page.scss'],
})
export class MyProfilePage implements OnInit {

  constructor(private route: Router, private doctor: DoctorService) { }

  infoBanner: any;
  perfil: any;
  degrees: any;
  servicios: any;
  especializacion: any;
  disponibilidad: any;

  async ngOnInit() { 
    this.infoBanner = await this.doctor.getInfoBanner();
    this.perfil = await this.doctor.getPerfil();
    this.degrees = await this.doctor.getDegrees();
    this.servicios = await this.doctor.getServicios();
    this.especializacion = await this.doctor.getEspecializacion();
    this.disponibilidad = await this.doctor.getDisponibilidad();
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
