import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DeliveryService {

  constructor() { }

  async getPosicionDelivery(){ // profile.page y chat.page y order-history
    let posicion= [
      {
        imgMap: "assets/images/map.png",
        top: "19%",
        right: "88%",
        rotacion: "rotate(-192deg)",
        distancia: "16.5",
        tiempo: "20",
        nombreInicio: "WallkHeart Medicla Store",
        direccionInicio: "1024, Hemioton Street, Union Market, USA",
        nombreLlegada: "Sam Smith",
        direccionLlegada: "D-32, Deniel Street, Centerl Residency",
        costo: "5.20", //order-history
        fecha: "30 Jun 2018, 11:59 am" //order-history
      }
    ];
    return posicion
  }

  async getPedido(){ // profile.page
    let pedido= [
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
      {
        nombre: "Vics VapoRub Balm",
        pack: "500gm",
        precio: "6.00",
      },
    ];
    return pedido
  }

  async getTotal(){ // profile.page
    let valor= [
      {
        total: "20"
      }
    ];
    return valor
  }

  async getDelivered(){ // delivered-succesfully.page
    let correcto= [
      {
        tiempo: "18",
        valor: "6.5",
        costo: "8.50"

      }
    ];
    return correcto
  }
}
