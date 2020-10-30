import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

import { MedicoService } from "../../services/medico/medico.service";

@Component({
  selector: 'app-add-feedback',
  templateUrl: './add-feedback.page.html',
  styleUrls: ['./add-feedback.page.scss'],
})
export class AddFeedbackPage implements OnInit {

  perfilDoctor: any;

  constructor(private navCtrl: NavController, private medico: MedicoService) { }

  async ngOnInit() {
    this.perfilDoctor = await this.medico.getDoctorProfile();
  }

 tabs() {
    this.navCtrl.navigateRoot(['./tabs']);
  } 
}
