import { Component, OnInit } from '@angular/core'; 
import { Router } from '@angular/router';
@Component({
  selector: 'app-doctors',
  templateUrl: './doctors.page.html',
  styleUrls: ['./doctors.page.scss'],
})
export class DoctorsPage implements OnInit {

  constructor(private route: Router) { }

  ngOnInit() {
  }
	
 search() {
    this.route.navigate(['./specilities']);
  }
 list_of_doctors() {
    this.route.navigate(['./list-of-doctors']);
  }
 set_location() {
    this.route.navigate(['./add-address']);
  } 	
}
