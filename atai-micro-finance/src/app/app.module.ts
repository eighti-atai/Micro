import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import { AppComponent } from './app.component';
import { NavigatorComponent } from './navigator/navigator.component';
import { DropdownDirective } from './navigator/dropdown.directive';
import { SampleComponentComponent } from './sample-component/sample-component.component';
import { EmployeeComponent } from './employee/employee.component';
import { Routes, RouterModule } from "@angular/router";
import { HomeComponent } from './home/home.component';
import { EmployeesComponent } from './employees/employees.component';
import { AppRoutingModule } from './app-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { CboComponent } from './cbo/cbo.component';
import { BranchComponent } from './branch/branch.component';
import { TooltipModule } from 'ng2-tooltip-directive';



const appRoutes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'employee', component: EmployeeComponent},
  {path: 'sample', component: SampleComponentComponent},
  {path: 'employees', component: EmployeesComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    NavigatorComponent,
    DropdownDirective,
    SampleComponentComponent,
    EmployeeComponent,
    HomeComponent,
    EmployeesComponent,
    CboComponent,
    BranchComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    TooltipModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
