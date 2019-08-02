import { Component, OnInit , Input} from '@angular/core';
import { BaseService } from '../base.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-listbuttons',
  templateUrl: './listbuttons.component.html',
  styleUrls: ['./listbuttons.component.css']
})

export class ListbuttonsComponent implements OnInit {

  @Input() valid: boolean;
  @Input() dirty: boolean;
  @Input() myform: any;
  @Input() form : NgForm;
  constructor(private baseService: BaseService) { }

  ngOnInit() {
  }

  onNew(){
    this.baseService.onListChange("NEW");
  }
  onEdit(){
    this.baseService.onListChange("EDIT");
  }
  onDelete(){
    this.baseService.onDelete();
  }
  onCancel(){
    this.myform = this.baseService.onListCancel();
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
