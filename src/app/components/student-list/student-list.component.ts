import {Component, Injectable, OnInit, ViewChild} from '@angular/core';
import {LoaderService} from 'src/app/services/loader/loader.service';
import {StudentService} from 'src/app/services/students/students.service';
import {Student} from '../../models/Student';
import {SelectionModel} from '@angular/cdk/collections';
import {MatTableDataSource} from '@angular/material/table';
import {MatPaginator, MatPaginatorIntl} from '@angular/material/paginator';
import {Router} from '@angular/router';
import {PhoneNumber} from "../../models/PhoneNumber";
import {CommonUtility} from "../../utility/CommonUtility";


@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {
  public displayedColumns: string[] = ['position', 'firstName', 'lastName', 'birthDate', 'email', 'phoneNumber', 'remainingHours', 'department'];
  public selection = new SelectionModel<Student>(false, []);
  dataSource!: MatTableDataSource<Student>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private studentService: StudentService,
              private router: Router,
              public commonUtility:CommonUtility
  ) {
  }


  ngOnInit(): void {
    this.studentService.getAllStudents().subscribe((result) => {
      this.dataSource = new MatTableDataSource<Student>(result);
      this.dataSource.paginator = this.paginator;
    });

  }

  public editSelected() {
    this.router.navigate(['student/form', this.selection.selected[0].uuid]);
  }

  public deleteSelected() {
    this.studentService.delete(this.selection.selected[0].uuid).subscribe(() => {
      this.dataSource.data = this.dataSource.data.filter(item => item.uuid != this.selection.selected[0].uuid);
      this.selection.selected.pop();
    });
  }

  public printPhoneNumber(phoneNumber: PhoneNumber) {
    return phoneNumber.area + phoneNumber.exchange + phoneNumber.subscriber;
  }


}



