import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';

import { DeliveryService } from "../../services/delivery/delivery.service";
import { ChatService } from "../../services/chat/chat.service";

@Component({ 
  selector: 'app-chat',
  templateUrl: './chat.page.html',
  styleUrls: ['./chat.page.scss'],
})
export class ChatPage implements OnInit {

  constructor(private modalController: ModalController, private chat: ChatService, private delivery: DeliveryService) { }

  posicion: any;
  mensaje: any;

  async ngOnInit() {
    this.posicion = await this.delivery.getPosicionDelivery();
    this.mensaje = await this.chat.getChat();
  }
 dismiss(){
   this.modalController.dismiss();
 }
}
