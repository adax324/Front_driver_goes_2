import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { City } from '../models/City';
import { Department } from '../models/Department';

@Injectable({
  providedIn: 'root'
})
export class DepartmentService {
  private url:string = environment.apiUrl + '/department';

  constructor(private httpClient:HttpClient) { }

  public findByCity(cityId:string):Observable<Department[]> {
    let params = new HttpParams();
    params = params.append('cityId', cityId);
    return this.httpClient.get<Department[]>(this.url + '/findByCity',{params: params});
  }


}
