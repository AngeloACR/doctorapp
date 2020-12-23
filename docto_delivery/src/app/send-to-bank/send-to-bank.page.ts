import { Component, OnInit } from '@angular/core';

import { BancoService } from "../../services/banco/banco.service";

@Component({
  selector: 'app-send-to-bank',
  templateUrl: './send-to-bank.page.html',
  styleUrls: ['./send-to-bank.page.scss'],
})
export class SendToBankPage implements OnInit {

  constructor(private banco: BancoService) { } 

  balance: any;

  async ngOnInit() {
    this.balance = await this.banco.getPerfilWallet();
  }

}
