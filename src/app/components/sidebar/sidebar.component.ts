import {Component, OnInit} from '@angular/core';
import {LoaderService} from 'src/app/services/loader/loader.service';
import {AuthService} from "../../services/auth.service";
import {HttpClient} from "@angular/common/http";
import {CityService} from "../../services/city.service";
import { User } from 'src/app/models/user.model';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
  user?:User;

  constructor(private loaderService: LoaderService,
              private authService: AuthService) {
    this.user = authService.user;
  }

  ngOnInit(): void {
    this.loaderService.loadCSS('../assets/plugins/fontawesome-free/css/all.css');
  }

  logout() {
    this.authService.logout();
  }


}
