import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../services/auth.service";
import {HttpClient} from "@angular/common/http";
import {Router} from "@angular/router";
import {RootScope} from "../../services/RootScope";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  credentials = new FormGroup({
    username: new FormControl(null, [Validators.required, Validators.minLength(3)]),
    password: new FormControl(null, [Validators.required, Validators.minLength(3)])
  });


  constructor(private authService: AuthService,
              private http: HttpClient,
              private router: Router,
              private rootScope: RootScope) {
    rootScope.showSidebar = false;
    rootScope.showFooter = false;
  }

  ngOnInit(): void {
  }

  login() {
    if (this.credentials.valid) {
      this.authService.authenticate(this.credentials.getRawValue(), () => {
        this.rootScope.showSidebar = true;
        this.rootScope.showFooter = true;
        this.router.navigateByUrl('/student/form');
      });
    }
  }


}
