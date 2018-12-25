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
import com.atai.micro.module.payment.model.Branch;
import com.atai.micro.module.payment.service.BranchService;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class BranchController extends AbstractController<String, Branch>{

	@Autowired
	public BranchController(BranchService service) {
		super(service, String.class, "Branchs");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Branchs")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Branch")
	public ResponseEntity<List<Branch>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Branch")
	public @ResponseBody ResponseEntity<Branch> add(@RequestBody Branch object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Branch")
	public ResponseEntity<Branch> modify(@RequestBody Branch newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Branch/{objid:.+}")
	public ResponseEntity<Branch> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Branch/Search")
	public ResponseEntity<List<Branch>> search(@RequestBody Branch object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/Branch/GetByKeys")
	public ResponseEntity<Branch> getByKeys(@RequestBody Branch object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
