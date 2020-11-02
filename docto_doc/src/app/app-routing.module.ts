import { NgModule } from "@angular/core";
import { PreloadAllModules, RouterModule, Routes } from "@angular/router";
import { SplashComponent } from "./splash/splash.component";

const routes: Routes = [
  {
    path: "",
    redirectTo: "sign-in",
    pathMatch: "full"
  },
  {
    path: "",
    loadChildren: () => import("./tabs/tabs.module").then(m => m.TabsPageModule)
  },
  {
    path: "splash",
    component: SplashComponent
  },
  {
    path: "sign-in",
    loadChildren: () =>
      import("./sign-in/sign-in.module").then(m => m.SignInPageModule)
  },
  {
    path: "register",
    loadChildren: () =>
      import("./register/register.module").then(m => m.RegisterPageModule)
  },
  {
    path: "verification",
    loadChildren: () =>
      import("./verification/verification.module").then(
        m => m.VerificationPageModule
      )
  },
  {
    path: "chat",
    loadChildren: () => import("./chat/chat.module").then(m => m.ChatPageModule)
  },
  {
    path: "feedback",
    loadChildren: () =>
      import("./feedback/feedback.module").then(m => m.FeedbackPageModule)
  },
  {
    path: "account",
    loadChildren: () =>
      import("./account/account.module").then(m => m.AccountPageModule)
  },
  {
    path: "my-profile",
    loadChildren: () =>
      import("./my-profile/my-profile.module").then(m => m.MyProfilePageModule)
  },
  {
    path: "add-hospital",
    loadChildren: () =>
      import("./add-hospital/add-hospital.module").then(
        m => m.AddHospitalPageModule
      )
  },
  {
    path: "add-degre",
    loadChildren: () =>
      import("./add-degre/add-degre.module").then(m => m.AddDegrePageModule)
  },
  {
    path: "add-services",
    loadChildren: () =>
      import("./add-services/add-services.module").then(
        m => m.AddServicesPageModule
      )
  },
  {
    path: "add-specializations",
    loadChildren: () =>
      import("./add-specializations/add-specializations.module").then(
        m => m.AddSpecializationsPageModule
      )
  },
  {
    path: "contact-us",
    loadChildren: () =>
      import("./contact-us/contact-us.module").then(m => m.ContactUsPageModule)
  },
  {
    path: "faq",
    loadChildren: () => import("./faq/faq.module").then(m => m.FaqPageModule)
  },
  {
    path: "tnc",
    loadChildren: () => import("./tnc/tnc.module").then(m => m.TncPageModule)
  },
  {
    path: "appointments",
    loadChildren: () =>
      import("./appointments/appointments.module").then(
        m => m.AppointmentsPageModule
      )
  },
  {
    path: "change-language",
    loadChildren: () =>
      import("./change-language/change-language.module").then(
        m => m.ChangeLanguagePageModule
      )
  }
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
