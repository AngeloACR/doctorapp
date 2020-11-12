import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  constructor() { }

  async getChat(){ // chat.page
    let chat= [
      {
        enviado: "Hey there?, How much time?",
        recibido: "On my way ma'm, Will reach in 10 mins.",
        horaEnviada: "12:15 pm",
        horaRecibida: "12:15 pm"
      }
    ];
    return chat
  }
}
