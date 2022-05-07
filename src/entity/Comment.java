package entity;

public class Comment {
	private int number;
    private String username;
    private String content;
    private String time;
    private int anonymity;
    public Comment(){}
    public Comment(int num,String na,String cont,String tim,int a){
    	super();
    	number=num;
    	username=na;
    	content=cont;
    	time=tim;
    	anonymity=a;
    }
    public int getNumber() {
        return number;
    }
    public void setNumber(int number) {
        this.number = number;
    }
    public String getName(){
    	return username;
    }
    public void setName(String name){
    	this.username=name;
    }
    public String getContent(){
    	return content;
    }
    public void setContent(String texts){
    	this.content=texts;
    }
    public String getTime(){
    	return time;
    }
    public void setTime(String time){
    	this.time=time;
    }
    public int getA(){
    	return anonymity;
    }
    public void setA(int a){
    	this.anonymity=a;
    }
}
