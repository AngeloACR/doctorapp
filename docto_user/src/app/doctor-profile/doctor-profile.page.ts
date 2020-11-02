import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MedicoService } from "../../services/medico/medico.service";

@Component({
  selector: 'app-doctor-profile',
  templateUrl: './doctor-profile.page.html',
  styleUrls: ['./doctor-profile.page.scss'],
})
export class DoctorProfilePage implements OnInit {
   favorite_icon = false;
  tab: string = "about";		

  doctorProfile: any;
  overviewProfile: any;
  hospitalProfile: any;
  serviciosProfile: any;
  especializacionesProfile: any;
  timeProfile: any;
  feedbackProfile: any;

  constructor(private route: Router, private medico: MedicoService) { }

  async ngOnInit() {
    this.doctorProfile = await this.medico.getDoctorProfile();
    this.overviewProfile = await this.medico.getOverviewProfile();
    this.hospitalProfile = await this.medico.getHospitalProfile();
    this.serviciosProfile = await this.medico.getServiciosProfile();
    this.especializacionesProfile = await this.medico.getEspecializacionesProfile();
    this.timeProfile = await this.medico.getTimeProfile();
    this.feedbackProfile = await this.medico.getFeedbackProfile();

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
