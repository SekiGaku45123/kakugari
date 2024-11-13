package bean;

public class History {
    private int item_Id;
	private boolean flag;
    private String image_Data;
    private String user_id;// 画像パス

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

    public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getUser_Id() {

		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

//    // completedのgetterとsetter
//    public boolean getFlag() {
//        return flag;
//    }
//
//    public void setFlag(boolean flag) {
//        this.flag = flag;
//    }


    // imagePathのgetterとsetter
    public String getImage_Data() {
        return image_Data;
    }

    public void setImage_Data(String image_Data) {
        this.image_Data = image_Data;
    }

    @Override
    public String toString() {
        return "History{" +
                "item_Id=" + item_Id +
                ", flag=" + flag +
                ", image_Data='" + image_Data + '\'' +
                '}';
    }


}
