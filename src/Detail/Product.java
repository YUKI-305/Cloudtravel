package Detail;

import java.util.Vector;

public class Product {
	private int id;
	private String brandname;
	private String name;
	private float price;
	private Vector<P_type> type=new Vector<P_type>();
	private String describePro;
	private String describeMake;
	private String describeSize;
	private String describeBrand;
	private String tag;
	private int boughtnum;
	private String activity;
	
	class P_type{
		int id;
		String color;
		String size;
		String pic;
		int stock;
		
		P_type(int id,String color, String size,String pic,int stock){
			this.id = id;
			this.color=color;
			this.size=size;
			this.pic=pic;
			this.stock=stock;
		}
	}	
	Product(){id=-1;}
	public void setId(int id){this.id=id;}
	public void setBrandname(String name){this.brandname=name;}
	public void setName(String name){this.name=name;}
	public void setPrice(float price){this.price=price;}
	public void addType(int id,String color,String size,String pic,int stock){
		P_type P = new P_type(id,color,size,pic,stock);
		type.addElement(P);	
	}
	public int typeSize(){return type.size();}
	public void setDescribePro(String s){this.describePro=s;}
	public void setDescribeMake(String s){this.describeMake=s;}
	public void setDescribeSize(String s){this.describeSize=s;}
	public void setDescribeBrand(String s){this.describeBrand=s;}
	public void setTag(String s){this.tag=s;}
	public void setBoughtNum(int s){this.boughtnum=s;}
	public void setActivity(String s){this.activity=s;}
	
	public int getId(){return id;}
	public String getBrandname(){return brandname;}
	public String getName(){return name;}
	public float getPrice(){return price;}
	public String getdescribePro(){return this.describePro;}
	public String getdescribeMake(){return this.describeMake;}
	public String getdescribeSize(){return this.describeSize;}
	public String getdescribeBrand(){return this.describeBrand;}
	public String getTag(){return this.tag;}
	public int getBoughtNum(){return this.boughtnum;}
	public String getActivity(){return this.activity;}
	
	public int getTypeId(int i){return type.get(i).id;}
	public String getTypeColor(int i){return type.get(i).color;}
	public String getTypeSize(int i){return type.get(i).size;}
	public String getTypePic(int i){return type.get(i).pic;}
	public int getTypeSstock(int i){return type.get(i).stock;}
}
