import { Component, OnInit } from "@angular/core";
import { NavController } from "@ionic/angular";
import { Router } from "@angular/router";
import {
  FormBuilder,
  FormGroup,
  FormControl,
  FormArray,
  Validators
} from "@angular/forms";
@Component({
  selector: "app-register",
  templateUrl: "./register.page.html",
  styleUrls: ["./register.page.scss"]
})
export class RegisterPage implements OnInit {
  registro: FormGroup;
  constructor(private navCtrl: NavController, private route: Router) {}

  ngOnInit() {
    this.registro = new FormGroup({
      email: new FormControl(""),
      password: new FormControl(""),
      tlf: new FormControl(""),
      name: new FormControl("")
    });
  }
  sign_in() {
    this.navCtrl.navigateRoot(["./sign-in"]);
  }
  continue() {
    this.route.navigate(["./verification"]);
  }
}
