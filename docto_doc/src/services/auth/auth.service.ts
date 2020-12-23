import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { DatePipe } from "@angular/common";
import jwt_decode from "jwt-decode";
import { Storage } from "@ionic/storage";

@Injectable({
  providedIn: "root"
})
export class AuthService {
  endpoint = "/auth";

  today = new Date();

  localSource = "http://localhost:3400";

  serverSource = "";

  prodSource = "";

  //mySource = this.localSource;
  mySource = this.serverSource;

  constructor(
    private http: HttpClient,
    private datePipe: DatePipe,
    private storage: Storage
  ) {}

  login(logData: any) {
    let headers = new HttpHeaders();
    headers.append("Content-Type", "application/json");
    let body = {
      email: logData.email,
      password: logData.password
    };
    var address = this.mySource + this.endpoint + "/";
    return this.http.post(address, body, { headers: headers });
  }
  register(registerData: any) {
    let headers = new HttpHeaders();
    headers.append("Content-Type", "application/json");
    let body = {
      email: registerData.email,
      password: registerData.password,
      name: registerData.tlf,
      tlf: registerData.name,
      tipo: "Doctor"
    };
    var address = this.mySource + "/users" + "/";
    return this.http.post(address, body, { headers: headers });
  }
  logout() {
    this.storage.clear();
    window.location.reload();
  }

  storeData(storeData: any) {
    this.storage.set("token", storeData.token);
    this.storage.set("loggedIn", storeData.status);
  }

  resetPass(resetData: any) {}

  async decode() {
    try {
      let token = await this.storage.get("token");
      return jwt_decode(token);
    } catch (Error) {
      return null;
    }
  }

  async getType() {
    try {
      let user: any = await this.decode();
      let type = user.type;
      return type;
    } catch (Error) {
      return null;
    }
  }

  async getUsername() {
    try {
      let user: any = await this.decode();
      let username = user.username;
      return username;
    } catch (Error) {
      return null;
    }
  }
  async getId() {
    try {
      let user: any = await this.decode();
      let id = user.id;
      return id;
    } catch (Error) {
      return null;
    }
  }

  async isAuthenticated() {
    const loggedIn = await this.storage.get("loggedIn");
    const isLogged = loggedIn == "true";
    return isLogged;
  }

  async getToken() {
    const token = await this.storage.get("token");
    return token;
  }
}
