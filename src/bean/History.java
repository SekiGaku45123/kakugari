package bean;

public class History {
    private int item_Id;
    private boolean flag;
    private String imageData;  // 画像パス

    // コンストラクタ
    public History() {
    }

    // itemIdのgetterとsetter
    public int getItem_Id() {
        return item_Id;
    }

    public void setItem_Id(int item_Id) {
        this.item_Id = item_Id;
    }

    // completedのgetterとsetter
    public boolean Flag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }


    // imagePathのgetterとsetter
    public String getImageData() {
        return imageData;
    }

    public void setImageData(String imageData) {
        this.imageData = imageData;
    }

    @Override
    public String toString() {
        return "History{" +
                "item_Id=" + item_Id +
                ", flag=" + flag +
                ", imageData='" + imageData + '\'' +
                '}';
    }
}
