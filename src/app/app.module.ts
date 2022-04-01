import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { FooterComponent } from './components/footer/footer.component';
import { QuestsListComponent } from './components/quests-list/quests-list.component';
import { HomeComponent } from './components/home/home.component';
import { StudentsListComponent } from './components/students-list/students-list.component';
import { HttpClientModule } from '@angular/common/http';
import { StudentsFormComponent } from './components/students-form/students-form.component';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    AppComponent,
    SidebarComponent,
    FooterComponent,
    QuestsListComponent,
    HomeComponent,
    StudentsListComponent,
    StudentsFormComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
