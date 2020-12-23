import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DoctorService { 

  constructor() { }

  async getInfoBanner(){ // my-profile.page
    let infoBanner= [
      {
        imgPerfil: "assets/images/doc_profile.png",
        imgBanner: "assets/images/doc4.png"
      }
    ];
    return infoBanner
  }

  async getPerfil(){ // my-profile.page
    let perfil= [
      {
        nombre: "Dr.Joseph Williamson",
        telefono: "987 654 3210",
        correo: "josephewilliamson.com",
        hospital: "Apple Hospital",
        direccion: "Wallington, New York",
        experiencia: "18 years",
        costo: "$28",
      }
    ];
    return perfil
  }

  async getDegree() { //add-degre.page
    let degree = [
      {
        check: "true",
        titulo: "MBBS"
      },
      {
        check: "false",
        titulo: "Medical schoo"
      },
      {
        check: "true",
        titulo: "Bachelor of Medicine"
      },
      {
        check: "true",
        titulo: "Bachelor of Surgery"
      },
      {
        check: "true",
        titulo: "Bachelor of Medical Sciences"
      },
      {
        check: "false",
        titulo: "Master of Medicine"
      },
      {
        check: "true",
        titulo: "Master of Surgery"
      },
    ];
    return degree;
  }

  async getDegrees(){ // my-profile.page
    let degrees= [
      {
        titulo: "MBBS"
      },
      {
        titulo: "MCH - Cardio Thrscic & Vadcular Surgery"
      },
      {
        titulo: "FRCS Surgery"
      }
    ];
    return degrees
  }

  async getServicio() { //add-services.page
    let servicio = [
      {
        check: "true",
        titulo: "COPD Treatment"
      },
      {
        check: "false",
        titulo: "Diabetes Management"
      },
      {
        check: "true",
        titulo: "ECG"
      },
      {
        check: "true",
        titulo: "Obesity treatment"
      },
      {
        check: "true",
        titulo: "Health Checkup (General)"
      },
      {
        check: "false",
        titulo: "COPD Treatment"
      },
      {
        check: "true",
        titulo: "Fever Treatment"
      },
      {
        check: "true",
        titulo: "COPD Treatment"
      },
      {
        check: "false",
        titulo: "Diabetes Management"
      },
      {
        check: "true",
        titulo: "ECG"
      },
      {
        check: "true",
        titulo: "Obesity treatment"
      },
      {
        check: "true",
        titulo: "Health Checkup (General)"
      },
      {
        check: "false",
        titulo: "COPD Treatment"
      },
      {
        check: "true",
        titulo: "Fever Treatment"
      },
    ];
    return servicio;
  }

  async getServicios(){ // my-profile.page
    let servicios= [
      {
        titulo: "Hypertension Treatment"
      },
      {
        titulo: "COPD Treatment"
      },
      {
        titulo: "Diabetes Management"
      },
      {
        titulo: "ECG"
      },
      {
        titulo: "Obesity treatment"
      },
      {
        titulo: "Health Checkup (General)"
      },
      {
        titulo: "Fever Treatment"
      }
    ];
    return servicios
  }

  async getEspecialidad() { //add-especializations.page
    let degree = [
      {
        check: "true",
        titulo: "MBBS"
      },
      {
        check: "false",
        titulo: "Medical schoo"
      },
      {
        check: "true",
        titulo: "Bachelor of Medicine"
      },
      {
        check: "true",
        titulo: "Bachelor of Surgery"
      },
      {
        check: "true",
        titulo: "Bachelor of Medical Sciences"
      },
      {
        check: "false",
        titulo: "Master of Medicine"
      },
      {
        check: "true",
        titulo: "Master of Surgery"
      },
    ];
    return degree;
  }

  async getEspecializacion(){ // my-profile.page
    let especializacion= [
      {
        titulo: "General Physician"
      },
      {
        titulo: "Family Physician"
      },
      {
        titulo: "General Physician"
      },
      {
        titulo: "Cardiologist"
      },
      {
        titulo: "Consultant Physician"
      },
      {
        titulo: "Diabetologist"
      },
      {
        titulo: "Family Physician"
      },
      {
        titulo: "General Physician"
      }
    ];
    return especializacion
  }

  async getHospital() { //add-hospital.page
    let degree = [
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "false",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "false",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "false",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      },
      {
        check: "true",
        nombre: "Apple Hospital",
        especialidad: "General Hospital",
        direccion: "At Walter street, Wallington, New York."
      }
    ];
    return degree;
  }

  async getDisponibilidad(){ // my-profile.page
    let disponibilidad= [
      {
        check: "true",
        dia: "mon",
        desde: "12:00",
        hasta: "12:00"
      },
      {
        check: "true",
        dia: "tue",
        desde: "12:00",
        hasta: "12:00"
      },
      {
        check: "true",
        dia: "web",
        desde: "12:00",
        hasta: "12:00"
      },
      {
        check: "true",
        dia: "thu",
        desde: "12:00",
        hasta: "12:00"
      },
      {
        check: "false",
        dia: "fri",
        desde: "00:00",
        hasta: "00:00"
      },
      {
        check: "true",
        dia: "sat",
        desde: "12:00",
        hasta: "12:00"
      },
      {
        check: "false",
        dia: "sun",
        desde: "00:00",
        hasta: "00:00"
      },
    ];
    return disponibilidad
  }
}
