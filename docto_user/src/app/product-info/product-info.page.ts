import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { MedicamentosService } from "../../services/medicamentos/medicamentos.service";
@Component({
  selector: 'app-product-info',
  templateUrl: './product-info.page.html',
  styleUrls: ['./product-info.page.scss'],
})
export class ProductInfoPage implements OnInit {
   favorite_icon = false;
   tab: string = "about";	
  gaming: string = "1";
  
  perfilProducto: any;
  reviews: any;
  producto: any;

  constructor(private route: Router, private medicamentos: MedicamentosService) { }

  async ngOnInit() {
    this.perfilProducto = await this.medicamentos.getPerfilProducto();
    this.reviews = await this.medicamentos.getRevierProducto();
    this.producto = await this.medicamentos.getProducto();
  }

toggleSaveIcon1() {
    this.favorite_icon = !this.favorite_icon;
  }
	
 cart() {
    this.route.navigate(['./my-cart']);
  }  
}
