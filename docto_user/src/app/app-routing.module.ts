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
    path: "home",
    loadChildren: () => import("./home/home.module").then(m => m.HomePageModule)
  },
  {
    path: "categories",
    loadChildren: () =>
      import("./categories/categories.module").then(m => m.CategoriesPageModule)
  },
  {
    path: "product-list",
    loadChildren: () =>
      import("./product-list/product-list.module").then(
        m => m.ProductListPageModule
      )
  },
  {
    path: "product-info",
    loadChildren: () =>
      import("./product-info/product-info.module").then(
        m => m.ProductInfoPageModule
      )
  },
  {
    path: "my-cart",
    loadChildren: () =>
      import("./my-cart/my-cart.module").then(m => m.MyCartPageModule)
  },
  {
    path: "select-address",
    loadChildren: () =>
      import("./select-address/select-address.module").then(
        m => m.SelectAddressPageModule
      )
  },
  {
    path: "select-paymet-method",
    loadChildren: () =>
      import("./select-paymet-method/select-paymet-method.module").then(
        m => m.SelectPaymetMethodPageModule
      )
  },
  {
    path: "order-placed",
    loadChildren: () =>
      import("./order-placed/order-placed.module").then(
        m => m.OrderPlacedPageModule
      )
  },
  {
    path: "doctors",
    loadChildren: () =>
      import("./doctors/doctors.module").then(m => m.DoctorsPageModule)
  },
  {
    path: "specilities",
    loadChildren: () =>
      import("./specilities/specilities.module").then(
        m => m.SpecilitiesPageModule
      )
  },
  {
    path: "list-of-doctors",
    loadChildren: () =>
      import("./list-of-doctors/list-of-doctors.module").then(
        m => m.ListOfDoctorsPageModule
      )
  },
  {
    path: "map-view",
    loadChildren: () =>
      import("./map-view/map-view.module").then(m => m.MapViewPageModule)
  },
  {
    path: "filter",
    loadChildren: () =>
      import("./filter/filter.module").then(m => m.FilterPageModule)
  },
  {
    path: "doctor-profile",
    loadChildren: () =>
      import("./doctor-profile/doctor-profile.module").then(
        m => m.DoctorProfilePageModule
      )
  },
  {
    path: "appointment-book",
    loadChildren: () =>
      import("./appointment-book/appointment-book.module").then(
        m => m.AppointmentBookPageModule
      )
  },
  {
    path: "add-feedback",
    loadChildren: () =>
      import("./add-feedback/add-feedback.module").then(
        m => m.AddFeedbackPageModule
      )
  },
  {
    path: "hospitals",
    loadChildren: () =>
      import("./hospitals/hospitals.module").then(m => m.HospitalsPageModule)
  },
  {
    path: "hospital-map-view",
    loadChildren: () =>
      import("./hospital-map-view/hospital-map-view.module").then(
        m => m.HospitalMapViewPageModule
      )
  },
  {
    path: "hospital-info",
    loadChildren: () =>
      import("./hospital-info/hospital-info.module").then(
        m => m.HospitalInfoPageModule
      )
  },
  {
    path: "my-appointments",
    loadChildren: () =>
      import("./my-appointments/my-appointments.module").then(
        m => m.MyAppointmentsPageModule
      )
  },
  {
    path: "appointment-detail",
    loadChildren: () =>
      import("./appointment-detail/appointment-detail.module").then(
        m => m.AppointmentDetailPageModule
      )
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
    path: "addresses",
    loadChildren: () =>
      import("./addresses/addresses.module").then(m => m.AddressesPageModule)
  },
  {
    path: "add-address",
    loadChildren: () =>
      import("./add-address/add-address.module").then(
        m => m.AddAddressPageModule
      )
  },
  {
    path: "contact-us",
    loadChildren: () =>
      import("./contact-us/contact-us.module").then(m => m.ContactUsPageModule)
  },
  {
    path: "faqs",
    loadChildren: () => import("./faqs/faqs.module").then(m => m.FaqsPageModule)
  },
  {
    path: "tnc",
    loadChildren: () => import("./tnc/tnc.module").then(m => m.TncPageModule)
  },
  {
    path: "title",
    loadChildren: () =>
      import("./title/title.module").then(m => m.TitlePageModule)
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
