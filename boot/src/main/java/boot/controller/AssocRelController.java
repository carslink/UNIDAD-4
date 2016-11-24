package boot.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Assoc_rel;
import boot.service.Assoc_relService;
@Controller
public class AssocRelController {
	@Autowired 
	private Assoc_relService assoc_relService;
	
	@GetMapping("assocRel")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "assocRel";
	}
	@GetMapping("/all-assocRels")
	public String allAssoc_rel(HttpServletRequest request){
		request.setAttribute("assoc_rels", assoc_relService.findAll());
		request.setAttribute("mode", "MODE_ASSOCRELS");
		return "assocRel";
	}
	
	
	@GetMapping("/new-assoc_rel")
	public String newAssoc_rel(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "assocRel";
	}
	@PostMapping("/save-assoc_rel")
	public String saveAssoc_rel(@ModelAttribute Assoc_rel assoc_rel, BindingResult bidingesult, HttpServletRequest request){
		assoc_relService.save(assoc_rel);
		request.setAttribute("assoc_rels", assoc_relService.findAll());
		request.setAttribute("mode", "MODE_ASSOCRELS");
		return "assocRel";
	}
	
	@GetMapping("/update-assoc_rel")
	public String updateAssoc_rel(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("assoc_rel", assoc_relService.findAssoc_rel(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "assocRel";
	}
	
	@GetMapping("/delete-assoc_rel")
	public String deleteAssoc_rel(@RequestParam int id,HttpServletRequest request){
		assoc_relService.delete(id);
		request.setAttribute("assoc_rels", assoc_relService.findAll());
		request.setAttribute("mode", "MODE_ASSOCRELS");
		return "assocRel";
	}
}
