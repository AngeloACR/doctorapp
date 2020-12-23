import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

import { DeliveryService } from "../../services/delivery/delivery.service";

@Component({ 
  selector: 'app-new-delivery',
  templateUrl: './new-delivery.page.html',
  styleUrls: ['./new-delivery.page.scss'],
})
export class NewDeliveryPage implements OnInit {

  constructor(private navCtrl: NavController, private delivery: DeliveryService) { }

  posicion: any;

  async ngOnInit() {
    this.posicion = await this.delivery.getPosicionDelivery();
  }

 accepted() {
    this.navCtrl.navigateRoot(['./accepted']);
  }
}
 