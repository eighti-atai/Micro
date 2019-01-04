import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { NgForm, FormControl, FormGroup } from '@angular/forms';
import { Observable, Subscription } from 'rxjs';

import { Branch } from './branch';
import { BaseService } from '../base.service';


@Component({
  selector: 'app-branch',
  templateUrl: './branch.component.html',
  styleUrls: ['./branch.component.css']
})
export class BranchComponent implements OnInit {
  @ViewChild('f') branchForm : NgForm;
  myform: any;
  saveSubscription: Subscription;
  record: Branch = new Branch();
  oldRecord: Branch = new Branch();
  searchRecord: Branch = new Branch();
  recordsArr: Branch[];
  records: Observable<Branch[]>;

  constructor(private baseService: BaseService) { 

  }

  ngOnInit() {
    //this.record = {objid: "p3x5"};
    this.baseService.init('Branch', this.record, this.recordsArr, this.records,this.oldRecord,this.searchRecord,this.branchForm);
    this.baseService.reloadAll();
    this.saveSubscription = this.baseService.saveObservable.subscribe(result => {
      if(result === "success"){
        this.myform = this.branchForm.value;
        this.branchForm.reset(this.myform);
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
    this.baseService.onNew(new Branch());
  }
  onEdit(){
    this.baseService.onEdit()
  }
  onDelete(){
    this.baseService.onDelete();
  }
  onCancel(){
    this.myform = this.baseService.onCancel();
    this.branchForm.reset(this.myform);
  }
  onSearch(){
    this.baseService.onSearch();
  }
  onSave(){
    this.baseService.onSubmit();
  }
}

