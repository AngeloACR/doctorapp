import { Component, Inject } from "@angular/core";

import { Platform, NavController } from "@ionic/angular";
import { SplashScreen } from "@ionic-native/splash-screen/ngx";
import { StatusBar } from "@ionic-native/status-bar/ngx";
import { TranslateService } from "@ngx-translate/core";
import { Constants } from "src/models/contants.models";
import { APP_CONFIG, AppConfig } from "./app.config";
import { MyEvent } from "src/services/myevent.services";
import { Router } from "@angular/router";

@Component({
  selector: "app-root",
  templateUrl: "app.component.html",
  styleUrls: ["app.component.scss"]
})
export class AppComponent {
  showSplash: boolean = true;
  rtlSide = "left";
  constructor(
    @Inject(APP_CONFIG) public config: AppConfig,
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private router: Router,
    private translate: TranslateService,
    private navCtrl: NavController,
    private myEvent: MyEvent
  ) {
    this.initializeApp();
    this.myEvent.getLanguageObservable().subscribe(value => {
      this.navCtrl.navigateRoot(["./"]);
      this.globalize(value);
    });
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
      this.router.navigateByUrl("splash");
      setTimeout(async () => {
        this.showSplash = false;

        //this.router.navigateByUrl("");
      }, 7000);
      let defaultLang = window.localStorage.getItem(
        Constants.KEY_DEFAULT_LANGUAGE
      );
      this.globalize(defaultLang);
    });
  }

  globalize(languagePriority) {
    this.translate.setDefaultLang("en");
    let defaultLangCode = this.config.availableLanguages[0].code;
    this.translate.use(
      languagePriority && languagePriority.length
        ? languagePriority
        : defaultLangCode
    );
    this.setDirectionAccordingly(
      languagePriority && languagePriority.length
        ? languagePriority
        : defaultLangCode
    );
  }

  setDirectionAccordingly(lang: string) {
    switch (lang) {
      case "ar": {
        this.rtlSide = "rtl";
        break;
      }
      default: {
        this.rtlSide = "ltr";
        break;
      }
    }
  }
}
