package com.atai.micro.module.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.micro.generic.controller.AbstractController;
import com.atai.micro.module.payment.model.Employee;
import com.atai.micro.module.payment.service.EmployeeService;
@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class EmployeeController extends AbstractController<String, Employee>{

	@Autowired
	public EmployeeController(EmployeeService service) {
		super(service, String.class, "Employees");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Employees")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Employee")
	public ResponseEntity<List<Employee>> list() {
		// TODO Auto-generated method stub
		System.out.println("#####################################");
		return super.list();
	}

	@Override
	@PostMapping(value = "/Employee")
	public @ResponseBody ResponseEntity<Employee> add(@RequestBody Employee object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Employee")
	public ResponseEntity<Employee> modify(@RequestBody Employee newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Employee/{objid:.+}")
	public ResponseEntity<Employee> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Employee/Search")
	public ResponseEntity<List<Employee>> search(@RequestBody Employee object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/Employee/GetByKeys")
	public ResponseEntity<Employee> getByKeys(@RequestBody Employee object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
