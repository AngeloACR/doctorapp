import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { MedicoService } from "../../services/medico/medico.service";

@Component({
  selector: "app-doctors",
  templateUrl: "./doctors.page.html",
  styleUrls: ["./doctors.page.scss"]
})
export class DoctorsPage implements OnInit {
  especializaciones: any;
  tipos: any;
  sliders: any;

  constructor(private route: Router, private medico: MedicoService) {}

  async ngOnInit() {
    this.especializaciones = await this.medico.getEspecializaciones();
    this.tipos = await this.medico.getTipos();
    this.sliders = await this.medico.getImgSliders();
  }

  search() {
    this.route.navigate(["./specilities"]);
  }
  list_of_doctors() {
    this.route.navigate(["./list-of-doctors"]);
  }
  set_location() {
    this.route.navigate(["./add-address"]);
  }
}
