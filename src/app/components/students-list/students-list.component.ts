import {state} from '@angular/animations';
import {Component, Injectable, OnInit, ViewChild} from '@angular/core';
import {LoaderService} from 'src/app/services/loader/loader.service';
import {StudentService} from 'src/app/services/students/students.service';
import {Student} from '../models/Student';
import {SelectionModel} from '@angular/cdk/collections';
import {MatTableDataSource} from '@angular/material/table';
import {MatPaginator, MatPaginatorIntl} from '@angular/material/paginator';
import {Subject} from 'rxjs';
import {Router} from '@angular/router';


@Component({
  selector: 'app-students-list',
  templateUrl: './students-list.component.html',
  styleUrls: ['./students-list.component.css']
})
export class StudentsListComponent implements OnInit {
  public displayedColumns: string[] = ['position', 'firstName', 'lastName', 'birthDate', 'email', 'phoneNumber', 'remainingHours', 'department'];
  public selection = new SelectionModel<Student>(false, []);
  dataSource!: MatTableDataSource<Student>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private loaderService: LoaderService,
              private studentService: StudentService,
              private router: Router
  ) {
  }


  ngOnInit(): void {
    this.loaderService.loadDTJsAndCss();
    this.studentService.getAllStudents().subscribe((result) => {
      this.dataSource = new MatTableDataSource<Student>(result);
      this.dataSource.paginator = this.paginator;
    });

  }

  public editSelected() {
    this.router.navigate(['students/form', this.selection.selected[0].uuid]);
  }

  public deleteSelected() {
    this.studentService.delete(this.selection.selected[0].uuid).subscribe(() => {
      this.dataSource
    });
  }


}

@Injectable()
export class PolishPaginatorIntl implements MatPaginatorIntl {
  changes = new Subject<void>();

  firstPageLabel = 'Pierwsza strona';
  itemsPerPageLabel = 'Elementów na stronie: ';
  lastPageLabel = 'Ostatnia strona';
  nextPageLabel = 'Następna strona';
  previousPageLabel = 'Poprzednia strona';

  getRangeLabel(page: number, pageSize: number, length: number): string {
    if (length === 0) {
      return 'Strona 1 z 1';
    }
    const amountPages = Math.ceil(length / pageSize);
    return `Strona ${page + 1} z ${amountPages}`;
  }
}

