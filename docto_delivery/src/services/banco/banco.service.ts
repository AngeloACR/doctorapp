import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class BancoService {

  constructor() { } 

  async getPerfilWallet(){ // wallet.page y send-to-bank.page
    let perfil= [
      {
        balance: "$ 520.50",
      }
    ];
    return perfil
  }

  async getPedidos(){ // wallet
    let pedido= [
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "Emilli Wlliamson",
        cantidad: "2",
        fecha: "30 Jun 2018, 10:38",
        costo: "$110.00",
        estado: "COD",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "sent_to_bank",
        fecha: "30 Jun 2018, 11:59",
        precio: "$-100.00",
        pago: "sent_to_bank"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "sent_to_bank",
        fecha: "30 Jun 2018, 11:59",
        precio: "$-100.00",
        pago: "sent_to_bank"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "sent_to_bank",
        fecha: "30 Jun 2018, 11:59",
        precio: "$-100.00",
        pago: "sent_to_bank"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
      {
        nombre: "sent_to_bank",
        fecha: "30 Jun 2018, 11:59",
        precio: "$-100.00",
        pago: "sent_to_bank"
      },
      {
        nombre: "Sam Smith",
        cantidad: "3",
        fecha: "30 Jun 2018, 11:59",
        costo: "$80.00",
        estado: "Online",
        precio: "$5.20",
        pago: "earnings"
      },
    ];
    return pedido
  }
}
