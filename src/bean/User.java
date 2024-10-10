package bean;

public class User implements java.io.Serializable{
	private String user_id;
	private String maleaddress;
	private String password;
	private String user_name;
	private	 String user_hurigana;
	private String user_address;
	private String telephone;


	public String getUser_id(){
		return user_id;
	}

	public String getMaleaddress(){
		return maleaddress;
	}

	public String getPassword(){
		return password;
	}

	public String getUser_name(){
		return user_name;
	}

	public String getUser_hurigana(){
		return user_hurigana;
	}

	public String getUser_address(){
		return user_address;
	}

	public String getTelephone(){
		return telephone;
	}


	public void setUser_id(String user_id) {
		this.user_id=user_id;
	}

	public void setMaleaddress(String maleaddress) {
		this.maleaddress=maleaddress;
	}

	public void setpassword(String password) {
		this.password=password;
	}

	public void setUser_name(String user_name) {
		this.user_name=user_name;
	}

	public void setUser_hurigana(String user_hurigana) {
		this.user_hurigana=user_hurigana;
	}

	public void setUser_address(String user_address) {
		this.user_address=user_address;
	}

	public void setTelephone(String telephone) {
		this.telephone=telephone;
	}




}
