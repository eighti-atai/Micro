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
import com.atai.micro.module.payment.model.Cbo;
import com.atai.micro.module.payment.model.Family;
import com.atai.micro.module.payment.model.FamilyKey;
import com.atai.micro.module.payment.service.CboService;
import com.atai.micro.module.payment.service.FamilyService;
import com.atai.micro.module.trment.model.Treatment;

/*import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.Cbo;
import com.atai.dental.module.enterp.service.CboService;*/
//@CrossOrigin(origins = "http://localhost:4200")
@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class FamilyController extends AbstractController<FamilyKey, Family>{

	@Autowired
	public FamilyController(FamilyService service) {
		super(service, FamilyKey.class, "Familys");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Familys")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Family")
	public ResponseEntity<List<Family>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Family")
	public @ResponseBody ResponseEntity<Family> add(@RequestBody Family object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Family")
	public ResponseEntity<Family> modify(@RequestBody Family newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Family/{objid:.+}")
	public ResponseEntity<Family> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Family/Search")
	public ResponseEntity<List<Family>> search(@RequestBody Family object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/Family/GetByKeys")
	public ResponseEntity<Family> getByKeys(@RequestBody Family object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
