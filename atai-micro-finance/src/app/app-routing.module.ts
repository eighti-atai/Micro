import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
//import { PatientComponent } from './patient/patient.component';

const routes: Routes = [
    //{ path: '', redirectTo: 'patient', pathMatch: 'full' },
    { path: 'employee', component: EmployeeComponent },
    { path: 'add', component: EmployeeComponent },

];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})

export class AppRoutingModule { }