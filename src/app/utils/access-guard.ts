import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot} from "@angular/router";
import { AuthService } from "../services/auth.service";
import { RootScope } from "./root-scope";

@Injectable()
export class AccessGuard implements CanActivate {
    constructor(private auth: AuthService, private router: Router, private rootScope: RootScope) {

    }
    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean> {
        const requiresLogin = route.data.requiresLogin || true;
        return new Promise(resolve => {
            if (requiresLogin) {
            if (!this.auth.authenticated) {
                this.auth.authenticate(null, () => {
                    resolve(true);
                });
                    
            
            } else
                resolve(true);
        } else
            resolve(true);
        });
        
    }

}