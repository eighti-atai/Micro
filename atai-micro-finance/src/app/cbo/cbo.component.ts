import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { NgForm, FormControl, FormGroup } from '@angular/forms';
import { Observable, Subscription } from 'rxjs';

import { Cbo } from './cbo';
import { BaseService } from '../base.service';



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
  constructor(private baseService: BaseService) { 
     // this.record = {objid};
  }

  ngOnInit() {
    //this.record = {objid: "p3x5"};
    this.baseService.init('Cbo', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord);
    this.baseService.reloadAll();
    this.saveSubscription = this.baseService.saveObservable.subscribe(result => {
      if(result === "success"){
        this.myform = this.cboForm.value;
        this.cboForm.reset(this.myform);
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
    this.new = true;
    this.edit = false;
    this.readMode = false;
    this.cancel = true;
    this.baseService.create(new Cbo());
  }
  onEdit(){
    this.edit = true;
    this.new = false;
    this.readMode = false;
    console.log(this.cboForm);
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

