import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  constructor() { } 

  async getDelivery(){ // home.page y insight
    let delivery= [
      {
        ordenes: "64",
        km: "68",
        costo: "302.50"
      }
    ];
    return delivery
  }
}
