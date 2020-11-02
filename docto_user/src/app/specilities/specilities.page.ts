import { Component, OnInit } from '@angular/core';

import { MedicoService } from "../../services/medico/medico.service";

@Component({
  selector: 'app-specilities',
  templateUrl: './specilities.page.html',
  styleUrls: ['./specilities.page.scss'],
})
export class SpecilitiesPage implements OnInit {

  especialistas: any;

  constructor(private medico: MedicoService) { }

  async ngOnInit() {
    this.especialistas = await this.medico.getEspecialistas();
  }

}
