import {Component, OnInit, ViewChild} from '@angular/core';
import {SelectionModel} from "@angular/cdk/collections";
import {MatTableDataSource} from "@angular/material/table";
import {MatPaginator} from "@angular/material/paginator";
import {Router} from "@angular/router";
import {PhoneNumber} from "../../models/PhoneNumber";
import {Employee} from "../../models/Employee";
import { CommonUtils } from 'src/app/utils/common-utils';

@Component({
  selector: 'app-teacher-list',
  templateUrl: './teacher-list.component.html',
  styleUrls: ['./teacher-list.component.css']
})
export class TeacherListComponent implements OnInit {
  public displayedColumns: string[] = ['position', 'firstName', 'lastName', 'birthDate', 'email', 'phoneNumber', 'department'];
  public selection = new SelectionModel<Employee>(false, []);
  dataSource!: MatTableDataSource<Employee>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private router: Router, public commonUtils: CommonUtils
  ) {
  }

  ngOnInit(): void {
  }

  public editSelected() {

  }

  public deleteSelected() {

  }

  public printPhoneNumber(phoneNumber: PhoneNumber) {
    return phoneNumber.area + phoneNumber.exchange + phoneNumber.subscriber;
  }

}
