package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Favorite;

public class FavoriteDAO extends DAO {
    public int insert(Favorite product) throws Exception {
        Connection con = getConnection();

        PreparedStatement st1 = con.prepareStatement(
                "SELECT COUNT(*) FROM favorite WHERE user_id = ? AND item_id = ?");
        st1.setString(1, product.getUser_id());
        st1.setString(2, product.getItem_id());

        // executeUpdate を executeQuery に変更し、結果を ResultSet で取得
        ResultSet rs = st1.executeQuery();
        int kazu = 0;
        if (rs.next()) {  // 結果があるか確認
            kazu = rs.getInt(1);  // COUNT(*) の値を取得
        }

        if (kazu > 0) {
            System.out.print("この商品はすでにお気に入りに登録されています！！");
            int comment = 1;  // 整数は頭の 0 を省略
            return comment;
        }
        else{
        PreparedStatement st = con.prepareStatement(
                "INSERT INTO favorite (user_id, item_id) VALUES (?, ?)");
        st.setString(1, product.getUser_id());
        st.setString(2, product.getItem_id());
        int line = st.executeUpdate();

        st.close();
        con.close();
        return line;
        }
    }

//    public List<Favorite> getFavoritesByUserId(String user_id) throws Exception {
//        List<Favorite> favorites = new ArrayList<>();
//        Connection con = getConnection();
//
//        PreparedStatement st = con.prepareStatement(
//                "SELECT *FROM favorite JOIN item ON favorite.item_id = item.item_id JOIN images ON images.item_id = item.item_id WHERE item.item_id =?");
//        st.setString(1, user_id);
//        ResultSet rs = st.executeQuery();
//
//        while (rs.next()) {
//            Favorite favorite = new Favorite();
//            favorite.setUser_id(user_id);
//            favorite.setItem_id(rs.getString("item_id"));
//            favorites.add(favorite);
//        }
//
//        rs.close();
//        st.close();
//        con.close();
//        return favorites;
//    }

    public List<Favorite> search(String key) throws Exception{

		List<Favorite> list=new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"SELECT item.item_id, item.user_id, item.item_price, item.category, item.item_detail, item.condition, item.area, item.shipping_days, item.flag, item.item_name, images.image_data FROM favorite JOIN item ON favorite.item_id = item.item_id JOIN images ON images.item_id = favorite.item_id WHERE favorite.user_id = ? ");
		st.setString(1,key);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Favorite p=new Favorite();
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setImage_data(rs.getString("image_data"));
			p.setItem_name(rs.getString("item_name"));
			p.setItem_price(rs.getInt("item_price"));
			p.setItem_detail(rs.getString("item_detail"));
			p.setCategory(rs.getString("category"));
			p.setCondition(rs.getString("condition"));
			p.setArea(rs.getString("area"));
			p.setShipping_days(rs.getInt("shipping_days"));
			p.setFlag(rs.getBoolean("flag"));

			list.add(p);
		}


		st.close();
		con.close();

		return list;

	}
}
