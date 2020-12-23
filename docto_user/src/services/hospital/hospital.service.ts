import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class HospitalService {  

  constructor() { }

  async getSliderHospitales(){ // hospitals.page
    let imagenSlider= [
      {
        imagen: "assets/images/Slider2.png"
      },
      {
        imagen: "assets/images/Slider1.png"
      },
      {
        imagen: "assets/images/Slider.png"
      }
    ];
    return imagenSlider
  }

  async getHospitales(){ // hospitals.page
    let hospitales= [
      {
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        nombre: "Silver Leaf Hospital",
        especialidad: "Eye Care Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        nombre: "City Shine Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
    ];
    return hospitales
  }

  async getImgHospitales(){ // hospitals.page
    let imagenHospitales= [
      {
        imagen: "assets/images/h1.png",
      },
      {
        imagen: "assets/images/h2.png",
      },
      {
        imagen: "assets/images/h3.png",
      },
      {
        imagen: "assets/images/h4.png",
      },
      {
        imagen: "assets/images/h5.png",
      }
    ];
    return imagenHospitales
  }

  async getInfoHospital(){ // hospital-info.page
    let hospital= [
      {
        nombre: "Apple Hospital",
        especialidad: "General Hospital"
      }
    ];
    return hospital
  }

  async getDepartamentosHospital(){ // hospital-info.page
    let departamentos= [
      {
        nombre: "Hypertension Treatment"
      },
      {
        nombre: "COPD Treatment"
      },
      {
        nombre: "Diabetes Management"
      },
      {
        nombre: "ECG"
      },
      {
        nombre: "Obesity Treatment"
      },
      {
        nombre: "Health Checkup (General)"
      },
      {
        nombre: "Fever Treatment"
      },
      {
        nombre: "Non Interventional Cardiology"
      },
      {
        nombre: "Diabetology"
      },
    ];
    return departamentos
  }

  async gethoraHospital(){ // hospital-info.page
    let horario= [
      {
        lunes: "12:00 to 13:00",
        martes: "12:00 to 13:00",
        miercoles: "12:00 to 13:00",
        jueves: "12:00 to 13:00",
        viernes: "Closed",
        sabado: "11:00 to 12:00",
        domingo: "CLosed"
      }
    ];
    return horario
  }

  async getDireccionHospital(){ // hospital-info.page
    let direccion= [
      {
        principal: "Batra & Sons Hospitall",
        direccion: "JJ towers, Johnson street, Hemilton, Newyork",
        mapa: "assets/images/map.png"
      }
    ];
    return direccion
  }
}
