import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { NgForm, FormControl, FormGroup } from '@angular/forms';
import { Observable, Subscription } from 'rxjs';

import { Cbo } from './cbo';
import { BaseService } from '../base.service';
import { asElementData } from '@angular/core/src/view';



@Component({
  selector: 'app-cbo',
  templateUrl: './cbo.component.html',
  styleUrls: ['./cbo.component.css']
})
export class CboComponent implements OnInit {
  @ViewChild('f') form : NgForm;
  myform: any;
  saveSubscription: Subscription;

  record: Cbo = new Cbo();
  oldRecord: Cbo = new Cbo();
  searchRecord: Cbo = new Cbo();
  recordsArr: Cbo[];
  records: Observable<Cbo[]>;
  employees : any;
  branches : any;
  constructor(private baseService: BaseService) { 
  }

  ngOnInit() {
    this.baseService.init('Cbo', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord,this.form);
    this.baseService.reloadAll();
    this.onLovList();
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

  ngOnDestroy(){
    this.saveSubscription.unsubscribe();
  }
  onLovList():void
  {
    this.employees = this.baseService.getOtherEntityData('Employee',this.searchRecord);
    this.branches = this.baseService.getOtherEntityData('Branch',this.searchRecord);    
  }
}

