import { Component, Input, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { Student } from '../models/Student';
import { CitiesService } from 'src/app/services/cities/cities.service';
import { City } from '../models/City';
import { Department } from '../models/Department';
import { StudentService } from 'src/app/services/students/students.service';
import { Instructor } from '../models/Instructor';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';


@Component({
  selector: 'app-students-form',
  templateUrl: './students-form.component.html',
  styleUrls: ['./students-form.component.css']
})
export class StudentsFormComponent implements OnInit {
  // formControl = {
  //   'email': new FormControl('', [Validators.required, Validators.email])
  // };
  //emailControl = new FormControl('', [Validators.required, Validators.email]);




  public cities!: City[];
  public selectedCity!: City;
  public departments!: Department[];
  public selectedDepartment!: Department;
  public instructors!: Instructor[];
  public selectedInstructors = new FormControl();

  public formGroupControl: FormGroup;
  constructor(private loader: LoaderService, private citiesService: CitiesService, private studentService: StudentService, private router: Router) {
    this.citiesService.getAllCities().subscribe((result) => {
      this.cities = result;
    });
    this.formGroupControl = new FormGroup({
      firstName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      lastName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      birthDate: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.required, Validators.email]),
      phoneNumber: new FormControl('', [Validators.pattern('[- +()0-9]+')]),
      remainingHours: new FormControl('', Validators.required),
      city: new FormControl('', Validators.required), 
      department: new FormControl('', Validators.required)
    });
  }
  ngOnInit(): void {
    this.loader.loadScript('../assets/plugins/bs-custom-file-input/bs-custom-file-input.min.js');
  }

  public loadDepartments = () => {
    this.formGroupControl.controls.department.reset();
    this.departments = this.formGroupControl.controls.city.value.departments;
  }
  public save = () => {
    this.studentService.save(this.formGroupControl.getRawValue()).subscribe((result) => {
      if (result.uuid) {
        this.router.navigate(['/students/list']);
      }
    });
  }
}
