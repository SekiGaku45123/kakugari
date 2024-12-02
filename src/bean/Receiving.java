package bean;

public class Receiving implements java.io.Serializable {
	private String item_id;
	private String user_id;
	private String exhibit_user;

	public String getItem_id() {
        return item_id;
    }

	public String getUser_id() {
        return user_id;
    }

	public String getExhibit_user() {
        return exhibit_user;
    }


	public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

	public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

	public void setExhibit_user(String exhibit_user) {
        this.exhibit_user = exhibit_user;
    }
}
