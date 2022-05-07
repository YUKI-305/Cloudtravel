package entity;

public class Note {
	private int number;
    private String name;
    private String title;
    private String texts;
    private String time;
    private String src;
    private int llike;
    private int collect;
    public Note(){}
    public Note(int num,String na,String ti,String te,String tim,String s,int l,int c){
    	super();
    	number=num;
    	name=na;
    	title=ti;
    	texts=te;
    	time=tim;
    	src=s;
    	llike=l;
    	collect=c;
    }
    public int getNumber() {
        return number;
    }
    public void setNumber(int number) {
        this.number = number;
    }
    public String getName(){
    	return name;
    }
    public void setName(String name){
    	this.name=name;
    }
    public String getTitle(){
    	return title;
    }
    public void setTitle(String title){
    	this.title=title;
    }
    public String getTexts(){
    	return texts;
    }
    public void setTexts(String texts){
    	this.texts=texts;
    }
    public String getTime(){
    	return time;
    }
    public void setTime(String time){
    	this.time=time;
    }
    public String getSrc(){
    	return src;
    }
    public void setSrc(String src){
    	this.src=src;
    }
    public int getLike(){
    	return llike;
    }
    public void setLike(int l){
    	this.llike=l;
    }
    public int getCollect(){
    	return collect;
    }
    public void setCollect(int c){
    	this.collect=c;
    }
}
