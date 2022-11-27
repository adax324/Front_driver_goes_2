import {Student} from "./Student";

export class PhoneNumber {
  id: number;
  student: Student;
  area: string;
  exchange: string;
  subscriber: string;

  constructor(id: number, student: Student, area: string, exchange: string, subscriber: string) {
    this.id = id;
    this.student = student;
    this.area = area;
    this.exchange = exchange;
    this.subscriber = subscriber;
  }

}
