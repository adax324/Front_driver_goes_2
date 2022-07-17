import { Department } from "./Department";

export class Student{
    id!:number;
    uuid!:string;
    firstName!:string;
    lastName!:string;
    birthDate!:Date;
    email!:string;
    phoneNumber!:Object;
    remainingHours!:number;
    admittedExam!:boolean;
    department!:Department;

}
