import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-navigator',
  templateUrl: './navigator.component.html',
  styleUrls: ['./navigator.component.css']
})
export class NavigatorComponent implements OnInit {
  open: boolean;
  navigator =  [];
  constructor() { }

  ngOnInit() {
    this.open = true;
    this.navigator =  [{index: 1, hide: true}, 
                       {index: 2, hide: true}, 
                       {index: 3, hide: true}, 
                       {index: 4, hide: true}];
  }

  showSubmenu(i){
    this.navigator[i].hide = !this.navigator[i].hide;
  }

  openNav(){
    this.open = !this.open;
  }
}
