import {Component, OnInit} from '@angular/core';
import {LoaderService} from 'src/app/services/loader/loader.service';
import {AuthService} from "../../services/auth.service";
import {HttpClient} from "@angular/common/http";
import {CityService} from "../../services/city.service";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
  test = {};

  constructor(private loaderService: LoaderService,
              private authService: AuthService,
              private cityService: CityService) {
    cityService.getAllCities().subscribe(result => {
      this.test = result[0];
    })
  }

  ngOnInit(): void {
    this.loaderService.loadCSS('../assets/plugins/fontawesome-free/css/all.css');
  }

  authenticated() {
    return this.authService.authenticated;
  }

  logout() {
    this.authService.logout();
  }


}
