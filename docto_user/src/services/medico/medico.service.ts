import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class MedicoService {
  constructor() {}

  async getEspecializaciones() {
    let especializaciones = [
      {
        descripcion: "Addiction psychiatrist",
        codigo: 124
      },
      {
        descripcion: "Addiction psychiatrist",
        codigo: 134
      },
      {
        descripcion: "Addiction psychiatrist",
        codigo: 154
      },
      {
        descripcion: "Addiction psychiatrist",
        codigo: 164
      },
      {
        descripcion: "Addiction psychiatrist",
        codigo: 174
      },
      {
        descripcion: "Addiction psychiatrist",
        codigo: 184
      }
    ];
    return especializaciones;
  }

  async getPerfilDelMedico() {}
}
