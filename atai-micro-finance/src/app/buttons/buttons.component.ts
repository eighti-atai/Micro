import { Component, OnInit, Input } from '@angular/core';
import { Employee } from '../employee/employee';
import { BaseService } from '../base.service';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-buttons',
  templateUrl: './buttons.component.html',
  styleUrls: ['./buttons.component.css']
})
export class ButtonsComponent implements OnInit {
  @Input() valid: boolean;
  @Input() dirty: boolean;
  @Input() myform: any;
  @Input() form : NgForm;
  constructor(private baseService: BaseService) { }

  ngOnInit() {
  }

  
  onNew(){
    this.baseService.onNew(new Employee());
  }
  onEdit(){
    this.baseService.onEdit()
  }
  onDelete(){
    this.baseService.onDelete();
  }
  onCancel(){
    this.myform = this.baseService.onCancel();
    this.form.reset(this.myform);
  }
  onSearch(){
    this.baseService.onSearch();
  }
  onSave(){
    this.baseService.onSubmit();
  }
  onExpand(){
    this.baseService.onExpand();
  }
  onCollapse(){
    this.baseService.onCollapse();
  }
}
