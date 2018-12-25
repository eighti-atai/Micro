import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { EmployeesComponent } from './employees/employees.component';
import { CboComponent } from './cbo/cbo.component';
import { BranchComponent } from './branch/branch.component';
//import { PatientComponent } from './patient/patient.component';

const routes: Routes = [
    //{ path: '', redirectTo: 'patient', pathMatch: 'full' },
    { path: 'employee', component: EmployeeComponent },
    { path: 'employees', component: EmployeesComponent },
    { path: 'cbo', component: CboComponent },
    { path: 'branch', component: BranchComponent },

];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})

export class AppRoutingModule { }