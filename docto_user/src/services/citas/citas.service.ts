import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CitasService {

  constructor() { }

  async getCitas(){
    let citas = [
      {
        dia: "WEB",
        fecha: "12",
        hora: "12:00",
        imagenPerfil: "assets/images/doc4.png",
        nombreDoctor: "Dr. Joseph Williamson",
        especialidadDoctor: "Cadiac Surgeon",
        hospital: "At Apple Hospital",
        direccionCita: "Walter street, Wallington, New York.",
        falta: "3 days"
      },
      {
        dia: "TUE",
        fecha: "18",
        hora: "14:00",
        imagenPerfil: "assets/images/doc6.png",
        nombreDoctor: "Dr. Anglina Taylor",
        especialidadDoctor: "Neurosurgeon",
        direccionCita: "At Rainbow Hospital, MG street, Wallington, New York."
      },
      {
        dia: "WEB",
        fecha: "12",
        hora: "12:00",
        imagenPerfil: "assets/images/doc4.png",
        nombreDoctor: "Dr. Joseph Williamson",
        especialidadDoctor: "Cadiac Surgeon",
        direccionCita: "At Apple Hospital, Walter street, Wallington, New York."
      },
      {
        dia: "WEB",
        fecha: "12",
        hora: "12:00",
        imagenPerfil: "assets/images/doc4.png",
        nombreDoctor: "Dr. Joseph Williamson",
        especialidadDoctor: "Cadiac Surgeon",
        direccionCita: "At Apple Hospital, Walter street, Wallington, New York."
      },
      {
        dia: "TUE",
        fecha: "18",
        hora: "14:00",
        imagenPerfil: "assets/images/doc6.png",
        nombreDoctor: "Dr. Anglina Taylor",
        especialidadDoctor: "Neurosurgeon",
        direccionCita: "At Rainbow Hospital, MG street, Wallington, New York."
      },
      {
        dia: "TUE",
        fecha: "18",
        hora: "14:00",
        imagenPerfil: "assets/images/doc6.png",
        nombreDoctor: "Dr. Anglina Taylor",
        especialidadDoctor: "Neurosurgeon",
        direccionCita: "At Rainbow Hospital, MG street, Wallington, New York."
      },
    ];
    return citas
  }

  async getPerfilCitas(){
    let getPerfilCitas = [
      {
        dia: "WEB",
        fecha: "12",
        hora: "12:00",
        imagenPerfil: "assets/images/doc4.png",
        nombreDoctor: "Dr. Joseph Williamson",
        especialidadDoctor: "Cadiac Surgeon",
        hospital: "At Apple Hospital",
        direccionCita: "Walter street, Wallington, New York.",
        falta: "3 days",
        solicitante: "Emmili Johnson",
        solicitantePhone: "+1 987 654 3210",
        citaNro: "6654172",
        motivoCita: "Just for reference purpose"
      }
    ];
    return getPerfilCitas
  }
}
