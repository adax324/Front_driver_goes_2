import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {HomeComponent} from './components/home/home.component';
import {QuestsListComponent} from './components/quests-list/quests-list.component';
import {StudentFormComponent} from './components/student-form/student-form.component';
import {StudentListComponent} from './components/student-list/student-list.component';
import {TeacherListComponent} from "./components/teacher-list/teacher-list.component";
import {LoginComponent} from "./components/login/login.component";

const routes: Routes = [
  {path: 'quest/list', component: QuestsListComponent},
  {path: 'student/list', component: StudentListComponent},
  {path: 'student/form', redirectTo: 'student/form/', pathMatch: 'full'},
  {path: 'student/form/:uuid', component: StudentFormComponent},
  {path: '', component: HomeComponent},
  {path: 'teacher/list', component: TeacherListComponent},
  {path: 'login', component: LoginComponent}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
