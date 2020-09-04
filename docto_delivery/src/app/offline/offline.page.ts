import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-offline',
  templateUrl: './offline.page.html',
  styleUrls: ['./offline.page.scss'],
})
export class OfflinePage implements OnInit {

  constructor(private navCtrl: NavController) { }

  ngOnInit() {
  }

home() {
    this.navCtrl.navigateRoot(['./home']);
  }
 continue() {
    this.navCtrl.navigateRoot(['./new-delivery']);
  }
}
