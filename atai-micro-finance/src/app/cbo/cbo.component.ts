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
  @ViewChild('f') cboForm : NgForm;
  new: boolean = false;
  edit: boolean = false;
  cancel: boolean = false;
  readMode = true;
  defaultTitle = "mr";
  defaultName = "";
  myform: any;
  saveSubscription: Subscription;

  record: Cbo = new Cbo();
  oldRecord: Cbo = new Cbo();
  searchRecord: Cbo = new Cbo();
  recordsArr: Cbo[];
  records: Observable<Cbo[]>;
  submitted = false;
  lastobjid = null;
  saving: boolean = true;
  employees : any;
  branches : any;
  constructor(private baseService: BaseService) { 
     // this.record = {objid};
  }

  ngOnInit() {
    //this.record = {objid: "p3x5"};
    this.baseService.init('Cbo', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord,this.cboForm);
    this.baseService.reloadAll();
    this.onLovList();
    this.saveSubscription = this.baseService.saveObservable.subscribe(result => {
      if(result === "success"){
        this.myform = this.cboForm.value;
        this.cboForm.reset(this.myform);
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
  onNew(){
    this.baseService.onNew(new Cbo());
  }
  onEdit(){
    this.baseService.onEdit()
  }
  onDelete(){
    this.baseService.onDelete();
  }
  onCancel(){
    this.myform = this.baseService.onCancel();
    this.cboForm.reset(this.myform);
  }
  onSearch(){
    this.baseService.onSearch();
  }
  onSave(){
    this.baseService.onSubmit();
  }

  onLovList():void
  {
    this.employees = this.baseService.getOtherEntityData('Employee',this.searchRecord);
    this.branches = this.baseService.getOtherEntityData('Branch',this.searchRecord);    
  }
}

