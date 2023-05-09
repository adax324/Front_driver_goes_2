import { Component, OnInit } from '@angular/core';
import { LoaderService } from './services/loader/loader.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {
  showMain = false;

  title = 'angular-client';
  constructor(private loader: LoaderService
  ){
    this.loader.loadDTJsAndCss();
  }
  ngOnInit(): void {
  }
  switchMainView() {
    this.showMain = !this.showMain;
  }
}
