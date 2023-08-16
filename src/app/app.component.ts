import { Component, Injectable, OnInit } from '@angular/core';
import { AuthService } from './services/auth.service';
import { LoaderService } from './services/loader/loader.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {

  title = 'Driver Go 2 client';
  constructor(private loader: LoaderService, public authSrv: AuthService
  ){
    this.loader.loadDTJsAndCss()
  }
  ngOnInit(): void {
  }
}
