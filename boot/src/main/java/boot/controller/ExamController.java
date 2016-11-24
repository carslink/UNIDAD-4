package boot.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Exam;
import boot.service.ExamService;
@Controller
class ExamController {

	@Autowired 
	private ExamService examService;
	
	@GetMapping("exam")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "exam";
	}
	@GetMapping("/all-exams")
	public String allExams(HttpServletRequest request){
		request.setAttribute("exams", examService.findAll());
		request.setAttribute("mode", "MODE_EXAMS");
		return "exam";
	}
	
	@GetMapping("/new-exam")
	public String newExam(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "exam";
	}
	@PostMapping("/save-exam")
	public String saveExam(@ModelAttribute Exam exam, BindingResult bidingesult, HttpServletRequest request){
		examService.save(exam);
		request.setAttribute("exams",examService.findAll());
		request.setAttribute("mode", "MODE_EXAMS");
		return "exam";
	}
	
	@GetMapping("/update-exam")
	public String updateExam(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("exam", examService.findExam(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "exam";
	}
	
	@GetMapping("/delete-exam")
	public String deteExam(@RequestParam int id,HttpServletRequest request){
		examService.delete(id);
		request.setAttribute("exams", examService.findAll());
		request.setAttribute("mode", "MODE_EXAMS");
		return "exam";
	}
	
}
