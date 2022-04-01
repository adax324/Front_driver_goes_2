import { Component, Input, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { Student } from '../models/Student';
import { FormsModule } from '@angular/forms';
import { CitiesService } from 'src/app/services/cities/cities.service';
import { City } from '../models/City';
import { Department } from '../models/Department';

@Component({
  selector: 'app-students-form',
  templateUrl: './students-form.component.html',
  styleUrls: ['./students-form.component.css']
})
export class StudentsFormComponent implements OnInit {
  public student:Student;
  public cities!:City[];
  public selectedCity!:City;
  public departments!:Department[];
  public selectedDepartment!:Department;
  constructor(private loader:LoaderService, private citiesService:CitiesService) {
    this.student = new Student();
    this.citiesService.getAllCities().subscribe((result) => {
      this.cities = result;
    });
   }

  ngOnInit(): void {
    this.loader.loadScript('../assets/plugins/bs-custom-file-input/bs-custom-file-input.min.js');
    }

  public loadDepartments = () => {
    this.departments = this.selectedCity.departments;
  }
  public save = () => {
    
  }
}
