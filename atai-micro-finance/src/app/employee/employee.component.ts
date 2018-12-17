import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Observable } from 'rxjs';

import { Employee } from './employee';
import { BaseService } from '../base.service';


@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {
  @ViewChild('f') employeeForm : NgForm;
  new: boolean = false;
  edit: boolean = false;
  cancel: boolean = false;
  readMode = true;
  defaultTitle = "mr";
  defaultName = "";
  //record: any;

  record: Employee = new Employee();
  oldRecord: Employee = new Employee();
  searchRecord: Employee = new Employee();
  recordsArr: Employee[];
  records: Observable<Employee[]>;
  submitted = false;
  lastobjid = null;
  constructor(private baseService: BaseService) { }

  ngOnInit() {
    //this.record = {objid: "p3x5"};
    this.baseService.init('Employee', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord);
    this.baseService.reloadAll();
  }
  onNew(){
    this.new = true;
    this.edit = false;
    this.readMode = false;
    this.cancel = true;
    this.baseService.create(new Employee());
  }
  onEdit(){
    this.edit = true;
    this.new = false;
    this.readMode = false;
    console.log(this.employeeForm);
    this.cancel = true;
    this.baseService.edit()
  }
  onDelete(){
    this.new = false;
    this.edit = true;
    this.baseService.delete(this.baseService.record.objid)
  }
  onCancel(){
    this.cancel = false;
    this.baseService.cancel()
  }

  create(): void {
    
  }
}
