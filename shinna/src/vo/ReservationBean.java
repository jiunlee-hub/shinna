package vo;


public class ReservationBean {
	
 private String id;
 private String type;
 private String chkin ;
 private String chkout; 
 private int room;
 private int adult;
 private int child;
 private int baby;
 
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getChkin() {
	return chkin;
}
public void setChkin(String chkin) {
	this.chkin = chkin;
}
public String getChkout() {
	return chkout;
}
public void setChkout(String chkout) {
	this.chkout = chkout;
}
public int getRoom() {
	return room;
}
public void setRoom(int room) {
	this.room = room;
}
public int getAdult() {
	return adult;
}
public void setAdult(int adult) {
	this.adult = adult;
}
public int getChild() {
	return child;
}
public void setChild(int child) {
	this.child = child;
}
public int getBaby() {
	return baby;
}
public void setBaby(int baby) {
	this.baby = baby;
	
	}

}
