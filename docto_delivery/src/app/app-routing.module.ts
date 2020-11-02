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
    path: "sign-in",
    loadChildren: () =>
      import("./sign-in/sign-in.module").then(m => m.SignInPageModule)
  },
  {
    path: "splash",
    component: SplashComponent
  },
  {
    path: "register",
    loadChildren: () =>
      import("./register/register.module").then(m => m.RegisterPageModule)
  },
  {
    path: "tnc",
    loadChildren: () => import("./tnc/tnc.module").then(m => m.TncPageModule)
  },
  {
    path: "faq",
    loadChildren: () => import("./faq/faq.module").then(m => m.FaqPageModule)
  },
  {
    path: "contact-us",
    loadChildren: () =>
      import("./contact-us/contact-us.module").then(m => m.ContactUsPageModule)
  },
  {
    path: "verification",
    loadChildren: () =>
      import("./verification/verification.module").then(
        m => m.VerificationPageModule
      )
  },
  {
    path: "home",
    loadChildren: () => import("./home/home.module").then(m => m.HomePageModule)
  },
  {
    path: "chat",
    loadChildren: () => import("./chat/chat.module").then(m => m.ChatPageModule)
  },
  {
    path: "delivered-succesfully",
    loadChildren: () =>
      import("./delivered-succesfully/delivered-succesfully.module").then(
        m => m.DeliveredSuccesfullyPageModule
      )
  },
  {
    path: "wallet",
    loadChildren: () =>
      import("./wallet/wallet.module").then(m => m.WalletPageModule)
  },
  {
    path: "send-to-bank",
    loadChildren: () =>
      import("./send-to-bank/send-to-bank.module").then(
        m => m.SendToBankPageModule
      )
  },
  {
    path: "order-history",
    loadChildren: () =>
      import("./order-history/order-history.module").then(
        m => m.OrderHistoryPageModule
      )
  },
  {
    path: "profile",
    loadChildren: () =>
      import("./profile/profile.module").then(m => m.ProfilePageModule)
  },
  {
    path: "insight",
    loadChildren: () =>
      import("./insight/insight.module").then(m => m.InsightPageModule)
  },
  {
    path: "offline",
    loadChildren: () =>
      import("./offline/offline.module").then(m => m.OfflinePageModule)
  },
  {
    path: "new-delivery",
    loadChildren: () =>
      import("./new-delivery/new-delivery.module").then(
        m => m.NewDeliveryPageModule
      )
  },
  {
    path: "accepted",
    loadChildren: () =>
      import("./accepted/accepted.module").then(m => m.AcceptedPageModule)
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
