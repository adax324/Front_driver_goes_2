import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot} from "@angular/router";
import { AppComponent } from "../app.component";
import { AuthService } from "../services/auth.service";

@Injectable()
export class AccessGuard implements CanActivate {
    constructor(private auth: AuthService, private router: Router, private mainComponent: AppComponent) {

    }
    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean> {
        const requiresLogin = route.data.requiresLogin || true;
        return new Promise(resolve => {
            if (requiresLogin) {
            if (!this.auth.authenticated) {
                this.auth.authenticate(null, () => {
                    resolve(true);
                    this.mainComponent.switchMainView();
                    this.auth.authenticated = true;
                    this.router.navigateByUrl('/');
                })
                    
            
            } else
                resolve(true);
        } else
            resolve(true);
        });
        
    }

}