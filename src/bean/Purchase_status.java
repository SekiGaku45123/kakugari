package bean;

public class Purchase_status implements java.io.Serializable {
    private int flag_id;
    private String condition;



    // Getter methods
    public int getFlag_id() {
        return flag_id;
    }

    public String getCondition() {
        return condition;
    }

    // Setter methods
    public void setFlag_id(int flag_id) {
        this.flag_id = flag_id;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
