import { Component, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  constructor(private loaderService:LoaderService) { }

  ngOnInit(): void {
    this.loaderService.loadCSS('../assets/plugins/fontawesome-free/css/all.css');
  }

}
