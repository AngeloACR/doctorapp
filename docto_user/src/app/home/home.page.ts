import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { MedicamentosService } from "../../services/medicamentos/medicamentos.service";

@Component({
  selector: 'app-home', 
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {

  imgSlider: any;
  categoriamedicamentos: any;

  constructor( private route: Router, private medicamentos: MedicamentosService) { }

  async ngOnInit() {
    this.imgSlider = await this.medicamentos.getSliderMedicamentos();
    this.categoriamedicamentos = await this.medicamentos.getCategoriaMedicamentos();
  }
	
 categories() {
    this.route.navigate(['./categories']);
  } 
 set_location() {
    this.route.navigate(['./add-address']);
  } 
 cart() {
    this.route.navigate(['./my-cart']);
  }  
 search() {
    this.route.navigate(['./specilities']);
  } 

}
