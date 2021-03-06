import { Injectable, Output } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
//import { HttpClientModule } from '@angular/common/http'
import { Observable, BehaviorSubject } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { EventEmitter } from '@angular/core';
import { NgForm } from '@angular/forms';
import * as cloneDeep from 'lodash/cloneDeep';
//import { HttpErrorHandler, HandleError } from './http-error-handler.service';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json'
  })
};

@Injectable({
  providedIn: 'root'
})
export class BaseService {
  record;
  oldRecord;
  searchRecord;
  recordsArr;
  oldRecordsArr;
  records;
  emptyrecords;
  submitted = true;
  fieldeditable = false;
  lastobjid = null;
  lastindex = 0;
  headerobjid;
  emptyRecord;
  private baseUrl;
  form: NgForm;
  oldForm: NgForm;
  newForm: NgForm;
  newMode: boolean = false;
  editMode: boolean = false;
  cancelMode: boolean = false;
  expandMode: boolean = false;
  collapseMode: boolean = true;
  readMode = true;
  selectedList: string[] = [];
  enableSaveInList: boolean = false;
  
   //private handleError: HandleError;
  private saveSubject = new BehaviorSubject<string>("success");
  saveObservable = this.saveSubject.asObservable();
  //constructor(private http: HttpClient, private httpErrorHandler: HttpErrorHandler) {
    //this.handleError = httpErrorHandler.createHandleError('BaseService');
    constructor(private http: HttpClient) {
   }

  init(entity: String, record:any, recordsArr: any, records:any, oldRecord:any,searchRecord: any, form : NgForm ){
    this.baseUrl = 'http://localhost:8080/Micro/'+entity+'/';
    this.record = record;
    this.recordsArr= recordsArr;
    this.records= records;
    this.emptyRecord = Object.assign({}, this.record); 
    this.oldRecord = oldRecord;
    this.searchRecord = searchRecord;
    this.form = form;
  }

  
  createObject(obj: Object): Observable<any> {
    return this.http.post(`${this.baseUrl}` , obj)
    .pipe( 
      //catchError(this.handleError('Create '))
      );
  }

  updateObjct(obj: Object): Observable<any> {
    return this.http.put(`${this.baseUrl}`, obj)
    .pipe( 
      //catchError(this.handleError('Edit '))
      );
  }

  getObject(objid: String): Observable<any> {
    return this.http.get(`${this.baseUrl}/${objid}`);
  }

  getObjectList(): Observable<any> {
    return this.http.get(`${this.baseUrl}`)
    .pipe( 
     // catchError(this.handleError('Populate '))
      );
  }

  getSpecificObjectList(entityType : String,obj: Object): Observable<any> {
    /*return this.http.get(`${ 'http://localhost:8080/Micro/'+entityType+'/'}`)
    .pipe( 
     // catchError(this.handleError('Populate '))
      );*/
      return  this.http.post(`${'http://localhost:8080/Micro/'+entityType}/Search/`,obj)
    .pipe( 
     // catchError(this.handleError('Search '))
      );
  }

  deleteObject(objid: String): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${objid}`,httpOptions)
    .pipe( 
       //catchError(this.handleError('Delete '))
       );
  }

  searchObject(obj: Object): Observable<any> {
    return this.http.post(`${this.baseUrl}/Search/`,obj)
    .pipe( 
     // catchError(this.handleError('Search '))
      );
  }



  /*getPatient(patientId: number): Observable<Object> {
    return this.http.get(`${this.baseUrl}/${patientId}`);
  }*/

 /* getPatientsByAge(email: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/email/${email}`);
  }

  deleteAll(): Observable<any> {
    return this.http.delete(`${this.baseUrl}` + `/delete`, { responseType: 'text' });
  }*/


  

  onSubmit() {
    //this.submitted = true;
    this.submitted = false;
    this.save(); 
  }

  create(emptyrecords:any): void {
    this.fieldeditable  = true;
    this.oldRecord = Object.assign({}, this.record);
    if(this.record !== undefined ){
      this.lastobjid      = this.record.objid;
    }
    this.record         = emptyrecords;
  }

  edit(): void {
    this.oldRecord = Object.assign({}, this.record);
    this.fieldeditable = true;
  }

  delete(objid:String):void{
    this.lastobjid = objid;
    this.updateIndex(objid);
    this.deleteObject(objid).subscribe((data) => {
      if (data === null){
        this.fieldeditable  = false;
        this.reloadByIndex(this.lastindex-1);

        this.recordsArr.splice(this.lastindex,1);
      }
    }, (error) => {
      //catchError(this.handleError('deleteHero'))
      this.fieldeditable  = true;
      this.reload(objid);
    });
    //this.reloadAll();
  }

  cancel(){
    this.fieldeditable = false;
    this.record = this.oldRecord;
    this.enableSaveInList = false;
  }
  save(){
    if(this.record.objid == null){
      this.createObject(this.record)
      .subscribe((data) => {
        if (this.isNotEmpty(data)) {
          this.record         = data;
          this.lastobjid      = data.objid;
          this.headerobjid    = data.objid;
          this.fieldeditable  = false;
          this.recordsArr.push(this.record );
          this.submitted = true;
          this.saveSubject.next("success");
        }
        //this.reloadAll();  
      }, (error) => {
        console.log(error);
        this.fieldeditable  = true;
      });    
    }
    else
    {
      this.updateObjct(this.record)
      .subscribe((data) => {
        if (this.isNotEmpty(data)) {
          this.record         = data;
          this.lastobjid      = data.objid;
          this.fieldeditable  = false;
          this.submitted = true;
          this.saveSubject.next("success");
        }
        //this.search(this.lastobjid );
      }, (error) => {
        console.log(error);
        this.fieldeditable  = true;
      });  
    }
  }


  updateIndex(objid:String){
    var count = 0;
    this.recordsArr.forEach(element => {

      if(element.objid == objid)
      {
        this.lastindex  = count;
        this.lastobjid  = element.objid;
      }
      count = count + 1 ;
    });
  }

  reload(objid: String) {
    //console.log(this.recordsArr);
    this.recordsArr.forEach(element => {
      //console.log(element.patientId);
      if(element.objid === objid)
      {
        //alert(objid);
        console.log(this.record);
        this.record     = element;
        console.log(element);
        //console.log(objid);
        this.lastobjid  = this.record.objid;
        this.headerobjid = this.record.objid;
      }
      this.fieldeditable  = false;
    });
  }

  reloadByIndex(index: number) {
    var count     = 0;
    var tmpindex  = 0;
    //alert(index);
    if(index < 0)
    {
      tmpindex = 1;
    }
    else
    {
      tmpindex = index;
    }
    this.recordsArr.forEach(element => {
      if(count == tmpindex)
      {
        this.record     = element;
        this.lastobjid  = this.record.objid;
        this.headerobjid = this.record.objid;
      }
      count = count + 1;
      this.fieldeditable  = false;
    })
  }

  reloadAll() {
    this.records = this.getObjectList();
    console.log(this.records);
    this.records.subscribe((data) => {
      this.recordsArr = data;
      if (this.lastobjid == null){
        this.record = data[0];
        if(this.record !== undefined ){
          this.headerobjid = this.record.objid;
          this.lastobjid = this.record.objid;
        }
      }
      else{
        this.reload(this.lastobjid);
      }
      this.fieldeditable  = false;
    }, (error) => {
      console.log(error);
      this.fieldeditable  = false;
    });
  }

  
  search(objid: String) {
    this.records = this.searchObject(this.searchRecord);
    //console.error("###### 01 ="+ this.recordsArr.length);
    this.records.subscribe((data) => {
      this.recordsArr = data;
      //console.error("###### 02 ="+ this.recordsArr.length);
      if ( !(this.recordsArr === undefined ||  this.recordsArr.length == 0)) {
        if (objid == null){
          //console.error("###### 03 ="+ this.recordsArr.length);
          //console.error("###### 03 ="+ data[0]);
          this.record = data[0];
          this.headerobjid = this.record.objid;
          this.lastobjid = this.record.objid;
        }
        else{
          //console.error("###### 04 ="+ this.recordsArr.length);
          this.reload(objid);
        }
        this.fieldeditable  = false;
      }
      else{
        //console.error("###### 05 ="+ this.recordsArr.length);
        this.record = Object.assign({}, this.emptyRecord);  
      }
    }, (error) => {
      console.log(error);
      this.fieldeditable  = false;
    });
  }

  isNotEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key))
            return true;

    }
    return false;
  }

  getOtherEntityData(entityType:String, obj:Object) {
    return this.getSpecificObjectList(entityType,obj);
  }

  //---------------------- Command Button Hnadling ----------------------
  onNew(){
    this.oldForm = this.form.value;
    this.newMode = true;
    this.editMode = false;
    this.readMode = false;
    this.cancelMode = true;
    this.create( this.emptyRecord);
  }
  onEdit(){
    this.oldForm = this.form.value;
    this.editMode = true;
    this.newMode = false;
    this.readMode = false;
    this.cancelMode = true;
    this.edit();
  }
  onDelete(){
    this.newMode = false;
    this.editMode = false;
    this.delete(this.record.objid)
  }
  onCancel(): any{
    this.cancelMode = false;
    this.cancel();
    //this.employeeForm.reset(this.myform);
    this.readMode = true;
    this.newMode = false;
    this.editMode = false;
    return this.oldForm;
  }

  onSearch(){
    this.search(null);
  }

  onExpand(){
    this.expandMode = true;
    this.collapseMode = false;
  }

  onCollapse(){
    this.collapseMode = true;
    this.expandMode = false;
  }

  getNew(): boolean{
    return (this.editMode || this.newMode);
  }

  getEdit(): boolean{
    return (this.editMode || this.newMode);
  }

  getDelete(): boolean{
    return (this.editMode || this.newMode);
  }

  getSearch(): boolean{
    return (this.editMode || this.newMode);
  }

  getReadMode(): boolean{
    return this.readMode;
  }

  getCancel(): boolean{
    return this.cancelMode;
  }

  setFormReadOnly(){
    this.readMode = true;
    this.newMode = false;
    this.editMode = false;
    this.cancelMode = false;
    this.expandMode = false;
    this.collapseMode = true;
  }

  getExpand(): boolean{
    return this.expandMode;
  }
  getCollapse(): boolean{
    return this.collapseMode;
  }



  //----list
  setListCellReadMode( ): void{
    for ( let rec of this.recordsArr ) {
      if(rec.selected && rec.edited ) {
        console.log(rec.objid);
        rec.cellReadMode = false;
      }
      else
      {
        rec.cellReadMode = true;
      }
    }
    return null;
  }

  createList(emptyrecords:any): void {
    emptyrecords.cellReadMode  = false;
    emptyrecords.edited        = false;
    emptyrecords.added         = true;
    emptyrecords.selected      = false;
    this.recordsArr.push(emptyrecords);
  }

  onListChange(type:string){
    this.oldRecordsArr = cloneDeep(this.recordsArr);
    console.log(this.recordsArr);
    console.log(this.oldRecordsArr);
    this.oldForm = this.form.value;
    if(type === "NEW"){
      this.newMode = true;
      this.editMode = false;
      this.readMode = false;
      this.cancelMode = true;
      this.createList( this.emptyRecord);
    }
    if(type === "EDIT"){
      for ( let rec of this.recordsArr ) {
        //console.log(this.recordsArr);
        if(rec.selected) {
          rec.cellReadMode  = false;
          rec.edited        = true;
          this.newMode      = false;
          this.readMode     = false;
          this.cancelMode   = true;
        }
        else
        {
          rec.cellReadMode = true;
        }
      }
    }
  }

  onListCancel(): any{

    for ( let rec of this.recordsArr ) {
     
      if((rec.selected && rec.edited) || rec.added){
        rec.edited        = false;
        rec.added         = false;
        this.newMode      = false;
        this.readMode     = true;
        this.cancelMode   = false;
        rec.cellReadMode  = true;
      }
    }
    this.recordsArr = cloneDeep(this.oldRecordsArr);
    this.enableSaveInList = false;
    return this.oldForm;
  }




  //----------- list crud
  reloadList() {
    this.records = this.getObjectList();
    console.log(this.records);
    this.records.subscribe((data) => {
      this.recordsArr = data;
      this.recordsArr.forEach(element => {
        element.cellReadMode  = true;
        element.edited        = false;
        element.added         = false;
        element.selected      = false;
      });
    }, (error) => {
      console.log(error);
    });
  }

  enableSaveButton() {
    this.enableSaveInList = true;
  }

  onSubmitList() {
    //this.submitted = true;
    this.submitted = false;
    for ( let rec of this.recordsArr ) {
     
      if((rec.selected && rec.edited) || rec.added){
        rec.edited        = false;
        rec.added         = false;
        this.newMode      = false;
        this.readMode     = true;
        this.cancelMode   = false;
        rec.cellReadMode  = true;
        this.saveList(rec.objid,rec); 
      }
    }
    
  }

  onDeleteList(){
    this.newMode = false;
    this.editMode = false;
    for ( let rec of this.recordsArr ) {
     
      if(rec.selected){
        rec.edited        = false;
        rec.added         = false;
        this.newMode      = false;
        this.readMode     = true;
        this.cancelMode   = false;
        rec.cellReadMode  = true;
        this.delete(rec.objid); 
      }
    }
  }

  saveList(objid:string,rec:any){
    if(objid == null){
      this.createObject(rec)
      .subscribe((data) => {
        /*if (this.isNotEmpty(data)) {
          this.record         = data;
          this.lastobjid      = data.objid;
          this.headerobjid    = data.objid;
          this.fieldeditable  = false;
          this.recordsArr.push(this.record );
          this.submitted = true;
          this.saveSubject.next("success");
        }*/
        //this.reloadAll();  
        this.reloadList();
        this.enableSaveInList = false;
        //this.reloadList();
      }, (error) => {
        console.log(error);
        this.fieldeditable  = true;
        this.enableSaveInList = true;
      });    
    }
    else
    {
      this.updateObjct(rec)
      .subscribe((data) => {
        /*if (this.isNotEmpty(data)) {
          this.record         = data;
          this.lastobjid      = data.objid;
          this.fieldeditable  = false;
          this.submitted = true;
          this.saveSubject.next("success");
        }*/
        //this.search(this.lastobjid );
        this.reloadList();
        this.enableSaveInList = false;
       // this.reloadList();
      }, (error) => {
        console.log(error);
        this.fieldeditable  = true;
        this.enableSaveInList = true;
      });  
    }
  }


}
