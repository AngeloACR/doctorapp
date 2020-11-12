import { Component, OnInit } from '@angular/core';

import { HomeService } from "../../services/home/home.service";
import { InsightService } from "../../services/insight/insight.service";

@Component({
  selector: 'app-insight',
  templateUrl: './insight.page.html', 
  styleUrls: ['./insight.page.scss'],
})
export class InsightPage implements OnInit {
gaming: string = "1"; 

  constructor(private home: HomeService, private insignt: InsightService) { }

  delivery: any;
  filasEarnings: any;
  columnasEarnings: any;
  filasOrders: any;
  columnasOrders: any;

  async ngOnInit() {
    this.delivery = await this.home.getDelivery();
    this.filasEarnings = await this.insignt.getFilasEarnings();
    this.columnasEarnings = await this.insignt.getColumnasEarnings();
    this.filasOrders = await this.insignt.getFilasOrders();
    this.columnasOrders = await this.insignt.getColumnasOrders();


  }

}
