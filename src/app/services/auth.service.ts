import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { environment } from "../../environments/environment";
import { Router } from "@angular/router";
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private url = environment.apiUrl + '/api/auth';
  authenticated = false;
  user:User | null = null;

  constructor(private http: HttpClient, private router: Router,) {

  }
  // OLD BASIC AUTH
  // authenticate(credentials:any, callback: any) {
  //   let headers = new HttpHeaders();
  //   if (credentials)
  //     headers = headers.append("Authorization", 'Basic ' + btoa(credentials.username + ':' + credentials.password));
  //   this.http.get<Response>(this.url, {
  //     headers: headers,
  //     observe: 'response',
  //     withCredentials: true
  //   }).subscribe(response => {
  //     if (response && Object.values(response)[5])
  //       this.authenticated = true;
  //     else
  //       this.authenticated = false;
  //     return callback && callback();
  //   })
  // }

  authenticate(credentials: any, callback: any) {
    this.http.post<User>(this.url + '/signin', credentials).subscribe(result => {
      this.authenticated = !this.authenticated;
      this.user = result;
      callback();
    }, error => {
        this.router.navigateByUrl('/login');
    });
  }

  logout() {
    this.http.post(environment.apiUrl + '/logout', {}).subscribe(
      () => {
        this.user = null;
        this.router.navigateByUrl('/login')
      }
    );
  }
}
