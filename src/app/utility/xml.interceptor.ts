import {Inject, Injectable} from "@angular/core";
import {HttpHandler, HttpInterceptor, HttpRequest, HttpXsrfTokenExtractor} from "@angular/common/http";
import {DOCUMENT} from "@angular/common";

@Injectable()
export class XhrInterceptor implements HttpInterceptor {


  constructor(private  xsrfTokenExtractor: HttpXsrfTokenExtractor) {

  }
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    let xhr = req.clone({
      headers: req.headers.set('X-Requested-With', 'XMLHttpRequest'),
      withCredentials: true
    });
    if(req.method !== "GET") {
      let xsrfToken = this.xsrfTokenExtractor.getToken();
      if (xsrfToken)
      xhr = xhr.clone({headers: req.headers.set("X-XSRF-TOKEN", xsrfToken.toString())});
    }
    return next.handle(xhr);
  }
  // private fetchCookies() {
  //   let cookies = document.cookie;
  //   this.cookies = cookies.split(';');
  // }
}
