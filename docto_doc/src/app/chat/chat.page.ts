import { Component, OnInit } from '@angular/core';

import { ChatService } from "../../services/chat/chat.service";

@Component({
  selector: 'app-chat',
  templateUrl: './chat.page.html', 
  styleUrls: ['./chat.page.scss'],
})
export class ChatPage implements OnInit {

  perfilChat: any;
  conversationChat: any;

  constructor(private chat: ChatService) { }

  async ngOnInit() {
    this.perfilChat = await this.chat.getPerfilChat();
    this.conversationChat = await this.chat.getChat();
  }

}
