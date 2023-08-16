import { Injectable } from "@angular/core";

@Injectable({
  providedIn: 'root'
})
export class RootScope {
  show = new Show(false);
}

export class Show {
  main:boolean;
  
  constructor(main: boolean) {
    this.main = main;
  }
}
