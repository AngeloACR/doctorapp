import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { MedicamentosService } from "../../services/medicamentos/medicamentos.service";

@Component({
  selector: 'app-product-list', 
  templateUrl: './product-list.page.html',
  styleUrls: ['./product-list.page.scss'],
})
export class ProductListPage implements OnInit {

  producto: any;

  constructor(private route: Router, private medicamentos: MedicamentosService) { }

  async ngOnInit() {
    this.producto = await this.medicamentos.getProducto();
  }
	

 cart() {
    this.route.navigate(['./my-cart']);
  } 
 item_info() {
    this.route.navigate(['./product-info']);
  }  

}
