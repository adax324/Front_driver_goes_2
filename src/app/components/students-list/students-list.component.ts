import { state } from '@angular/animations';
import { Component, Injectable, OnInit, ViewChild } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { StudentService } from 'src/app/services/students/students.service';
import { Student } from '../models/Student';
import { SelectionModel } from '@angular/cdk/collections';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator, MatPaginatorIntl } from '@angular/material/paginator';


@Component({
  selector: 'app-students-list',
  templateUrl: './students-list.component.html',
  styleUrls: ['./students-list.component.css']
})
export class StudentsListComponent implements OnInit {
  public displayedColumns:string[] = ['position', 'firstName', 'lastName', 'birthDate'];
  public selection = new SelectionModel<Student>(false, []);
  dataSource!:MatTableDataSource<Student>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;


  constructor(private loaderService:LoaderService, private studentService:StudentService) { }
  
  
  ngOnInit(): void {
  this.loaderService.loadDTJsAndCss();  
  this.studentService.getAllStudents().subscribe((result) => {
    this.dataSource = new MatTableDataSource<Student>(result);
    this.dataSource.paginator = this.paginator;
  });

  }


}
// @Injectable()
// export class PolishPaginatorIntl implements MatPaginatorIntl {
//   changes = new Subject<viud>();

//   firstPageLabel = $localize`Pierwsza strona`;
//   itemsPerPageLabel = $localize`Elementów na stronie: `;
//   lastPageLabel = $localize`Ostatnia strona`;
//   nextPageLabel = 
// }
