package bean;

public class Product implements java.io.Serializable{
	
	private int id;
	private String name;
	private int price;
	
	public int getId(){
		return id;
		
	}
	public String getName(){
		return name;
	}
	public int getPrice(){
		return price;
	}
}
