import { Component, Input, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { Student } from '../models/Student';
import { CitiesService } from 'src/app/services/cities/cities.service';
import { City } from '../models/City';
import { Department } from '../models/Department';
import { StudentService } from 'src/app/services/students/students.service';
import { Instructor } from '../models/Instructor';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MyTel } from 'src/app/customFields/custom-tel-field/custom-tel-field.component';
import { map } from 'rxjs/operators';


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
  constructor(private loader: LoaderService, private citiesService: CitiesService, private studentService: StudentService, private router: Router, private route: ActivatedRoute) {
    this.citiesService.getAllCities().subscribe((result) => {
      this.cities = result;
    });
    this.formGroupControl = new FormGroup({
      firstName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      lastName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      birthDate: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.required, Validators.email]),
      phoneNumber: new FormControl(null, [Validators.required]),
      remainingHours: new FormControl('', Validators.required),
      city: new FormControl('', Validators.required), 
      department: new FormControl('', Validators.required)
    });
  }
  ngOnInit(): void {
    
    this.route.params.subscribe(params => {
      console.log(params);
    });
    this.loader.loadScript('../assets/plugins/bs-custom-file-input/bs-custom-file-input.min.js');
  }

  public loadDepartments = () => {
    this.formGroupControl.controls.department.reset();
    this.departments = this.formGroupControl.controls.city.value.departments;
  }
  public save = () => {
    let phoneNumber = JSON.parse(JSON.stringify(this.formGroupControl.controls.phoneNumber.value));
    let student:Student = this.formGroupControl.getRawValue();
    student.phoneNumber = phoneNumber.area + phoneNumber.exchange + phoneNumber.subscriber;

    this.studentService.save(student).subscribe((result) => {
      if (result.uuid) {
        this.router.navigate(['/students/list']);
      }
    });
  }
}
