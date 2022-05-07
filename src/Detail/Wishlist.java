package Detail;


public class Wishlist {
	private int p_id;
	private int pt_id;
	private String pic;
	private String brandname;
	private String name;
	private String size;
	private String color;	
	private float price;
	private int stock;
	
	Wishlist(){}
	public void setP_id(int id){this.p_id=id;}
	public void setPt_id(int id){this.pt_id=id;}
	public void setPic(String pic){this.pic=pic;}
	public void setBrandname(String name){this.brandname=name;}
	public void setName(String name){this.name=name;}
	public void setSize(String size){this.size=size;}
	public void setColor(String color){this.color=color;}	
	public void setPrice(float price){this.price=price;}
	public void setStock(int s){this.stock=s;}
	
	public int getP_id(){return p_id;}
	public int getPt_id(){return pt_id;}
	public String getPic(){return pic;}
	public String getBrandname(){return brandname;}
	public String getName(){return name;}
	public String getSize(){return size;}
	public String getColor(){return color;}	
	public float getPrice(){return price;}
	public int getStock(){return stock;}	
}
