import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Observable} from "rxjs";
import {environment} from "../../environments/environment";
import {finalize} from "rxjs/operators";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private url = environment.apiUrl + '/api/auth';
  authenticated = false;

  constructor(private http: HttpClient, private router:Router,) {

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
    return this.http.post(this.url + '/signin', credentials).toPromise();
    }
    
  logout() {
    this.http.post(environment.apiUrl + '/logout', {}).subscribe(
      () => {
        this.authenticated = false;
        this.router.navigateByUrl('/login')
      }
    );
  }
}
