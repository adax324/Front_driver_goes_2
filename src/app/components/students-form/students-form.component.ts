import { Component, Input, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { Student } from '../models/Student';
import { CityService } from 'src/app/services/city.service';
import { City } from '../models/City';
import { Department } from '../models/Department';
import { StudentService } from 'src/app/services/students/students.service';
import { Instructor } from '../models/Instructor';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MyTel } from 'src/app/customFields/custom-tel-field/custom-tel-field.component';
import { map } from 'rxjs/operators';
import {DepartmentService} from "../../services/department.service";


@Component({
  selector: 'app-students-form',
  templateUrl: './students-form.component.html',
  styleUrls: ['./students-form.component.css']
})
export class StudentsFormComponent implements OnInit {
  private student!: Student;
  public cities!: City[];
  public selectedCity!: City;
  public departments!: Department[];
  public selectedDepartment!: Department;
  public instructors!: Instructor[];
  public selectedInstructors = new FormControl();

  public formGroupControl: FormGroup;
  constructor(private loader: LoaderService,
              private citiesService: CityService,
              private studentService: StudentService,
              private router: Router,
              private route: ActivatedRoute,
              private departmentService:DepartmentService) {
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
      this.studentService.get(params.uuid).subscribe(student => {
        if (student != null) {
          this.loadStudent(student);
        }
      });
    });
    this.loader.loadScript('../assets/plugins/bs-custom-file-input/bs-custom-file-input.min.js');
  }

  public loadDepartments = (city:City) => {
    this.formGroupControl.controls.department.reset();
    this.departmentService.findByCity(city.id).subscribe(result => {
      this.departments = result;
    });
  }
  public save = () => {
    let studentToPersist = this.formGroupControl.getRawValue();
    if (this.student) {
      studentToPersist.id = this.student.id;
      studentToPersist.uuid = this.student.uuid;
    }
    this.studentService.save(studentToPersist).subscribe((result) => {
      if (result.uuid) {
        this.router.navigate(['/students/list']);
      }
    });
  }
  public loadStudent = (student:Student) => {
    this.student = new Student();
    this.student.id = student.id;
    this.student.uuid = student.uuid;

    let selectedCity = this.cities.filter(city => city.id == student.department.city.id);
    if (selectedCity.length > 0) {
      this.selectedCity = selectedCity[0];
    }
    this.formGroupControl.setValue({
      firstName: student.firstName,
      lastName: student.lastName,
      birthDate: new Date(student.birthDate),
      email: student.email,
      phoneNumber: student.phoneNumber,
      remainingHours: student.remainingHours,
      city: student.department.city,
      department: student.department
    });
  }
}
