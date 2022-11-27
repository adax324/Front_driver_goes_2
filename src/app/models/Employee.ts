import {Department} from "./Department";
import {PhoneNumber} from "./PhoneNumber";
import {Person} from "./Person";
import {Role} from "../enum/Role";

export interface Employee extends Person {
    role:Role;
}
