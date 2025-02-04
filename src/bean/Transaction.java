package bean;

public class Transaction implements java.io.Serializable {
	private String item_id;
	private String purchaser;//購入者
	private String purchaser_come;
	private String exhibit_user;
	private String exhibit_come;
	private boolean flag;
	private String user_id;
	private String item_name;
	private String image_data;
	private String user_name;
	private String comment;
	private boolean evaluate;

	public boolean getEvaluate() {
        return evaluate;
    }

	public String getComment() {
        return comment;
    }

	public String getItem_id() {
        return item_id;
    }

	public String getUser_name() {
        return user_name;
    }

	public String getPurchaser(){
		return purchaser;
	}

	public String getPurchaser_come(){
		return purchaser_come;
	}

	public String getExhibit_user(){
		return exhibit_user;
	}

	public String getExhibit_come(){
		return exhibit_come;
	}

	public boolean getFlag(){
		return flag;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public String getImage_data() {
		return image_data;
	}

	public void setEvaluate(boolean evaluate) {
        this.evaluate = evaluate;
    }


	public void setComment(String comment) {
        this.comment = comment;
    }

	public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

	public void setPurchaser(String purchaser){
		this.purchaser = purchaser;
	}

	public void setPurchaser_come(String purchaser_come){
		this.purchaser_come = purchaser_come;
	}

	public void setExhibit_user(String exhibit_user){
		this.exhibit_user = exhibit_user;
	}

	public void setExhibit_come(String exhibit_come){
		this.exhibit_come = exhibit_come;
	}

	public void setFlag(boolean flag){
		this.flag = flag;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public void setImage_data(String image_data) {
		this.image_data = image_data;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
}
