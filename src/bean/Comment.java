package bean;

public class Comment implements java.io.Serializable{

	private String item_id;
	private String user_id;
	private String comment;
	private String posted_day;

	public String getItem_id() {
        return item_id;
    }

	public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

	public String getUser_id() {
        return user_id;
    }

	public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

	public String getComment() {
        return comment;
    }

	public void setComment(String comment) {
        this.comment = comment;
    }

	public String getPosted_day() {
        return posted_day;
    }

	public void setPosted_day(String posted_day) {
        this.posted_day = posted_day;
    }

}
