import { Injectable } from '@angular/core';

@Injectable({ 
  providedIn: 'root'
})
export class MedicamentosService {

  constructor() { }

  async getSliderMedicamentos(){ // home.page
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

  async getCategoriaMedicamentos(){ // home.page y categories.page
    let categoria= [
      {
        imagen: "assets/images/m1.png",
        nombre: "OTC Medicines"
      },
      {
        imagen: "assets/images/m2.png",
        nombre: "Health Aid"
      },
      {
        imagen: "assets/images/m3.png",
        nombre: "Wallness"
      },
      {
        imagen: "assets/images/m4.png",
        nombre: "Diabetes"
      },
      {
        imagen: "assets/images/m5.png",
        nombre: "Personal Care"
      },
      {
        imagen: "assets/images/m1.png",
        nombre: "Baby & Mother"
      }
    ];
    return categoria
  }

  async getListaProductos(){ // home.page y categories.page
    let lista= [
      {
        categoria: "First Aid"
      },
      {
        categoria: "Health Care"
      },
      {
        categoria: "Mens Care"
      },
      {
        categoria: "Womens Care"
      },
      {
        categoria: "Sexul Wallness"
      },
      {
        categoria: "Other"
      }
    ];
    return lista
  }

  async getProducto() { // product-list.page
    let producto= [
      {
        imagenProducto: "assets/images/med1.png",
        nombre: "Vicks VapoRub",
        tipo: "Balm",
        precio: "$6.00"
      },
      {
        imagenProducto: "assets/images/med2.png",
        nombre: "Salospir",
        tipo: "Tablets",
        precio: "$17.00"
      },
      {
        imagenProducto: "assets/images/med3.png",
        nombre: "Xenical 120 mg",
        tipo: "Tablets",
        precio: "$7.40"
      },
      {
        imagenProducto: "assets/images/med4.png",
        nombre: "Arbor-OTC",
        tipo: "Tablets",
        precio: "$3.00"
      },
      {
        imagenProducto: "assets/images/med5.png",
        nombre: "Vicks VapoRub",
        tipo: "Balm",
        precio: "$6.00"
      },
      {
        imagenProducto: "assets/images/med6.png",
        nombre: "Allergy Relief",
        tipo: "Tablets",
        precio: "$10.00"
      },
      {
        imagenProducto: "assets/images/med1.png",
        nombre: "Vicks VapoRub",
        tipo: "Balm",
        precio: "$6.00"
      },
      {
        imagenProducto: "assets/images/med1.png",
        nombre: "Vicks VapoRub",
        tipo: "Balm",
        precio: "$6.00"
      },
    ];
    return producto  
  }

  async getPerfilProducto() { // product-info.page
    let producto= [
      {
        imagenProducto: "assets/images/med1.png",
        nombre: "Vicks VapoRub",
        tipo: "Balm",
        categoria: "Health Care Product",
        voto: "(152)",
        descripcion: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
      }
    ];
    return producto  
  }

  async getRevierProducto() { // product-info.page
    let review= [
      {
        imagenUsuario: "assets/images/4.png",
        nombreUsuario: "Ronny George",
        puntuacion: "5.0",
        for: "Cold Fever",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenUsuario: "assets/images/7.png",
        nombreUsuario: "Reena Roy",
        puntuacion: "4.0",
        for: "Cold Fever",
        fecha: "15 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenUsuario: "assets/images/7.png",
        nombreUsuario: "Herry Johnson",
        puntuacion: "1.0",
        for: "HeadAche",
        fecha: "12 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenUsuario: "assets/images/8.png",
        nombreUsuario: "Ronny George",
        puntuacion: "5.0",
        for: "Cold Fever",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenUsuario: "assets/images/4.png",
        nombreUsuario: "Ronny George",
        puntuacion: "5.0",
        for: "Cold Fever",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
      {
        imagenUsuario: "assets/images/8.png",
        nombreUsuario: "Ronny George",
        puntuacion: "5.0",
        for: "Cold Fever",
        fecha: "20 Dec, 2017",
        comentarios: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
      },
    ];
    return review  
  }
}
