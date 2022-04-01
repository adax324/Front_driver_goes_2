import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { Student } from 'src/app/components/models/Student';

@Injectable({
  providedIn: 'root'
})
export class StudentsService {
  private BASE_URL = 'http://localhost:8080/students/all';
  constructor(private http:HttpClient) { }
  public students = new Observable<Student[]>();
  public getAllStudents():Observable<Student[]>{
      return this.students = this.http.get<Student[]>(this.BASE_URL);
      }
}
