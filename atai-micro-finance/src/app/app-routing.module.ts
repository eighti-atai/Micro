import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { EmployeesComponent } from './employees/employees.component';
//import { PatientComponent } from './patient/patient.component';

const routes: Routes = [
    //{ path: '', redirectTo: 'patient', pathMatch: 'full' },
    { path: 'employee', component: EmployeeComponent },
    { path: 'employees', component: EmployeesComponent },

];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})

export class AppRoutingModule { }