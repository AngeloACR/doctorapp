import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class FeedbackService {

  constructor() { }

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
