import { Component, OnInit, Input } from '@angular/core';
import { BaseService } from '../base.service';

@Component({
  selector: 'app-selector',
  templateUrl: './selector.component.html',
  styleUrls: ['./selector.component.css']
})
export class SelectorComponent implements OnInit {
  @Input() title:string;
  @Input() select1:string;
  @Input() select2:string;
  @Input() select3:string;
  constructor(private baseService: BaseService) { }

  ngOnInit() {
  }

}
