import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-new-delivery',
  templateUrl: './new-delivery.page.html',
  styleUrls: ['./new-delivery.page.scss'],
})
export class NewDeliveryPage implements OnInit {

  constructor(private navCtrl: NavController) { }

  ngOnInit() {
  }

 accepted() {
    this.navCtrl.navigateRoot(['./accepted']);
  }
}
 