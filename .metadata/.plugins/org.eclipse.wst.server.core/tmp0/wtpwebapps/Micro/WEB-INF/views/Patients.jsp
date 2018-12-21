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
	            if (typeof (parent.document.getElementById("f1").contentWindow.populate) == "function")
	            	parent.document.getElementById("f1").contentWindow.populate(Record.patientId, Record.patientName);
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
	 
	      	.patientName.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientName.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientName.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	 		.patientAddress.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientAddress.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientAddress.ng-dirty.ng-invalid-minlength {
	          	background-color: yellow;
	      	}
	 
	      	.patientIdNo.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientIdNo.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientIdNo.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
	      	
	 
	      	.patientContactNo.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientContactNo.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientContactNo.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}

	       .patientGender.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.patientGender.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.patientGender.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
	      	
			.email.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.email.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.email.ng-dirty.ng-invalid-email {
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
	      	
	      	.title.ng-valid {
	          	background-color: lightgreen;
	      	}
	      	.title.ng-dirty.ng-invalid-required {
	          	background-color: red;
	      	}
	      	.title.ng-dirty.ng-invalid-email {
	          	background-color: yellow;
	      	}
			.modal {
			    display: none; /* Hidden by default */
			    position: fixed; /* Stay in place */
			    z-index: 1; /* Sit on top */
			    padding-top: 100px; /* Location of the box */
			    left: 0;
			    top: 0;
			    width: 100%; /* Full width */
			    height: 100%; /* Full height */
			    overflow: auto; /* Enable scroll if needed */
			    background-color: rgb(0,0,0); /* Fallback color */
			    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
			}
		
			/* Modal Content */
			.modal-content {
			    background-color: #fefefe;
			    margin: auto;
			    padding: 20px;
			    border: 1px solid #888;
			    width: 80%;
			}
		
			/* The Close Button */
			.close {
			    color: #aaaaaa;
			    float: right;
			    font-size: 28px;
			    font-weight: bold;
			}
		
			.close:hover,
			.close:focus {
			    color: #000;
			    text-decoration: none;
			    cursor: pointer;
			}
			.input-selector-cc {
			    background-color: transparent;
			    border: 0px solid;
			    height: 20px;
			    width: 360px;
 			   color: #0000FF;
 			    font-size:14px;
			}
			.collapsible {
			    background-color: #777;
			    color: white;
			    cursor: pointer;
			    padding: 4px;
			    width: 100%;
			    border: black;
			    text-align: left;
			    font-size: 10px;
			}

			.active, .collapsible:hover {
			    background-color: #555;
			}

			.content {
			    padding: 0 18px;
			    display: none;
			    overflow: hidden;
			    background-color: #f1f1f1;
			}
			
			.input-search {
			  height: 25px;
			  padding: 5px 10px;
			  font-size: 12px;
			  color:#A9A9A9;
			  line-height: 1.5;
  			  border-radius: 3px;
			  border: 2px solid;
			}
			
			.lead-x {
			padding: 4px;
				  margin-bottom: 10px;
				  font-size: 14px;
				  font-weight: 300;
				  line-height: 1.4;
				}
	    </style>
	    
	    <link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
	    <link rel="stylesheet" href="webjars/angular-material/1.1.1/angular-material.min.css">    
	    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	    <link href="<c:url value='/static/css/lov.css' />" rel="stylesheet"></link>
	    
	    <script src="webjars/angularjs/1.5.8/angular.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-sanitize.js"></script>
	    <script src="webjars/jquery/2.1.4/jquery.min.js"></script> 
	    <script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js""></script>
	    <script src="<c:url value='/static/js/app.js' />"></script>
	    <script src="<c:url value='/static/js/service/service.js' />"></script>
	    <script src="<c:url value='/static/js/controller/controller.js' />"></script>
	    <script src="<c:url value='/static/js/filter/filter.js' />"></script>
	    <script src="<c:url value='/static/js/entity/Patient.js' />"></script>
	    <script src="<c:url value='/static/js/other/angular-canvas-painter.js' />"></script> 
	    <script src="<c:url value='/static/js/other/bootbox.min.js' />"></script>    
	    <script src="webjars/angularjs/1.5.8/angular-animate.min.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-aria.min.js"></script>
	    <script src="webjars/angularjs/1.5.8/angular-messages.min.js"></script>
	    <script src="webjars/angular-material/1.1.1/angular-material.min.js"></script>
	    <script src="<c:url value='/static/js/directives/unterLov.js' />"></script>
	    <script src="<c:url value='/static/js/directives/prevent-enter-submit.js' />"></script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59499",secure:"59508"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>



	<body ng-app="generalModule" class="ng-cloak" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-8" data-genuitec-path="/Micro/src/main/webapp/WEB-INF/views/Patients.jsp">
		<div id="con1" class="generic-container" data-ng-controller="RecordController as ctrl" ng-init="ctrl.init()" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-8" data-genuitec-path="/Micro/src/main/webapp/WEB-INF/views/Patients.jsp">  
		

							
							
		<!--  Add 2 Q Start-->       
		
		<div id="myModal" class="modal">
			<div id="lov" unter-lov class = "lov"></div>
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    
		    <p>Please select doctor..</p>
<!-- 		    <input type="text" id="doctor"  placeholder="Enter Doctor" ng-focus="ctrl.setFocusedElement()" /> -->
			<select ng-model="ctrl.Record.doctor" ng-options="x for x in ctrl.doctors" id="doctor" class="doctor form-control input-sm" placeholder="Enter Doctor" required ng-focus="ctrl.setFocusedElement()"  ng-blur="ctrl.populateTargetPage()"></select>
<!-- 		    <button type="button" ng-click="ctrl.ListOfValues()" class = "btn btn-warning btn-sm">List...</button> -->
		    <button id="okBtn">OK</button>
		  </div>
		
			<div class="modal-content">
		
		
		    </div>
		</div>
		
		<!-- Add 2 Q End -->  
		    <div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Patient Details
				<select
					id="headerDropDownSelector" class=" input-selector-cc "
					ng-model="ctrl.headerDropDownSelector"
					ng-change="ctrl.edit(ctrl.headerDropDownSelector)">
					<!--<select  id="patientName" class="title form-control input-sm"  ng-model="patientName" ng-options = "u.patientName as u.patientName for u in ctrl.Records"  ng-change="ctrl.edit(u.patientName) for u in ctrl.Records">-->
					<option  ng-repeat="u in ctrl.Records"  value="{{u.objid}}" >{{u.patientId}}
						- {{u.patientName}} - {{u.patientContactNo}}</option> 
				</select>
				</span> 
			</div>
			<div class="formcontainer">
				<div class="collapsible"><span class="lead-x">Search Criteria </span> </div>
				<div class="content">
		    		
					<input id="patientId" type="text" ng-model="ctrl.SearchRecord.patientId" class="input-search" placeholder="Patient ID"/> 				
					<input type="text" ng-model="ctrl.SearchRecord.patientName" id="patientName" class="input-search" placeholder="Patient Name" style="text-transform: capitalize;"/>
					<input type="text" pattern="^\d{10}$" ng-model="ctrl.SearchRecord.patientContactNo" id="patientContactNo" class="input-search" placeholder="Phone Number 1" maxlength="10" onkeypress="return isNumberKey(event)"/>
					<md-datepicker ng-model="ctrl.SearchRecord.patientBirthDate" md-placeholder="DoF"  onkeydown="return false"></md-datepicker>
					<input type="text" ng-model="ctrl.SearchRecord.patientIdNo" id="patientIdNo" class="input-search" placeholder="NIC No" maxlength="15" style="text-transform:uppercase"/>
					<input type="text" ng-model="ctrl.SearchRecord.patientAddress" id="patientAddress" class="input-search" placeholder="Address"/>
					<input type="text" ng-model="ctrl.SearchRecord.email" id="email" class="input-search" placeholder="Email"/>
					<input type="text" pattern="^\d{10}$" ng-model="ctrl.SearchRecord.contactNo2"id="contactNo2" class="input-search" placeholder="Phone Number 2" maxlength="10" onkeypress="return isNumberKey(event)"/>
					<input type="text" ng-model="ctrl.SearchRecord.contactNoFo" id="contactNoFo" class="input-search" placeholder="Overseas Phone Number" maxlength="20" onkeypress="return isNumberKey(event)"/>
		                           			                           	
		    	</div> 
			</div>               	
			
		        <div class="formcontainer">
		        	<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal"  prevent-enter-submit>
		        			
		            	<input type="text" ng-model="ctrl.Record.objid" /> 
		            	<input id="patientId" type="text" ng-model="ctrl.Record.patientId" /> 
		
						<div class="row">
						<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="title">Title</label>
		                        <div class="col-md-10">
		                        	<select type="text" ng-model="ctrl.Record.title" id="title" class="title form-control input-sm" placeholder="Enter Title " required  ng-disabled="ctrl.variableReadOnly">
		                        	<option value="Mr.">Mr.</option>
								  		<option value="Mrs.">Mrs.</option>
								  		<option value="Miss">Miss</option>
								  		<option value="Dr.">Dr.</option>
								  		<option value="Rev.">Rev.</option>
									</select>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                            	<span ng-show="myForm.title.$error.required">This is a required field</span>
		                                <span ng-show="myForm.title.$invalid">This field is invalid </span>
		                            </div>
		                		</div>
		                	</div>
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientName">Name</label>
		                        <div class="col-md-10">
		                        	<input type="text" ng-model="ctrl.Record.patientName" id="patientName" ng-readonly="ctrl.variableReadOnly" class="patientName form-control input-sm" placeholder="Enter Patient Name " required ng-minlength="1" style="text-transform: capitalize;"/>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                            	<span ng-show="myForm.patientName.$error.required">This is a required field</span>
		                                <span ng-show="myForm.patientName.$invalid">This field is invalid </span>
		                            </div>
		                		</div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientContactNo">Contact Number</label>
		                        <div class="col-md-10">
		                        	<input type="text" pattern="^\d{10}$" ng-model="ctrl.Record.patientContactNo" id="patientContactNo" ng-readonly="ctrl.variableReadOnly" class="patientContactNo form-control input-sm" placeholder="Enter Contact No" maxlength="10" onkeypress="return isNumberKey(event)"/>
		                            <div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientBirthDate" >DoB</label>
		                        <div class="col-md-10">		                        	
		                        	<md-datepicker ng-model="ctrl.Record.patientBirthDate" md-placeholder="Enter date"  ng-disabled="ctrl.variableReadOnly"  onkeydown="return false"></md-datepicker>
		                        	<div class="has-error" ng-show="myForm.$dirty">
		                        	</div>
		                        </div>
		                	</div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
		                	<div class="form-group col-xs-4">
		                    <label class="col-md-2 control-lable" for="patientIdNo" >ID Number</label>
		                    	<div class="col-md-10">
		                        	<input type="text" ng-model="ctrl.Record.patientIdNo" id="patientIdNo" ng-readonly="ctrl.variableReadOnly" class="patientIdNo form-control input-sm" placeholder="Enter Id No" maxlength="15" style="text-transform:uppercase"/>
		                            <div class="has-error" ng-show="myForm.$dirty">
		                			</div>
		                        </div>
		                    </div>
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
							<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="patientAddress" >Address</label>
		                        <div class="col-md-10">
		                           	<input type="text" ng-model="ctrl.Record.patientAddress" id="patientAddress" ng-readonly="ctrl.variableReadOnly" class="patientAddress form-control input-sm" placeholder="Enter Address"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
		                	
<!-- 		                </div> -->
		                      
<!-- 		                <div class="row"> -->
<!-- 		                	<div class="form-group col-xs-4"> -->
<!-- 		                    	<label class="col-md-2 control-lable" for="patientGender">Gender</label> -->
<!-- 		                        <div class="col-md-10"> -->
<!-- 		                      		<select ng-model="ctrl.Record.patientGender" id="patientGender" class="patientGender form-control input-sm" placeholder="Selet Gender"> -->
<!-- 								  		<option value=""></option> -->
<!-- 								  		<option value="Male">Male</option> -->
<!-- 								  		<option value="Female">Female</option> -->
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->

		                </div>
						<div class="row"> 
		                	<div class="form-group col-xs-4">
		                    	<label class="col-md-2 control-lable" for="email" >Email</label>
		                        <div class="col-md-10">
		                           	<input type="text" ng-model="ctrl.Record.email" id="email" ng-readonly="ctrl.variableReadOnly" class="email form-control input-sm" placeholder="Enter Email"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>

		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="contactNo2">Contact No 2</label>
		                        <div class="col-sm-10">
		                           	<input type="text" pattern="^\d{10}$" ng-model="ctrl.Record.contactNo2" ng-readonly="ctrl.variableReadOnly" id="contactNo2" class="contactNo2 form-control input-sm" placeholder="Enter Phone Number" maxlength="10" onkeypress="return isNumberKey(event)"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>
		                	
		                	<div class="form-group col-sm-4">
		                    	<label class="col-sm-2 control-lable" for="contactNoFo">Overseas Contact</label>
		                        <div class="col-sm-10">
		                           	<input type="text" ng-model="ctrl.Record.contactNoFo" id="contactNoFo" ng-readonly="ctrl.variableReadOnly" class="contactNoFo form-control input-sm" placeholder="Enter Overseas Phone Number" maxlength="20" onkeypress="return isNumberKey(event)"/>
		                           	<div class="has-error" ng-show="myForm.$dirty">
		                            </div>
		                        </div>
		                	</div>                		                	
		                </div>
		                <div class="row">
		                	<div class="col-md-12">
		                    	<input type="submit"  value="Save" class="btn btn-primary btn-sm"  ng-show ="!ctrl.variableReadOnly">
		                        <button type="button" ng-click="ctrl.reset(ctrl.Record.objid)" class="btn btn-warning btn-sm" ng-show ="!ctrl.variableReadOnly" ng-show ="false">Cancel</button>
		                        <button type="button" ng-click="ctrl.exitReadOnly('Add')" class="btn btn-warning btn-sm" ng-show ="ctrl.variableReadOnly" >New</button>
		                        <button type="button" ng-click="ctrl.exitReadOnly('Edit')" class="btn btn-warning btn-sm" ng-show ="ctrl.enableEdit()">Edit</button>
		                        <button type="button" ng-click="ctrl.remove(ctrl.Record.objid)" class="btn btn-danger btn-sm" ng-show ="ctrl.Record.objid!=null">Delete</button>
		                        <button type="button" ng-click="ctrl.searchRecords(ctrl.SearchRecord)" class="btn btn-warning btn-sm" >Search</button>
		                        <button id="mbtn" type="button" class="btn btn-warning btn-sm" ng-disabled="ctrl.Record.objid==null">Add to Q</button>
		                    </div>
		               	</div>
		                
		        	</form>  
		        </div>
		        <!--      		          
		        <div class="panel panel-default">
		        	<div class="panel-heading"><span class="lead">List of Patients </span></div>
		            <div class="tablecontainer">
		                <table id="tableId" class="table table-hover">
		                	<thead>
		                    	<tr>
		                        	<th>Name</th>
		                        	<th>Contact No</th>
		                        	<th>Contact No2</th>
		                        	<th>Overseas Contact</th>
		                            <th>Address</th>
		                            <th>Date of Birth</th>
		                            <th>ID No</th>	                            
		                            <th>Gender</th>
		                            <th>Email</th>
		                            <th width="10%"></th>
		                        </tr>
		                  	</thead>
		                	<tbody>
		                    	<tr ng-repeat="u in ctrl.Records | startFrom:ctrl.currentPage*ctrl.pageSize | limitTo:ctrl.pageSize" ng-dblclick="ctrl.populateRecord(u.objid)" >
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientName" style="text-transform: capitalize;"></span></td>
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientContactNo"></span></td>
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.contactNo2"></span></td>
		                        	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.contactNoFo"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientAddress"></span></td>
		                            <td ng-if="!ctrl.change(u.objid)"><span ng-bind="ctrl.setDate(u.objid, 'patientBirthDate', u.patientBirthDate)|date:yyyy/MM/dd"></span></td>  
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientIdNo"></span></td>
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.patientGender"></span></td>
		                           	<td ng-if="!ctrl.change(u.objid)"><span ng-bind="u.email"></span></td>
		                                                                                          
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientName"style="width: 100%"/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientAddress" style="width: 100%""/></td>
		                            <td ng-if="ctrl.change(u.objid)"><md-datepicker ng-model="u.patientBirthDate"></md-datepicker></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientIdNo" style="width: 100%""/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientContactNo" style="width: 100%""/></td>
		                           	<td ng-if="ctrl.change(u.objid)"><input type="text" ng-model="u.patientGender" style="width: 100%""/></td>
		                              
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
		    	</div> -->
			</div>
		</div>	
	</body>
	<script type="text/javascript">
			var coll = document.getElementsByClassName("collapsible");
			var i;
		
			for (i = 0; i < coll.length; i++) {
			  coll[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var content = this.nextElementSibling;
			    if (content.style.display === "block") {
			      content.style.display = "none";
			    } else {
			      content.style.display = "block";
			    }
			  });
			}
	     // Get the modal
	        var modal = document.getElementById('myModal');

	        // Get the button that opens the modal
	        var btn = document.getElementById("mbtn");
	        //var okBtn = document.getElementById("okBtn");

	        // Get the <span> element that closes the modal
	        var span = document.getElementsByClassName("close")[0];

	        // When the user clicks the button, open the modal 
	        btn.onclick = function() {
	            modal.style.display = "block";
	        }
	        
	        /*okBtn.onclick = function() {
	            modal.style.display = "none";
	        }*/

	        // When the user clicks on <span> (x), close the modal
	        span.onclick = function() {
	        	//var field = document.getElementById("doctor");
	            modal.style.display = "none";
	        }

	        // When the user clicks anywhere outside of the modal, close it
	        window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none";
	            }
	        }
	        $('#okBtn').click(function(){
	        	var doctor = $('#doctor').val();
	        	var scope = angular.element(document.getElementById("con1")).scope();
	            
	            $("#doctor").val("");
	            modal.style.display = "none";
	            
            	var pId= scope.ctrl.Record.patientId;
            	tmpRecord = {id:{attendPatientId:'',patientId:pId} ,doctor:'',startTime:'',objid:null};
            	tmpRecord.doctor = doctor.split(":").pop();
            	scope.ctrl.InsertRecords('AttendPatient',tmpRecord);
	        });
	        function isNumberKey(evt){
	            var charCode = (evt.which) ? evt.which : event.keyCode
	            if (charCode > 31 && (charCode < 48 || charCode > 57))
	                return false;
	            return true;
	        }
	        setInterval(function() {
	            window.top.postMessage(document.body.scrollHeight + '-' + 'iframe1', "*");
	        }, 500);
	    </script>
</html>