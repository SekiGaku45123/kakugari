package kakugari;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Comment;
import dao.CommentDAO;

@WebServlet(urlPatterns={"/kakugari/comment_insert"})
public class Comment_insert extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {

        	String comment = request.getParameter("comment");
        	String user_id = request.getParameter("user_id");
        	String item_id = request.getParameter("item_id");
        	String user_name = request.getParameter("user_name");

        	System.out.print(comment);
        	System.out.print(user_id);
        	System.out.print(item_id);
        	System.out.println(user_name);

        	String[] keywords = {"殺す", "死ね", "暴力", "死ぬ",
        			"詐欺", "無料で稼げる",
        			"覚醒剤", "暴力団", "大麻",
        			"ヤクザ", "ヘイトスピーチ",
        			"馬鹿", "嘘つき", "アル中",
        			"うんこ", "片足", "片親", "片目",
        			"片端", "皮被り", "乞食","マンコ","ちんこ"};


        	String key = "";

        	for (String keyword : keywords) {
                if (comment.contains(keyword)) {
                    System.out.println("文字列に '" + keyword + "' が含まれています！");
                    // キーワードに応じた処理

                    key =  keyword ;
                    break; // 必要に応じてループを終了
                }
            }

        	String Word = "";

        	if (key != null && !key.isEmpty()){
        		System.out.print("wuibrveohagnvesrdioh");


        		Word = "NGワードが含まれています";



        		comment = null;

        	}




        	if(comment != null && !comment.isEmpty()){
        		System.out.println(user_name);
	        	Comment p = new Comment();
	        	p.setItem_id(item_id);
	        	p.setUser_id(user_id);
	        	p.setComment(comment);
	        	p.setUser_name(user_name);



            CommentDAO dao = new CommentDAO();
            int line = dao.commentinsert(p);
            System.out.println(user_name+11);

            if (line > 0){
            	System.out.print("完・精子ました！！");
            	CommentDAO dao1 = new CommentDAO();
            	List<Comment> list = dao1.commentsearch(item_id);

            	System.out.print(list);

            	Map<String, Object> data = new HashMap<>();

            	data.put("cocomment", list);
            	data.put("list", Word);

            	String json = new Gson().toJson(data);
                response.getWriter().write(json);
            }
        	}else{

            	CommentDAO dao1 = new CommentDAO();
            	List<Comment> list = dao1.commentsearch(item_id);

            	System.out.print(list);


            	Map<String, Object> data = new HashMap<>();

            	data.put("cocomment", list);
            	data.put("list", Word);

            	String json = new Gson().toJson(data);
                response.getWriter().write(json);

        	}




        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
