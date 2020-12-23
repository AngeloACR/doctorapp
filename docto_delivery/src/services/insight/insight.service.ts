import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class InsightService {

  constructor() { }

  async getFilasEarnings(){ // insight
    let filas= [
      {
        fila: "250"
      },
      {
        fila: "200"
      },
      {
        fila: "150"
      },
      {
        fila: "100"
      },
      {
        fila: "50"
      },
      {
        fila: "0"
      }
    ];
    return filas
  }

  async getColumnasEarnings(){ // insight
    let columnas= [
      {
        hora: "10:00",
        alto: "100%",
        ganancia: "$222.50"
      },
      {
        hora: "11:00",
        alto: "71%",
        ganancia: "$152.50"
      },
      {
        hora: "12:00",
        alto: "87%",
        ganancia: "$201.50"
      },
      {
        hora: "13:00",
        alto: "79%",
        ganancia: "$175.50"
      },
      {
        hora: "14:00",
        alto: "49%",
        ganancia: "$140.50"
      },
      {
        hora: "15:00",
        alto: "0%"
      },
      {
        hora: "17:00",
        alto: "05%"
      },
      {
        hora: "18:00",
        alto: "05%"
      },
      {
        hora: "19:00",
        alto: "05%"
      },
      {
        hora: "20:00",
        alto: "05%"
      },
      {
        hora: "21:00",
        alto: "05%"
      },
      {
        hora: "22:00",
        alto: "05%"
      },
      {
        hora: "23:00",
        alto: "05%"
      },
      {
        hora: "24:00",
        alto: "05%"
      },
    ];
    return columnas
  }

  async getFilasOrders(){ // insight
    let filas= [
      {
        fila: "10"
      },
      {
        fila: "8"
      },
      {
        fila: "6"
      },
      {
        fila: "4"
      },
      {
        fila: "2"
      },
      {
        fila: "0"
      }
    ];
    return filas
  }

  async getColumnasOrders(){ // insight
    let columnas= [
      {
        hora: "10:00",
        alto: "70%",
        pedido: "9"
      },
      {
        hora: "11:00",
        alto: "71%",
        pedido: "8"
      },
      {
        hora: "12:00",
        alto: "100%",
        pedido: "10"
      },
      {
        hora: "13:00",
        alto: "79%",
        pedido: "7"
      },
      {
        hora: "14:00",
        alto: "49%",
        pedido: "5"
      },
      {
        hora: "15:00",
        alto: "0%"
      },
      {
        hora: "17:00",
        alto: "05%"
      },
      {
        hora: "18:00",
        alto: "05%"
      },
      {
        hora: "19:00",
        alto: "05%"
      },
      {
        hora: "20:00",
        alto: "05%"
      },
      {
        hora: "21:00",
        alto: "05%"
      },
      {
        hora: "22:00",
        alto: "05%"
      },
      {
        hora: "23:00",
        alto: "05%"
      },
      {
        hora: "24:00",
        alto: "05%"
      },
    ];
    return columnas
  }
} 
