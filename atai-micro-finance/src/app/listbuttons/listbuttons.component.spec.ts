import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListbuttonsComponent } from './listbuttons.component';

describe('ListbuttonsComponent', () => {
  let component: ListbuttonsComponent;
  let fixture: ComponentFixture<ListbuttonsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListbuttonsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListbuttonsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
