import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AppointmentsService {

  constructor() { } 

  async getAppointments(){ // appointments.page
    let appointments= [
      {
        mes: "JUL",
        dia: "12",
        hora: "12:00",
        img: "assets/images/8.png",
        nombre: "Emili Johnson",
        causa: "Chest Pain fromlast 5 days"
      },
      {
        mes: "JUL",
        dia: "13",
        hora: "11:00",
        img: "assets/images/doc3.png",
        nombre: "Lisa Devis",
        causa: "Lungs infection"
      },
      {
        mes: "JUL",
        dia: "12",
        hora: "12:00",
        img: "assets/images/8.png",
        nombre: "Emili Johnson",
        causa: "Chest Pain fromlast 5 days"
      },
      {
        mes: "JUL",
        dia: "14",
        hora: "14:00",
        img: "assets/images/4.png",
        nombre: "Rodriks Hemilton",
        causa: "Uper Chest Pain"
      },
      {
        mes: "JUL",
        dia: "12",
        hora: "12:00",
        img: "assets/images/8.png",
        nombre: "Emili Johnson",
        causa: "Chest Pain fromlast 5 days"
      },
      {
        mes: "JUL",
        dia: "12",
        hora: "12:00",
        img: "assets/images/8.png",
        nombre: "Emili Johnson",
        causa: "Chest Pain fromlast 5 days"
      },
      {
        mes: "JUL",
        dia: "12",
        hora: "12:00",
        img: "assets/images/8.png",
        nombre: "Emili Johnson",
        causa: "Chest Pain fromlast 5 days"
      },
    ];
    return appointments
  }
}
