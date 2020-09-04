import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-add-feedback',
  templateUrl: './add-feedback.page.html',
  styleUrls: ['./add-feedback.page.scss'],
})
export class AddFeedbackPage implements OnInit {

  constructor(private navCtrl: NavController) { }

  ngOnInit() {
  }

 tabs() {
    this.navCtrl.navigateRoot(['./tabs']);
  } 
}
