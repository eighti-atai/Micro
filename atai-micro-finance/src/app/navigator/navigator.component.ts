import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-navigator',
  templateUrl: './navigator.component.html',
  styleUrls: ['./navigator.component.css']
})
export class NavigatorComponent implements OnInit {
  hide: boolean;
  open: boolean;
  constructor() { }

  ngOnInit() {
    this.hide = true;
    this.open = true;
  }

  showSubmenu(){
    this.hide = !this.hide;
  }

  openNav(){
    this.open = !this.open;
  }
}
