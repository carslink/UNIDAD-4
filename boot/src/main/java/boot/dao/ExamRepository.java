package boot.dao;

import org.springframework.data.repository.CrudRepository;

import boot.model.Exam;

public interface ExamRepository extends CrudRepository<Exam, Integer>{

}
