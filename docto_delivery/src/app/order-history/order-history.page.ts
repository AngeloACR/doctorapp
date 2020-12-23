import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

import { DeliveryService } from "../../services/delivery/delivery.service";
@Component({
  selector: 'app-order-history',
  templateUrl: './order-history.page.html',
  styleUrls: ['./order-history.page.scss'],
})
export class OrderHistoryPage implements OnInit {

  constructor(private navCtrl: NavController, private delivery: DeliveryService) { }

  posicion: any;
  pedido: any;
  total: any;

  async ngOnInit() {
      this.posicion = await this.delivery.getPosicionDelivery();
      this.pedido = await this.delivery.getPedido();
      this.total = await this.delivery.getTotal();
  } 
 home() {
    this.navCtrl.navigateRoot(['./home']);
  } 
}
