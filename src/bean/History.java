package bean;

import java.io.Serializable;

public class History implements Serializable {
    private static final long serialVersionUID = 1L;

    private int itemId;
    private boolean completed;

    // コンストラクタ
    public History() {}

    public History(int itemId, boolean completed) {
        this.itemId = itemId;
        this.completed = completed;
    }

    // GetterとSetter
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }
}
