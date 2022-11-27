import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';
import {catchError, retry} from 'rxjs/operators';
import {Student} from 'src/app/models/Student';
import {environment} from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  private BASE_URL = environment.apiUrl + '/student';

  constructor(private http: HttpClient) {
  }

  public students = new Observable<Student[]>();

  public get(uuid: string): Observable<Student> {
    return this.http.get<Student>(this.BASE_URL + '/' + uuid);
  }

  public getAllStudents(): Observable<Student[]> {
    return this.students = this.http.get<Student[]>(this.BASE_URL + '/all');
  }

  public save(student: Student): Observable<Student> {
    return this.http.post<Student>(this.BASE_URL + '/save', student);
  }

  public delete(uuid: string): any {
    let params = new HttpParams();
    params = params.append("uuid", uuid);
    return this.http.delete(this.BASE_URL + "/delete", {params: params})
  }

}
