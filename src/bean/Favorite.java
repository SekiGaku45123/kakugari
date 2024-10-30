package bean;

public class Favorite implements java.io.Serializable {
    private String item_id;
    private String image_data;
    private String item_name;
    private int item_price;
    private String item_detail;
    private String user_id;


    private String category;
    private String condition;
    private String area;
    private int shipping_days;
    private boolean flag;


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




    public String getCategory() {
        return category;
    }

	public String getCondition() {
        return condition;
    }

    public String getArea() {
        return area;
    }

    public int getShipping_days() {
        return shipping_days;
    }

    public boolean getFlag() {
        return flag;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public void setShipping_days(int shipping_days) {
        this.shipping_days = shipping_days;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
}
