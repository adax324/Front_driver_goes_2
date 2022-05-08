import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { QuestsListComponent } from './components/quests-list/quests-list.component';
import { StudentsFormComponent } from './components/students-form/students-form.component';
import { StudentsListComponent } from './components/students-list/students-list.component';

const routes: Routes = [{path:'quests/list', component: QuestsListComponent},
{path: 'students/list', component: StudentsListComponent},
{path: 'students/form', redirectTo: 'students/form/', pathMatch: 'full'},
{path: 'students/form/:uuid', component: StudentsFormComponent},
{path: '', component: HomeComponent}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
