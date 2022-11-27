import { Department } from "./Department";
import {PhoneNumber} from "./PhoneNumber";

export class Student{
    id!:number;
    uuid!:string;
    firstName!:string;
    lastName!:string;
    birthDate!:Date;
    email!:string;
    phoneNumber!:PhoneNumber;
    remainingHours!:number;
    admittedExam!:boolean;
    department!:Department;

}
