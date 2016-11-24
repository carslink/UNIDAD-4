package boot.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Task;
import boot.service.TaskService;
@Controller
public class TaskController {
	@Autowired 
	private TaskService taskService;
	@GetMapping("task")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "task";
	}
	
	@GetMapping("/all-tasks")
	public String allTasks(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "task";
	}
	
	@GetMapping("/new-task")
	public String newTask(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "task";
	}
	@PostMapping("/save-task")
	public String saveTask(@ModelAttribute Task task, BindingResult bidingesult, HttpServletRequest request){
		taskService.save(task);
		request.setAttribute("tasks",taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "task";
	}
	
	@GetMapping("/update-task")
	public String updateTask(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("task", taskService.findTask(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "task";
	}
	
	@GetMapping("/delete-task")
	public String deteTask(@RequestParam int id,HttpServletRequest request){
		taskService.delete(id);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "task";
	}
	
}
