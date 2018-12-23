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
import com.atai.micro.module.payment.service.CboService;
import com.atai.micro.module.trment.model.Treatment;

/*import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.Cbo;
import com.atai.dental.module.enterp.service.CboService;*/
//@CrossOrigin(origins = "http://localhost:4200")
@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class CboController extends AbstractController<String, Cbo>{

	@Autowired
	public CboController(CboService service) {
		super(service, String.class, "Cbos");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Cbos")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Cbo")
	public ResponseEntity<List<Cbo>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Cbo")
	public @ResponseBody ResponseEntity<Cbo> add(@RequestBody Cbo object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Cbo")
	public ResponseEntity<Cbo> modify(@RequestBody Cbo newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Cbo/{objid:.+}")
	public ResponseEntity<Cbo> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Cbo/Search")
	public ResponseEntity<List<Cbo>> search(@RequestBody Cbo object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/Cbo/GetByKeys")
	public ResponseEntity<Cbo> getByKeys(@RequestBody Cbo object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}