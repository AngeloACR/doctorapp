import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
@Component({
  selector: 'app-order-history',
  templateUrl: './order-history.page.html',
  styleUrls: ['./order-history.page.scss'],
})
export class OrderHistoryPage implements OnInit {

  constructor(private navCtrl: NavController) { }

  ngOnInit() {
  }
 home() {
    this.navCtrl.navigateRoot(['./home']);
  } 
}
