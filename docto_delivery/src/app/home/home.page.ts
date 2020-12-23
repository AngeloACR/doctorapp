import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

import { HomeService } from "../../services/home/home.service";

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {

  constructor(private navCtrl: NavController, private home: HomeService) { } 

  delivery: any;

  async ngOnInit() {
    this.delivery = await this.home.getDelivery();
  }

 offline() {
    this.navCtrl.navigateRoot(['./offline']);
  }
} 
 