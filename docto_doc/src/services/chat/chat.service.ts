import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  constructor() { } 

  async getPerfilChat(){ // chat.page
    let perfilChat= [
      {
        img: "assets/images/8.png",
        nombre: "Emili Johnson",
        fecha: "12 JUL, 12:20",
        causa: "Chest Pain from last 5 days"
      }
    ];
    return perfilChat
  }

  async getChat(){ // chat.page
    let chat= [
      {
        enviado: "Hello Emilli, I hope you remember about your appoitment today with us.",
        recibido: "Hello Doctor, Yes i remember. I will be there right on time",
        horaEnviada: "12:15 pm",
        horaRecibida: "12:15 pm"
      }
    ];
    return chat
  }
}
