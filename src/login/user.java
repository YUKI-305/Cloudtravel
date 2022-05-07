package login;

public class user {
	private int id;
	private String username;
	private String password;
	private String email;
	private String head;
	
	user(){}

	user(String name,String psw,String email,String head,int id){
		this.username=name;
		this.password=psw;
		this.email=email;
		this.head=head;
		this.id=id;
	}

	public void setUserName(String name){this.username=name;}
	public void setUserPassword(String psw){this.password=psw;}
	public void setUserEmail(String email){this.email=email;}
	public void setUserHead(String head){this.head=head;}
	public void setUserID(int id){this.id=id;}
	
	public String getUserName(){return username;}
	public String getUserPassword(){return this.password;}
	public String getUserEmail(){return this.email;}
	public String getUserHead(){return this.head;}
	public int getUserID(){return this.id;}
}
