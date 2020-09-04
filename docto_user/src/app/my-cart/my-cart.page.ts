import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-my-cart',
  templateUrl: './my-cart.page.html',
  styleUrls: ['./my-cart.page.scss'],
})
export class MyCartPage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  }
	
 checkout() {
    this.route.navigate(['./select-address']);
  } 

}
 