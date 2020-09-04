import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { Router } from '@angular/router';
@Component({
  selector: 'app-delivered-succesfully',
  templateUrl: './delivered-succesfully.page.html',
  styleUrls: ['./delivered-succesfully.page.scss'],
})
export class DeliveredSuccesfullyPage implements OnInit {

  constructor(private navCtrl: NavController, private route: Router) { }

  ngOnInit() {
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
