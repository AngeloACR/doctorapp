import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { TranslateModule } from "@ngx-translate/core";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { IonicModule } from "@ionic/angular";

import { SpecilitiesPageRoutingModule } from "./specilities-routing.module";

import { SpecilitiesPage } from "./specilities.page";

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ReactiveFormsModule,
    TranslateModule,
    SpecilitiesPageRoutingModule
  ],
  declarations: [SpecilitiesPage]
})
export class SpecilitiesPageModule {}
