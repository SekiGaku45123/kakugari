package bean;

import java.sql.Timestamp;

public class History {
    private int item_Id;          // 商品ID
    private boolean flag;         // 購入完了フラグ
    private String image_Data;    // 画像パス
    private String user_id;       // ユーザーID
    private Timestamp purchase_Date; // 購入日時

    // コンストラクタ
    public History() {}

    // 商品IDのgetterとsetter
    public int getItem_Id() {
        return item_Id;
    }

    public void setItem_Id(int item_Id) {
        this.item_Id = item_Id;
    }

    // 購入完了フラグのgetterとsetter
    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    // 画像パスのgetterとsetter
    public String getImage_Data() {
        return image_Data;
    }

    public void setImage_Data(String image_Data) {
        this.image_Data = image_Data;
    }

    // ユーザーIDのgetterとsetter
    public String getUser_Id() {
        return user_id;
    }

    public void setUser_Id(String user_id) {
        this.user_id = user_id;
    }

    // 購入日時のgetterとsetter
    public Timestamp getPurchase_Date() {
        return purchase_Date;
    }

    public void setPurchase_Date(Timestamp purchase_Date) {
        this.purchase_Date = purchase_Date;
    }

    // オブジェクトの文字列表現
    @Override
    public String toString() {
        return "History{" +
                "item_Id=" + item_Id +
                ", flag=" + flag +
                ", image_Data='" + image_Data + '\'' +
                ", user_id='" + user_id + '\'' +
                ", purchase_Date=" + purchase_Date +
                '}';
    }
}
