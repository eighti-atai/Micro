import { Injectable, Output } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
//import { HttpClientModule } from '@angular/common/http'
import { Observable, BehaviorSubject } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { EventEmitter } from '@angular/core';
import { NgForm } from '@angular/forms';
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
  readMode = true;
  
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
  onNew(newRec: any){
    this.oldForm = this.form.value;
    this.newMode = true;
    this.editMode = false;
    this.readMode = false;
    this.cancelMode = true;
    this.create(newRec);
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
  }
}
