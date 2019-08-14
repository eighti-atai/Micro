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
  myform: any;
  saveSubscription: Subscription;

  record: Employee = new Employee();
  oldRecord: Employee = new Employee();
  searchRecord: Employee = new Employee();
  recordsArr: Employee[];
  records: Observable<Employee[]>;
  constructor(private baseService: BaseService) { }

  ngOnInit() {
    this.baseService.init('Employee', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord, this.form);
    this.baseService.reloadAll();
    this.saveSubscription = this.baseService.saveObservable.subscribe(result => {
      if(result === "success"){
        this.myform = this.form.value;
        this.form.reset(this.myform);
        this.baseService.setFormReadOnly();
      }
      else{
        alert("Error Occurred trying to Save the record");
      }
    });
  }

  ngAfterViewInit() {
    this.form.form.valueChanges.subscribe((change) => {
     console.log("##################"+change)
    })
  }

  ngOnDestroy(){
    this.saveSubscription.unsubscribe();
  }
}
