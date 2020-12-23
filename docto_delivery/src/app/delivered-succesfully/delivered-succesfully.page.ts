import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { Router } from '@angular/router';

import { DeliveryService } from "../../services/delivery/delivery.service";

@Component({
  selector: 'app-delivered-succesfully',
  templateUrl: './delivered-succesfully.page.html',
  styleUrls: ['./delivered-succesfully.page.scss'],
})
export class DeliveredSuccesfullyPage implements OnInit {

  constructor(private navCtrl: NavController, private route: Router, private delivery: DeliveryService) { }

  correcto: any;

  async ngOnInit() { 
    this.correcto = await this.delivery.getDelivered();
  }

 home() {
    this.navCtrl.navigateRoot(['./home']);
  } 
 order_info() {
    this.route.navigate(['./order-history']);
  } 
 view_earnings() {
    this.route.navigate(['./wallet']);
  } 
}
