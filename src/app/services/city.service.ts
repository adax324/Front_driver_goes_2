import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {Observable} from 'rxjs';
import {City} from 'src/app/components/models/City';
import {environment} from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CityService {
  private url = environment.apiUrl + '/city';

  constructor(private httpClient: HttpClient) {
  }

  public getAllCities(): Observable<City[]> {
    return this.httpClient.get<City[]>(this.url + '/list');
  }
}
