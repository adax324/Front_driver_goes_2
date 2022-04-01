import { state } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { StudentsService } from 'src/app/services/students/students.service';
import { Student } from '../models/Student';

@Component({
  selector: 'app-students-list',
  templateUrl: './students-list.component.html',
  styleUrls: ['./students-list.component.css']
})
export class StudentsListComponent implements OnInit {
  public students: Student[] = [];
  constructor(private loaderService:LoaderService, private studentService:StudentsService) { }

  ngOnInit(): void {
  this.loaderService.loadDTJsAndCss();  
  this.studentService.getAllStudents().subscribe((result) => {
    this.students = result;
  });

  }
  public goToStudentFormView = function() {
    console.log('działa');
  }

}
