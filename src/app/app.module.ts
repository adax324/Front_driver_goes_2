import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { FooterComponent } from './components/footer/footer.component';
import { QuestsListComponent } from './components/quests-list/quests-list.component';
import { HomeComponent } from './components/home/home.component';
import { StudentListComponent } from './components/student-list/student-list.component';
import {HTTP_INTERCEPTORS, HttpClientModule, HttpClientXsrfModule} from '@angular/common/http';
import { StudentFormComponent } from './components/student-form/student-form.component';
import { FormsModule, ReactiveFormsModule} from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatDatepickerModule} from '@angular/material/datepicker';
import { MatNativeDateModule, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import {MatCardModule} from '@angular/material/card';
import {MatButtonModule} from '@angular/material/button';
import {MatSelectModule} from '@angular/material/select';
import {MatTableModule} from '@angular/material/table';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatPaginatorIntl, MatPaginatorModule} from '@angular/material/paginator';
import {MatIconModule} from '@angular/material/icon';
import { MyTelInput } from './customFields/custom-tel-field/custom-tel-field.component';
import { TeacherListComponent } from './components/teacher-list/teacher-list.component';
import { TeacherFormComponent } from './components/teacher-form/teacher-form.component';
import {PolishPaginator} from "./customFields/customPaginator/PolishPaginator";
import { LoginComponent } from './components/login/login.component';
import {AuthService} from "./services/auth.service";
import {XhrInterceptor} from "./utils/xml.interceptor";
import { AccessGuard } from './utils/access-guard';


@NgModule({
  declarations: [
    AppComponent,
    SidebarComponent,
    FooterComponent,
    QuestsListComponent,
    HomeComponent,
    StudentListComponent,
    StudentFormComponent,
    MyTelInput,
    TeacherListComponent,
    TeacherFormComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatFormFieldModule,
    MatInputModule,
    MatCardModule,
    MatButtonModule,
    MatSelectModule,
    ReactiveFormsModule,
    MatTableModule,
    MatCheckboxModule,
    MatPaginatorModule,
    MatIconModule

  ],
  providers: [AuthService, AccessGuard, 
    {provide: HTTP_INTERCEPTORS, useClass: XhrInterceptor, multi: true},
    {provide: MatPaginatorIntl, useClass: PolishPaginator},
    {provide: MAT_DATE_LOCALE, useValue: 'pl-PL'}],
  bootstrap: [AppComponent]
})
export class AppModule { }
