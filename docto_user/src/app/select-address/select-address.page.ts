import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-select-address',
  templateUrl: './select-address.page.html',
  styleUrls: ['./select-address.page.scss'],
})
export class SelectAddressPage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  }
	
 add_new() {
    this.route.navigate(['./add-address']);
  }  
 select_paymet_method() {
    this.route.navigate(['./select-paymet-method']);
  } 

}
