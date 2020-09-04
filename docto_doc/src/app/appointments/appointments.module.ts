import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TranslateModule } from '@ngx-translate/core';
  
import { IonicModule } from '@ionic/angular';

import { AppointmentsPageRoutingModule } from './appointments-routing.module';

import { AppointmentsPage } from './appointments.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
	TranslateModule,  
    AppointmentsPageRoutingModule
  ],
  declarations: [AppointmentsPage]
})
export class AppointmentsPageModule {}
