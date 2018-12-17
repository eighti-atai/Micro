<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ATAI</title>
	    
	    <script type="text/javascript">
	    function populatePage(Record) 
	       {
	           if (typeof (parent.document.getElementById("f2").contentWindow.populate) == "function")
	           		parent.document.getElementById("f2").contentWindow.populate(Record.date,Record.doctor,Record.time);
	           else
	               alert("f1.Reset NOT found X3");
	       } 
	        
	    </script>
		
		<style>
			/*html
			{
			    position: relative;
			    min-width: 500px;
			    min-height: 300px;
			    height: 100%;
			}
			body
			{	
			    position:                        absolute;
			    height:                             300px;
			    width:                             500px;
			}
			
			{
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}*/
			::-webkit-input-placeholder { /* WebKit browsers */
			    text-transform: none;
			}
			:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
			    text-transform: none;
			}
			::-moz-placeholder { /* Mozilla Firefox 19+ */
			    text-transform: none;
			}

	 		.patientId.ng-valid {
	         	background-color: lightgreen;
	      	}
	      	.patientId.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientId.ng-dirty.ng-invalid-minlength {
	          	background-color: yellow;
	      	}
	 
	      	.name.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.name.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.name.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	 		.doctor.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.doctor.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.doctor.ng-dirty.ng-invalid-minlength {
	          	background-color: yellow;
	      	}
	 
	      	.date.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.date.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.date.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	      	.time.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.time.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.time.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	 
	      	.contactNo.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.contactNo.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.contactNo.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}

	       .code.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.code.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.code.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	      	.contactNo2.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.contactNo2.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.contactNo2.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	
			.contactNoFo.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.contactNoFo.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.contactNoFo.ng-dirty.ng-invalid-email {
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
	    <script src="<c:url value='/static/js/entity/TmpAppointment.js' />"></script>
	    <script src="<c:url value='/static/js/other/jquery.timepicker.js' />"></script>
	    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script>     
        <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>   
	    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
	    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
	    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>
	</head>



	<body ng-app="generalModule" class="ng-cloak">
		<div id="con1" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()">  
		 
		    <div class="panel panel-default">
		    	<div class="panel-heading"><span class="lead">Appointment Details</span></div>
		        <div class="formcontainer">
		        	<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
		        			
		            	<input type="hidden" ng-model="ctrl.Record.objid" /> 
		            	<input id="appointmentId" type="hidden" ng-model="ctrl.Record.appointmentId" /> 
		            	<input id="patientId" type="hidden" ng-model="ctrl.Record.patientId" /> 
		            	<input id="orgAppoinmentId" type="hidden" ng-model="ctrl.Record.orgAppoinmentId" /> 
		
						<div class="row">
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="name">Name</label>
		                        <div class="col-sm-10">
		                        	<input type="text" ng-model="ctrl.Record.name" id="name" class="name form-control input-sm" placeholder="Enter Patient Name " style="text-transform: capitalize;"/>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                            	<span ng-show="myForm.name.$error.required">This is a required field</span>
		                                <span ng-show="myForm.name.$invalid">This field is invalid </span>
		                            </div>
		                		</div>
		                	</div>
<!-- 		                </div> -->
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="contactNo">Contact No</label>
		                        <div class="col-sm-10">
		                           	<input type="text" pattern="^\d{10}$" ng-model="ctrl.Record.contactNo" id="contactNo" class="contactNo form-control input-sm" placeholder="Enter Phone Number" maxlength="10" onkeypress="return isNumberKey(event)"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
<!-- 		                </div> -->
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="date">Date</label>
		                        <div class="col-sm-10">		                        	
		                        	<md-datepicker ng-model="ctrl.Record.date" md-placeholder="Enter date" required ng-blur="ctrl.populateTargetPage()"></md-datepicker>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                        	</div>
		                        </div>
		                	</div>
		                </div>
		                   
		                <div class="row"> 
                    	<div class="form-group col-sm-4">
                         	<label class="col-sm-2 control-lable" for="time" >Time</label>
                            <div class="col-sm-10">
                            	<p> <input type="text" ng-model="ctrl.Record.time" id="time" class="time form-control input-sm" placeholder="Enter Appointment Time" required  ng-blur="ctrl.populateTargetPage()"/></p>
                              	<div class="has-error" ng-show="myForm.$dirty">
                                	<span ng-show="myForm.time.$error.required">This is a required field</span>
                                </div> 
                      		</div>
                		</div>
<!--                  		</div>    -->
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="doctor">Doctor</label>
		                        <div class="col-sm-10">
		                           	<select ng-model="ctrl.Record.doctor" ng-options="x for x in ctrl.doctors" id="doctor" class="doctor form-control input-sm" placeholder="Enter Doctor" required ng-focus="ctrl.setFocusedElement()"  ng-blur="ctrl.populateTargetPage()"></select>
                              		<div class="has-error" ng-show="myForm.$dirty">
                               			<span ng-show="myForm.doctor.$error.required">This is a required field</span>
                                	</div>
		                        </div>
		                	</div>
<!-- 		                </div> -->

<!-- 		                <div class="row"> -->
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="code">Code</label>
		                        <div class="col-sm-10">
		                      		<select ng-model="ctrl.Record.code" id="code" class="code form-control input-sm" placeholder="Select Gender">
								  		<option value=""></option>
								  		<option value="General">General</option>
								  		<option value="Treatment 1">Treatment 1</option>
								  		<option value="Treatment 2">Treatment 2</option>
									</select>
								</div>
							</div>
		                </div>
						<div class="row"> 
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="contactNo2">Contact No 2</label>
		                        <div class="col-sm-10">
		                           	<input type="text" pattern="^\d{10}$" ng-model="ctrl.Record.contactNo2" id="contactNo2" class="contactNo2 form-control input-sm" placeholder="Enter Phone Number" maxlength="10" onkeypress="return isNumberKey(event)"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
		                	
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="contactNoFo">Overseas Contact</label>
		                        <div class="col-sm-10">
		                           	<input type="text" ng-model="ctrl.Record.contactNoFo" id="contactNoFo" class="contactNoFo form-control input-sm" placeholder="Enter Overseas Phone Number" maxlength="20" onkeypress="return isNumberKey(event)"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
 		                </div>
		                <div class="row">
		                	<div class="form-actions floatRight">
		                    	<input type="submit"  value="{{!ctrl.Record.objid ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
		                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" >Reset Form</button>
		                        <button type="button" ng-click="ctrl.searchRecords()" class="btn btn-warning btn-sm" >Search</button>
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
		                        	<th>Name</th>
		                        	<th>Contact No</th>
		                        	<th>Contact No2</th>
		                        	<th>Overseas Contact</th>
		                            <th>Doctor</th>
		                            <th>Date</th>
		                            <th>Time</th>	                            
		                            <th>Code</th>
		                            <th width="10%"></th>
		                        </tr>
		                  	</thead>
		                	<tbody>
		                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize" ng-dblclick="ctrl.populateRecord(u.objid)" >
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.name" style="text-transform: capitalize;"></span></td>
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.contactNo"></span></td>
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.contactNo2"></span></td>
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.contactNoFo"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.doctor"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'date', u.date)|date:yyyy/MM/dd"></span></td>  
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.time"></span></td>
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.code"></span></td>
		                                                                                          
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.name"style="width: 100%"/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.doctor" style="width: 100%""/></td>
		                            <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.date"></md-datepicker></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.time" style="width: 100%""/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.code" style="width: 100%""/></td>
		                              
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
	       
	        $(function() {
	            $('#time').timepicker({
	         	    'disableTimeRanges': [
	     	                ['11pm', '12am'],
	      	                ['12am', '6am']
	   	                  ],
	            'scrollDefault': 'now'                 
	            });
	        });
	        
	        function isNumberKey(evt){
	            var charCode = (evt.which) ? evt.which : event.keyCode
	            if (charCode > 31 && (charCode < 48 || charCode > 57))
	                return false;
	            return true;
	        }
	    </script>
</html>