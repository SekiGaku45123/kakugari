package bean;

public class Images implements java.io.Serializable {
	private String item_id;
	private String image_data;

	public String getItem_id() {
        return item_id;
    }

	public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

	public String getImage_data() {
        return image_data;
    }

	public void setImage_data(String image_data) {
        this.image_data = image_data;
    }

}
