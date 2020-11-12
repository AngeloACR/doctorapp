import { Component, OnInit } from '@angular/core';

import { TerminoscondicionesService } from "../../services/terminoscondiciones/terminoscondiciones.service";

@Component({
  selector: 'app-tnc',
  templateUrl: './tnc.page.html',
  styleUrls: ['./tnc.page.scss'],
})
export class TncPage implements OnInit { 

  constructor(private condiciones: TerminoscondicionesService) { }

  terminosCondiciones: any;

  async ngOnInit() {
    this.terminosCondiciones = await this.condiciones.getTerminoscondiciones();
  }

}
 