import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import {FormArray  } from "@angular/forms";
import { NgForm } from '@angular/forms';
import { BaseService } from '../base.service';
import { Employee } from '../employee/employee';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-employees',
  templateUrl: './employees.component.html',
  styleUrls: ['./employees.component.css']
})
export class EmployeesComponent implements OnInit {
  @ViewChild('f') form : NgForm;
  new: boolean = false;
  edit: boolean = false;
  cancel: boolean = false;
  readMode = true;
  defaultTitle = "mr";
  defaultName = "";
  //record: any;
  recordFormat = {title: "string", firstName: "string", middleName: "string", lastName: "string", gender: "string"}
  employeesForm : FormGroup;
  rows: FormArray;

  record: Employee = new Employee();
  oldRecord: Employee = new Employee();
  searchRecord: Employee = new Employee();
  recordsArr: Employee[];
  records: Observable<Employee[]>;
  submitted = false;
  lastobjid = null;
  

  constructor(private fb: FormBuilder, private baseService: BaseService) { }

  ngOnInit() {
    //this.record = {objid: null};
    this.employeesForm = this.fb.group({
      rows: this.fb.array([
        ])
    });
    this.baseService.init('Employee', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord,this.form);
    this.baseService.reloadList();
  }
  onNew(){
    //this.new = true;
    this.edit = false;
    this.readMode = false;
    this.cancel = true;
    this.rows = this.employeesForm.get('rows') as FormArray;
    this.rows.push(this.createRow());
  }
  createRow(): FormGroup{
    return this.fb.group({
      title: '', 
      firstName: '', 
      middleName: '',
      lastName: '', 
      gender: ''
    });
  }
  onEdit(){
    this.edit = true;
    this.new = false;
    this.readMode = false;
    console.log(this.form);
    this.cancel = true;
  }
  onDelete(){
    this.new = false;
    this.edit = true;
  }
  onCancel(){
    this.cancel = false;
  }

  getaliases() {
    return this.employeesForm.get('rows') as FormArray;
  }

  onSubmit() {
    // TODO: Use EventEmitter with form value
    //console.warn(this.employeesForm.value);
    console.log(this.getaliases())
  }

  /*ngAfterViewInit() {
    this.form.form.controls.EmployeesComponent.valueChanges.subscribe((change) => {
     console.log("##################"+change)
    })
    this.baseService.records.title.
  }*/

}
