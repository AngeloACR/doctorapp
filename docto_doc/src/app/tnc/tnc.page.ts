import { Component, OnInit } from '@angular/core';

import { TerminoscondicionesService } from "../../services/terminoscondiciones/terminoscondiciones.service";

@Component({
  selector: 'app-tnc',
  templateUrl: './tnc.page.html',
  styleUrls: ['./tnc.page.scss'],
})
export class TncPage implements OnInit {

  terminosCondiciones: any;

  constructor(private condiciones: TerminoscondicionesService) { }

  async ngOnInit() {
    this.terminosCondiciones = await this.condiciones.getTerminoscondiciones();
  }

}
