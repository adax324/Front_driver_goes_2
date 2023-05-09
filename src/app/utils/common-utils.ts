import {Injectable} from "@angular/core";

@Injectable({
  providedIn: 'root'
})
export class CommonUtils {
  public printDateFromArray(date:Array<Number>):string{
    let dateString = '';
    dateString += date[0] + '-';
    if (date[1] < 10)
      dateString += '0' + date[1] + '-';
    else
      dateString += date[1] + '-';
    if (date[2] < 10)
      dateString += '0' + date[2]
    else
      dateString += date[2]
    return dateString;
  }
}
