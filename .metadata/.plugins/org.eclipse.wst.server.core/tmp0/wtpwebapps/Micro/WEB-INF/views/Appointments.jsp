<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<title>ATAI</title>
	<style>
		/*html
		{
		    position: relative;
		    min-height: 500px;
		    min-width: 300px;
		    height: 100%;
		}
		
		body
		{
		
		    position:                        absolute;
		    height:                          500px;
		    width:                           350px;
		}
	 	.appointmentDate.ng-valid {
	   		background-color: lightgreen;
	    }*/
	   /* .appointmentDate.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .appointmentDate.ng-dirty.ng-invalid-minlength {
	        background-color: yellow;
	    }
	
	    .appointmentTime.ng-valid {
	        background-color: lightgreen;
	    }
	    /*.appointmentTime.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .appointmentTime.ng-dirty.ng-invalid-email {
	        background-color: yellow;
	    }
	 	.doctor.ng-valid {
	        background-color: lightgreen;
	    }
	    /*.doctor.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .doctor.ng-dirty.ng-invalid-minlength {
	        background-color: yellow;
	    }
	    
	    .code.ng-valid {
	        background-color: lightgreen;
	    }
	    /*.code.ng-dirty.ng-invalid-required {
	        background-color: red;
	    }*/
	    .code.ng-dirty.ng-invalid-minlength {
	        background-color: yellow;
	    }

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css"> 
    <script src="webjars/jquery/2.1.4/jquery.min.js"></script> 
    <script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>  
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.timepicker.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/lov.css' />" rel="stylesheet"></link>
    
    <script src="webjars/angularjs/1.5.8/angular.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
    <script src="<c:url value='/static/js/app.js' />"></script>
    <script src="<c:url value='/static/js/service/service.js' />"></script>
    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
    <script src="<c:url value='/static/js/entity/Appointment.js' />"></script>
    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>   
    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script> 
    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>

    
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59499",secure:"59508"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body ng-app="generalModule" class="ng-cloak" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-0" data-genuitec-path="/Micro/src/main/webapp/WEB-INF/views/Appointments.jsp">
	<div id="con" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init();ctrl.setPanelHeader('Appointment')"  data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-0" data-genuitec-path="/Micro/src/main/webapp/WEB-INF/views/Appointments.jsp">
    	<div class="panel panel-default">
        	<div class="panel-heading" ng-bind-html="panelHeader"></div>
            <div class="formcontainer">
           		<form ng-submit="ctrl.submit();" name="myForm" class="form-horizontal">
           			<div id="lov" unter-lov class = "lov"></div>	
               		<input type="hidden" ng-model="ctrl.Record.objid" /> 
         			<input type="hidden" ng-model="ctrl.Record.id.patientId" id="patientId" class="patientId form-control input-sm" placeholder="Enter Patient ID " required/>
         			<input type="hidden" ng-model="ctrl.Record.id.appointmentId" id="patientId" class="patientId form-control input-sm" placeholder="Enter Patient ID " />
                    <div class="row">
                    	<div class="form-group col-xs-6">
                    		<label class="col-md-2 control-lable" for="appointmentDate">Date</label>
                    		<div class="col-md-3">
	                            <p><md-datepicker ng-model="ctrl.Record.appointmentDate"  md-placeholder="Enter Date" required md-min-date="ctrl.today"></md-datepicker></p>
	                            <div class="has-error" ng-show="myForm.$dirty">
	                            	<span ng-show="myForm.appointmentDate.$error.required">This is a required field</span>
	                                <span ng-show="myForm.appointmentDate.$invalid">This field is invalid </span>
	                            </div>
                            </div>
                 		</div>
<!--   					</div> -->
<!--                    	<div class="row"> -->
                    	<div class="form-group col-xs-6">
                         	<label class="col-md-2 control-lable" for="appointmentTime">Time</label>
                            <div class="col-md-3">
                            	<p> <input type="text" ng-model="ctrl.Record.appointmentTime" id="appointmentTime" class="appointmentTime form-control input-sm" placeholder="Enter Appointment Time" required  ng-blur="ctrl.populateTargetPage()"/></p>
                              	<div class="has-error" ng-show="myForm.$dirty">
                                	<span ng-show="myForm.appointmentTime.$error.required">This is a required field</span>
                                </div> 
                      		</div>
                		</div>
            		</div>
                    <div class="row">
                    	<div class="form-group col-xs-6">
                        	<label class="col-md-2 control-lable" for="doctor">Doctor</label>
                            <div class="col-md-3">
                            	<select ng-model="ctrl.Record.doctor" ng-options="x for x in ctrl.doctors" id="doctor" class="doctor form-control input-sm" placeholder="Enter Doctor" required ng-focus="ctrl.setFocusedElement()"  ng-blur="ctrl.populateTargetPage()"></select>
                              	<div class="has-error" ng-show="myForm.$dirty">
                               		<span ng-show="myForm.doctor.$error.required">This is a required field</span>
                                </div>
                     		</div>
             			</div>
             			
             			<div class="form-group col-xs-6">
                        	<label class="col-md-2 control-lable" for="code" >Treatment Code</label>
                            <div class="col-md-3">
                            	<select ng-model="ctrl.Record.code" id="code" class="code form-control input-sm" placeholder="Select Treatment Code" >
								  		<option value=""></option>
								  		<option value="General">General</option>
								  		<option value="Treatment 1">Treatment 1</option>
								  		<option value="Treatment 2">Treatment 2</option>
									</select>
                     		</div>
             			</div>
             			
               		</div>
                    <div class="row">
            			<div class="form-actions floatRight">
                       		<input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" >Reset Form</button>
                            <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
<!--                             <button type="button" ng-click="ctrl.ListOfValues()" class = "btn btn-warning btn-sm">List...</button> -->
                    	</div>
               		</div>
    			</form>
			</div>
          
          	<div class="panel panel-default">
       			<div class="panel-heading"><span class="lead">List of Appointments </span></div>
              	<div class="tablecontainer">
               		<table id="tableId" class="table table-hover">
                  		<thead>
                        	<tr>
                   				<th>Date</th>
                              	<th>Time</th>
                              	<th>Doctor</th>
                              	<th>Treatment Code</th>
                              	<th width="20%"></th>
                          	</tr>
                      	</thead>
           			<tbody>
                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize " ng-dblclick="ctrl.edit(u.objid)" >
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'appointmentDate', u.appointmentDate)|date:yyyy/MM/dd"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.appointmentTime"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.doctor"></span></td>
	                        <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.code"></span></td>
	                                                                                         
	                        <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.appointmentDate"></md-datepicker></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.appointmentTime" style="width: 100%""/></td>
	                        <td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.doctor" style="width: 100%""/></td>
	                        <td>
	                        	<button type="button" ng-click="ctrl.remove(u.objid)" class="btn btn-danger custom-width">Remove</button>
	                        </td>
                        </tr>
                 	</tbody>
                      
                  	</table>
                  	<button ng-disabled="ctrl.currentPage == 0" ng-click="ctrl.currentPage=ctrl.currentPage-1">
        				Previous
    			  	</button>
    					{{ctrl.currentPage+1}}/{{ctrl.numberOfPages()}}
    			  	<button ng-disabled="ctrl.currentPage >= ctrl.Records.length/ctrl.pageSize - 1" ng-click="ctrl.currentPage=ctrl.currentPage+1">
       					Next
    				</button>
              	</div>
          	</div>
      	</div>
  	</div>
</body>
	<script type="text/javascript">
       //var  scope= angular.element(document.getElementById("con")).scope();
       //scope.ctrl.setPanelHeader("Appointment");
       function populate(patientId,patientName) 
       {
    	   var scope = angular.element(document.getElementById("con")).scope();
           scope.ctrl.Record.id.patientId = patientId;
           scope.ctrl.Record.id.appointmentId = '';
           scope.ctrl.Record.appointmentDate = '';
           scope.ctrl.Record.appointmentTime = '';
           scope.ctrl.Record.doctor = '';
           scope.ctrl.Record.code = '';
           scope.ctrl.Record.objid = null;
           scope.ctrl.setPanelHeader("Appointment - "+patientName);
           scope.$apply(scope.ctrl.searchRecords());
       }
           
       $(function() {
           $('#appointmentTime').timepicker({
        	    'disableTimeRanges': [
    	                ['11pm', '12am'],
     	                ['12am', '6am']
  	                  ],
           'scrollDefault': 'now'                 
           });
       });

       
//        $(document).ready(function() {
//     	   var scopeT = angular.element(document.getElementById("con")).scope();
// //     	   watch(scopeT.ctrl.Record, "appointmentDate", function(){
// //     		   alert("f1.Reset NOT found X3");
// //     		   populatePage(scopeT.ctrl.Record);
    		   
//     		   watch(scopeT.ctrl.Record, "doctor", function(){
//         		   alert("f1.Reset NOT found X3");
//         		   populatePage(scopeT.ctrl.Record);
//        	});
//     	})
       function populatePage(Record) 
       {
           if (typeof (parent.document.getElementById("f3").contentWindow.populate) == "function"){
        	   var date;
        	   if( typeof (Record.appointmentDate)==="number")
        		   {
        		   date =new Date(Record.appointmentDate);      		   
        		   }
        	   else
        		   {
        		   date = Record.appointmentDate;
        		   }
        		   
        		   
        		   
           		parent.document.getElementById("f3").contentWindow.populate(date,Record.doctor,Record.appointmentTime);
           }
           else
        	   {
               alert("f1.Reset NOT found X3");
        	   }
       }  
       
       function cc(Record) 
       {
           
               alert("f1SSSSSSSSSSSSSSSSS");
       } 
    </script>
</html>