package boot.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import boot.dao.Assoc_relRepository;
import boot.model.Assoc_rel;



@Service @Transactional
public class Assoc_relService {
	private final Assoc_relRepository assoc_relRepository;
	
	public Assoc_relService(Assoc_relRepository assoc_relRepository) {
		super();
		this.assoc_relRepository = assoc_relRepository;
	}
	public List<Assoc_rel> findAll(){
		List<Assoc_rel> assoc_rels=new ArrayList<Assoc_rel>();
		for (Assoc_rel assoc_rel : assoc_relRepository.findAll()){
			assoc_rels.add(assoc_rel);
		}
		return assoc_rels;
	}
	
	public void save(Assoc_rel assoc_rel){
		assoc_relRepository.save(assoc_rel);	
	}
	
	public void delete(int id){
		assoc_relRepository.delete(id);
	}
	
	public Assoc_rel findAssoc_rel(int id){
		return assoc_relRepository.findOne(id);
	}
}
