import { Component, OnInit } from '@angular/core';
import { LoaderService } from './services/loader/loader.service';
import {HttpClient} from "@angular/common/http";
import {Router} from "@angular/router";
import {finalize} from "rxjs/operators";
import {AuthService} from "./services/auth.service";
import {RootScope} from "./services/RootScope";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {
  showSidebar = true;
  showFooter = true;

  title = 'angular-client';
  constructor(private loader: LoaderService,
              private auth: AuthService,
              public rootScope: RootScope
  ){
    this.loader.loadDTJsAndCss();
    this.auth.authenticate(null, null);
  }
  ngOnInit(): void {
  }
}
