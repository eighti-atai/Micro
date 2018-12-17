

package com.atai.micro.module.enterp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.micro.generic.controller.AbstractController;
import com.atai.micro.module.enterp.model.Appointment;
import com.atai.micro.module.enterp.model.AppointmentKey;
import com.atai.micro.module.enterp.model.Patient;
import com.atai.micro.module.enterp.model.TmpAppointment;
import com.atai.micro.module.enterp.service.AppointmentService;
import com.atai.micro.module.enterp.service.PatientService;
import com.atai.micro.module.enterp.service.TmpAppointmentService;
import com.atai.micro.module.enterp.validator.AppointmentValidator;
import com.atai.micro.module.payment.model.Payment;


@RestController
public class AppointmentController extends AbstractController<AppointmentKey, Appointment>{

	@Autowired
	private AppointmentValidator appointmentValidator;
	
	@Autowired
	private TmpAppointmentService tmpAppointmentService;
	
	@Autowired
	private PatientService patientService;
	
	
	@Autowired
	public AppointmentController(AppointmentService service) {
		super(service, AppointmentKey.class, "Appointments");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Appointments")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Appointment")
	public ResponseEntity<List<Appointment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	/*@Override
	@PostMapping(value = "/Appointment")
	public ResponseEntity<Appointment> add(@RequestBody Appointment object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}*/
	 
	@PostMapping(value="/Appointment")
	public ResponseEntity<?> add(@RequestBody Appointment appointment, BindingResult result){
		
		appointmentValidator.validate(appointment, result);
		if(result.hasErrors())
		{
			System.out.println("Has errors");
			return new ResponseEntity<ObjectError>(result.getGlobalError(), HttpStatus.CONFLICT);
		}
		else
		{
			System.out.println("Appointment Part is Successfully added.");
			ResponseEntity<Appointment> res =  super.add(appointment);
			
			appointment = service.getByObjid(appointment.getObjid()) ;
			Patient patient = patientService.getByKey(appointment.getId().getPatientId());
			TmpAppointment tmpAppointment = new TmpAppointment();
			tmpAppointment.setCode(appointment.getCode());
			tmpAppointment.setDate(appointment.getAppointmentDate());
			tmpAppointment.setTime(appointment.getAppointmentTime());
			tmpAppointment.setPatientId(appointment.getId().getPatientId());
			tmpAppointment.setOrgAppoinmentId(appointment.getId().getAppointmentId());
			tmpAppointment.setDoctor(appointment.getDoctor());
			tmpAppointment.setName(patient.getPatientName());
			tmpAppointment.setContactNo(patient.getPatientContactNo());
			tmpAppointment.setContactNo2(patient.getContactNo2());
			tmpAppointment.setContactNoFo(patient.getContactNoFo());
			tmpAppointmentService.persist(tmpAppointment);
			
			return res;
		}
	}

	@Override
	@PutMapping(value = "/Appointment")
	public ResponseEntity<Appointment> modify(@RequestBody Appointment newObject) {
		// TODO Auto-generated method stub
		ResponseEntity<Appointment> res =  super.modify(newObject);
		TmpAppointment tmpAppointment = new TmpAppointment();
		Patient patient = patientService.getByKey(newObject.getId().getPatientId());
		tmpAppointment.setPatientId(newObject.getId().getPatientId());
		tmpAppointment.setOrgAppoinmentId(newObject.getId().getAppointmentId());
		List<TmpAppointment> list = tmpAppointmentService.executeSelectQuery(tmpAppointment);
		if(list.isEmpty())
		{
			tmpAppointment= null;
		}
		else
		{
			tmpAppointment = list.get(0);
		}
		tmpAppointment = (list.isEmpty() ? null : list.get(0));
		if(tmpAppointment!= null)
		{
			tmpAppointment.setCode(newObject.getCode());
			tmpAppointment.setDate(newObject.getAppointmentDate());
			tmpAppointment.setTime(newObject.getAppointmentTime());
			tmpAppointment.setDoctor(newObject.getDoctor());
			tmpAppointment.setName(patient.getPatientName());
			tmpAppointment.setContactNo(patient.getPatientContactNo());
			tmpAppointment.setContactNo2(patient.getContactNo2());
			tmpAppointment.setContactNoFo(patient.getContactNoFo());
			tmpAppointmentService.update(tmpAppointment);
		}
		return res;
	}

	@Override
	@DeleteMapping(value = "/Appointment/{objid:.+}")
	public ResponseEntity<Appointment> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Appointment/Search")
	public ResponseEntity<List<Appointment>> search(@RequestBody Appointment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}

