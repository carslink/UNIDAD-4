package boot.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="exams")
public class Exam implements Serializable {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=40)
	private String title;
	@Column(length=10)
	private String result;
	@Temporal(TemporalType.DATE)
	@Column(name="date_application")
	private Date dateApplication;
	private boolean reprobate;
	
	public Exam( String title, String result, Date dateApplication, boolean reprobate) {
		super();
	
		this.title = title;
		this.result = result;
		this.dateApplication = dateApplication;
		this.reprobate = reprobate;
	}

	
	public Exam() {
		this("","",new Date(),false);
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Date getDateApplication() {
		return dateApplication;
	}

	public void setDateApplication(Date dateApplication) {
		this.dateApplication = dateApplication;
	}

	public boolean isReprobate() {
		return reprobate;
	}

	public void setReprobate(boolean reprobate) {
		this.reprobate = reprobate;
	}


	@Override
	public String toString() {
		return "Exams [id=" + id + ", title=" + title + ", result=" + result + ", dateApplication=" + dateApplication
				+ ", reprobate=" + reprobate + "]";
	}

	
	
}//final
