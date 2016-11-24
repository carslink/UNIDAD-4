package boot.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="assoc_rel")
public class Assoc_rel implements Serializable {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="from_id")
	private int fromId;
	@Column(name="to_id")
	private int toId;
	@Column(name="relationship_type_id")
	private int relationshipTypeId;
	
	public Assoc_rel( int fromId, int toId, int relationshipTypeId) {
		super();
		
		this.fromId = fromId;
		this.toId = toId;
		this.relationshipTypeId = relationshipTypeId;
	}
	
	public Assoc_rel(){
		this(0,0,0);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFromId() {
		return fromId;
	}

	public void setFromId(int fromId) {
		this.fromId = fromId;
	}

	public int getToId() {
		return toId;
	}

	public void setToId(int toId) {
		this.toId = toId;
	}

	public int getRelationshipTypeId() {
		return relationshipTypeId;
	}

	public void setRelationshipTypeId(int relationshipTypeId) {
		this.relationshipTypeId = relationshipTypeId;
	}

	@Override
	public String toString() {
		return "Assoc_rel [id=" + id + ", fromId=" + fromId + ", toId=" + toId + ", relationshipTypeId="
				+ relationshipTypeId + "]";
	}
	
	
}
