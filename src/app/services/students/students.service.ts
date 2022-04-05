import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { Student } from 'src/app/components/models/Student';
import { environment } from 'src/environments/environment.prod';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  private BASE_URL = environment.apiUrl + '/students';
  constructor(private http:HttpClient) { }
  public students = new Observable<Student[]>();
  public getAllStudents():Observable<Student[]>{
      return this.students = this.http.get<Student[]>(this.BASE_URL + '/all');
      }
  public save(student:Student):Observable<Student>{
    return this.http.post<Student>(this.BASE_URL + '/save', student);
  }    
}
