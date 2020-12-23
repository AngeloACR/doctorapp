import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { BancoService } from "../../services/banco/banco.service";


@Component({
  selector: 'app-wallet',
  templateUrl: './wallet.page.html',
  styleUrls: ['./wallet.page.scss'],
})
export class WalletPage implements OnInit {

  constructor(private route: Router, private banco: BancoService) { } 

  balance: any;
  pedidos: any;

  async ngOnInit() {
    this.balance = await this.banco.getPerfilWallet();
    this.pedidos = await this.banco.getPedidos();
  }

 send_to_bank() {
    this.route.navigate(['./send-to-bank']);
  } 
	
	
}
