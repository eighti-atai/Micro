import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import {FormArray  } from "@angular/forms";
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-employees',
  templateUrl: './employees.component.html',
  styleUrls: ['./employees.component.css']
})
export class EmployeesComponent implements OnInit {
  @ViewChild('f') employeeForm : NgForm;
  new: boolean = false;
  edit: boolean = false;
  cancel: boolean = false;
  readMode = true;
  defaultTitle = "mr";
  defaultName = "";
  record: any;
  recordFormat = {title: "string", firstName: "string", middleName: "string", lastName: "string", gender: "string"}
  employeesForm : FormGroup;
  rows: FormArray;
  

  constructor(private fb: FormBuilder) { }

  ngOnInit() {
    this.record = {objid: null};
    this.employeesForm = this.fb.group({
      rows: this.fb.array([
        ])
    });
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
    console.log(this.employeeForm);
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

  

}
