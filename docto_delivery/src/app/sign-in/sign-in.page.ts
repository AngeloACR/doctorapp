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
  selector: "app-sign-in",
  templateUrl: "./sign-in.page.html",
  styleUrls: ["./sign-in.page.scss"]
})
export class SignInPage implements OnInit {
  login: FormGroup;
  constructor(private navCtrl: NavController, private route: Router) {}

  ngOnInit() {
    this.login = new FormGroup({
      email: new FormControl(""),
      password: new FormControl("")
    });
  }
  tabs() {
    this.navCtrl.navigateRoot(["./home"]);
  }
  continue() {
    this.route.navigate(["./register"]);
  }
}
