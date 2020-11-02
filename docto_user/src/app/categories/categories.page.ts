import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { MedicamentosService } from "../../services/medicamentos/medicamentos.service";

@Component({
  selector: 'app-categories',
  templateUrl: './categories.page.html',
  styleUrls: ['./categories.page.scss'],
})
export class CategoriesPage implements OnInit {
  tab: string = "otc";

  categoriamedicamentos: any;
  listaProducto: any;

  constructor(private route: Router, private medicamentos: MedicamentosService) { }

  async ngOnInit() {
    this.categoriamedicamentos = await this.medicamentos.getCategoriaMedicamentos();
    this.listaProducto = await this.medicamentos.getListaProductos();
  }
	
 cart() {
    this.route.navigate(['./my-cart']);
  } 
 product_list() {
    this.route.navigate(['./product-list']);
  }  

}
