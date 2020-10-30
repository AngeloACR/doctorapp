import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class MedicoService {
  constructor() {}

  async getEspecialistas() { // aplicado en doctors
    let especialistas = [
      {
        titulo: "Cardiologist"
      },
      {
        titulo: "Ophthalmologist"
      },
      {
        titulo: "Dermatologist"
      }
    ];
    return especialistas;
  }

  async getImgSliders() { // aplicado en doctors
    let sliders = [
      {
        imagen: "assets/images/Slider1.png"
      },
      {
        imagen: "assets/images/Slider.png"
      },
      {
        imagen: "assets/images/Slider2.png"
      },
    ];
    return sliders;
  }

  async getTipos() { // aplicado en doctors
    let tipos = [
      {
        imagen: "assets/images/ic_doctors.png",
        titulo: "doctors"
      },
      {
        imagen: "assets/images/ic_dentist.png",
        titulo: "dentist"
      },
      {
        imagen: "assets/images/ic_ayurvedic.png",
        titulo: "ayurvedic"
      },
      {
        imagen: "assets/images/ic_therapist.png",
        titulo: "therapist"
      }
    ];
    return tipos;
  }

  async getEspecializaciones() { // aplicado en doctors
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
      }
    ];
    return especializaciones;
  }

  async getDoctores() { // aplicado en list-of-doctors
    let doctores = [
      {
        imagen: "assets/images/doc4.png",
        nombre: "Dr. Joseph Williamoson",
        especialidad: "Cardiac Surgeon",
        ubicacion: "At Apple Hospital, Wallter street, Wallington, New York.",
        experiencia: "18 years",
        costo: "$30",

        votos: "(152)",
      },
      {
        imagen: "assets/images/doc4.png",
        nombre: "Dr. Joseph Williamoson",
        especialidad: "Cardiac Surgeon",
        ubicacion: "At Apple Hospital, Wallter street, Wallington, New York.",
        experiencia: "18 years",
        costo: "$30",
        votos: "(152)",
      },
      {
        imagen: "assets/images/doc6.png",
        nombre: "Dr. Anglina Taylor",
        especialidad: "Cardiac Surgeon",
        ubicacion: "At Rainbow Hospital, MG street, Wallington, New York.",
        experiencia: "22 years",
        costo: "$230",
        votos: "(151)",
      },
      {
        imagen: "assets/images/doc5.png",
        nombre: "Dr. Adom Johnson",
        especialidad: "Cardiac Surgeon",
        ubicacion: "At Opus Clinic, Edion street, Wallington, New York.",
        experiencia: "15 years",
        costo: "$28",
        votos: "(124)",
      },
    ];
    return doctores;
  }

  async getDoctorProfile() { // aplicado en doctor-profile y en add-feedback.page
    let doctorProfile = [
      {
        imagenCabecera: "assets/images/doc_profile.png",
        imagenLittle: "assets/images/doc4.png",
        nombre: "Dr. Joseph Williamson",
        especialidad: "Caric Surgeon",
        titulo: "MBBS, MCh - Cardio Theracic & Vascular Surgery, FRCS Surgey",
        hospital: "Apple Hospital"
      }
    ];
    return doctorProfile;
  }

  async getOverviewProfile() { // aplicado en doctor-profile
    let overviewProfile = [
      {
        experiencia: "18 years",
        valor: "4.9",
        votos: "(124)",
        consulta: "$28",
        disponible: "12:00 to 13:00",
        imagenMap: "assets/images/map.png",
        imagenProfile: "assets/images/doc4.png"
      }
    ];
    return overviewProfile;
  }

  async getHospitalProfile() { // aplicado en doctor-profile
    let hospitalProfile = [
      {
        hospital: "Apple Hospital",
        direccion: "JJ towers, Johnson street, Hemilton, Newyork"
      }
    ];
    return hospitalProfile;
  }

  async getServiciosProfile() { // aplicado en doctor-profile
    let serviciosProfile = [
      {
        titulo: "Hypertension Treatment"
      },
      {
        titulo: "Health Checkup (General)"
      },
      {
        titulo: "COPD Treatment"
      },
      {
        titulo: "Fever Treatment"
      }
    ];
    return serviciosProfile;
  }

  async getEspecializacionesProfile() { // aplicado en doctor-profile
    let especializacionesProfile = [
      {
        titulo: "General Physician"
      },
      {
        titulo: "Family Physician"
      },
      {
        titulo: "Cardiologist"
      },
      {
        titulo: "Consultant Physician"
      }
    ];
    return especializacionesProfile;
  }

  async getTimeProfile() { // aplicado en doctor-profile
    let timeProfile = [
      {
        timemon: "12:00 to 13:00",
        timetue: "12:00 to 13:00",
        timewed: "12:00 to 13:00",
        timethu: "12:00 to 13:00",
        timefri: "Closed",
        timesat: "11:00 to 12:00",
        timesun: "Closed",
      }
    ];
    return timeProfile;
  }

  async getFeedbackProfile() { // aplicado en doctor-profile
    let feedbackProfile = [
      {
        imagenProfileFeedback: "assets/images/4.png",
        name: "Ronny George",
        valor: "5.0",
        visitado: "Viral Fever Treatment",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenProfileFeedback: "assets/images/7.png",
        name: "Reena Roy",
        valor: "4.0",
        visitado: "Wheezing",
        fecha: "15 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenProfileFeedback: "assets/images/4.png",
        name: "Ronny George",
        valor: "5.0",
        visitado: "Viral Fever Treatment",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenProfileFeedback: "assets/images/4.png",
        name: "Ronny George",
        valor: "5.0",
        visitado: "Viral Fever Treatment",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      }
    ];
    return feedbackProfile;
  }
}
