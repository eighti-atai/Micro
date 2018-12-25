import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { NgForm, FormControl, FormGroup } from '@angular/forms';
import { Observable, Subscription } from 'rxjs';

import { Employee } from './employee';
import { BaseService } from '../base.service';



@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {
  @ViewChild('f') form : NgForm;
  new: boolean = false;
  edit: boolean = false;
  cancel: boolean = false;
  readMode = true;
  defaultTitle = "mr";
  defaultName = "";
  myform: any;
  saveSubscription: Subscription;

  record: Employee = new Employee();
  oldRecord: Employee = new Employee();
  searchRecord: Employee = new Employee();
  recordsArr: Employee[];
  records: Observable<Employee[]>;
  submitted = false;
  lastobjid = null;
  saving: boolean = true;
  constructor(private baseService: BaseService) { }

  ngOnInit() {
    //this.record = {objid: "p3x5"};
    this.baseService.init('Employee', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord, this.form);
    this.baseService.reloadAll();
    this.saveSubscription = this.baseService.saveObservable.subscribe(result => {
      if(result === "success"){
        this.myform = this.form.value;
        this.form.reset(this.myform);
      }
      else{
        alert("Error Occurred trying to Save the record");
      }
    });
  }

  ngOnDestroy(){
    this.saveSubscription.unsubscribe();
  }
  onNew(){
   // this.myform = this.form.value;
    /* this.new = true;
    this.edit = false;
    this.readMode = false;
    this.cancel = true; */
    this.baseService.onNew(new Employee());
  }
  onEdit(){
    //this.myform = this.form.value;
    /* this.edit = true;
    this.new = false;
    this.readMode = false;
    console.log(this.employeeForm);
    this.cancel = true; */
    this.baseService.onEdit();
  }
  onDelete(){
    /* this.new = false;
    this.edit = true; */
    this.baseService.onDelete();
  }
  onCancel(){
    /* this.cancel = false; */
    this.myform = this.baseService.onCancel();
    this.form.reset(this.myform);
    /* this.readMode = true;
    this.new = false;
    this.edit = false; */
  }

  create(): void {
    
  }
}
