import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {

  constructor( private route: Router) { }

  ngOnInit() {
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
