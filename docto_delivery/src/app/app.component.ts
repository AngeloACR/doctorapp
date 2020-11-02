import { Component, OnInit, Inject } from "@angular/core";

import { Platform } from "@ionic/angular";
import { SplashScreen } from "@ionic-native/splash-screen/ngx";
import { StatusBar } from "@ionic-native/status-bar/ngx";
import { TranslateService } from "@ngx-translate/core";
import { NavController } from "@ionic/angular";
import { APP_CONFIG, AppConfig } from "./app.config";
import { MyEvent } from "src/services/myevent.services";
import { Constants } from "src/models/contants.models";
import { Router } from "@angular/router";
@Component({
  selector: "app-root",
  templateUrl: "app.component.html",
  styleUrls: ["app.component.scss"]
})
export class AppComponent implements OnInit {
  rtlSide = "left";
  public selectedIndex = 0;
  public appPages = [
    {
      title: "wallet",
      url: "/wallet",
      icon: "zmdi zmdi-balance-wallet"
    },
    {
      title: "home",
      url: "/home",
      icon: "zmdi zmdi-home"
    },
    {
      title: "insight",
      url: "/insight",
      icon: "zmdi zmdi-chart"
    },
    {
      title: "change_language",
      url: "/change-language",
      icon: "zmdi zmdi-globe"
    },
    {
      title: "contact_us",
      url: "/contact-us",
      icon: "zmdi zmdi-email"
    },
    {
      title: "terms_conditions",
      url: "/tnc",
      icon: "zmdi zmdi-assignment"
    },
    {
      title: "faqs",
      url: "/faq",
      icon: "zmdi zmdi-assignment-alert"
    },
    {
      title: "logout",
      url: "/sign-in",
      icon: "zmdi zmdi-open-in-new"
    }
  ];
  showSplash: boolean = true;
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

        this.router.navigateByUrl("");
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

  ngOnInit() {
    const path = window.location.pathname.split("folder/")[1];
    if (path !== undefined) {
      this.selectedIndex = this.appPages.findIndex(
        page => page.title.toLowerCase() === path.toLowerCase()
      );
    }
  }

  buyAppAction() {
    window.open("https://bit.ly/cc_DoctoWorld", "_system", "location=no");
  }

  view_profile() {
    this.navCtrl.navigateRoot(["./profile"]);
  }
}
