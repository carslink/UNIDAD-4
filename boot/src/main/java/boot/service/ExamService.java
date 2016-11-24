package boot.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import boot.dao.ExamRepository;
import boot.model.Exam;



@Service @Transactional
public class ExamService {
	private final ExamRepository examRepository;
	
	public ExamService(ExamRepository examRepository) {
		super();
		this.examRepository = examRepository;
	}
	public List<Exam> findAll(){
		List<Exam> exams=new ArrayList<Exam>();
		for (Exam exam : examRepository.findAll()){
			exams.add(exam);
		}
		return exams;
	}
	
	public void save(Exam exam){
		examRepository.save(exam);	
	}
	
	public void delete(int id){
		examRepository.delete(id);
	}
	
	public Exam findExam(int id){
		return examRepository.findOne(id);
	}
}
