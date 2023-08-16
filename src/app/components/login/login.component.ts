import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../services/auth.service";
import {Router} from "@angular/router";

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
              private router: Router) {
  }

  ngOnInit(): void {
  }

  login() {
    if (this.credentials.valid) {
      this.authService.authenticate(this.credentials.getRawValue(), () => {
        this.router.navigateByUrl('/');
      });
    }
  }


}
