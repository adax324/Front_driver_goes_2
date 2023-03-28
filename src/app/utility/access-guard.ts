import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Observable } from "rxjs";
import { AuthService } from "../services/auth.service";

@Injectable()




export class AccessGuard implements CanActivate {
    constructor(private auth: AuthService, private router: Router) {

    }
    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean>|Promise<boolean>|boolean {
        const requiresLogin = route.data.requiresLogin || true;
        return new Promise(resolve => {
            if (requiresLogin) {
            if (!this.auth.authenticated) {
                this.auth.authenticate(null, null).then(response => {
                    resolve(true);
                    this.auth.authenticated = true;
                    this.router.navigateByUrl('/');
                }, error => {
                    resolve(false);
                    this.router.navigateByUrl('/login');
                })
            } else
                resolve(true);
        } else
            resolve(true);
        });
        
    }

}