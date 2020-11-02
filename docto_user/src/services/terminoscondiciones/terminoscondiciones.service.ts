import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class TerminoscondicionesService {

  constructor() { }

  async getTerminoscondiciones(){
    let terminosCondiciones= [
      {
        contenido: "Contrary to popular belief, Lorem Ipsum is"
      }
    ];
    return terminosCondiciones
  }
}
