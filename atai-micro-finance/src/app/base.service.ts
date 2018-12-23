import { Injectable, Output } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
//import { HttpClientModule } from '@angular/common/http'
import { Observable, BehaviorSubject } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { EventEmitter } from '@angular/core';
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
  
   //private handleError: HandleError;
  private saveSubject = new BehaviorSubject<string>("success");
  saveObservable = this.saveSubject.asObservable();
  //constructor(private http: HttpClient, private httpErrorHandler: HttpErrorHandler) {
    //this.handleError = httpErrorHandler.createHandleError('BaseService');
    constructor(private http: HttpClient) {
   }

  init(entity: String, record:any, recordsArr: any, records:any, oldRecord:any,searchRecord: any ){
    this.baseUrl = 'http://localhost:8080/Micro/'+entity+'/';
    this.record = record;
    this.recordsArr= recordsArr;
    this.records= records;
    this.emptyRecord = Object.assign({}, this.record); 
    this.oldRecord = oldRecord;
    this.searchRecord = searchRecord;
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

  getSpecificObjectList(entityType : String): Observable<any> {
    return this.http.get(`${ 'http://localhost:8080/Micro/'+entityType+'/'}`)
    .pipe( 
     // catchError(this.handleError('Populate '))
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
    
    this.records.subscribe((data) => {
      this.recordsArr = data;
      if ( !(this.recordsArr === undefined ||  this.recordsArr.length == 0)) {
        if (objid == null){
          this.record = data[0];
          this.headerobjid = this.record.objid;
          this.lastobjid = this.record.objid;
        }
        else{
          this.reload(objid);
        }
        this.fieldeditable  = false;
      }
      else{
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

  getOtherEntityData(entityType:String) {
    return this.getSpecificObjectList(entityType);
  }
}
