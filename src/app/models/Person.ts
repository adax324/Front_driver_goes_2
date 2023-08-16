import {PhoneNumber} from "./PhoneNumber";
import {Department} from "./Department";
import { Authority } from "../enums/Authority";

export interface Person {
  id: number;
  uuid: string;
  firstName: string;
  lastName: string;
  birthDate: Date;
  email: string;
  phoneNumber: PhoneNumber;
  department: Department;
  authorities: Authority[];
}
