package bean;

public class Favorite implements java.io.Serializable {
    private String item_id;
    private String image_data;
    private String item_name;
    private int item_price;
    private String item_detail;
    private String user_id;

    // item_id のゲッターとセッター
    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

    // image_data のゲッターとセッター
    public String getImage_data() {
        return image_data;
    }

    public void setImage_data(String image_data) {
        this.image_data = image_data;
    }

    // item_name のゲッターとセッター
    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    // item_price のゲッターとセッター
    public int getItem_price() {
        return item_price;
    }

    public void setItem_price(int item_price) {
        this.item_price = item_price;
    }

    // item_detail のゲッターとセッター
    public String getItem_detail() {
        return item_detail;
    }

    public void setItem_detail(String item_detail) {
        this.item_detail = item_detail;
    }

    // user_id のゲッターとセッター
    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
}
