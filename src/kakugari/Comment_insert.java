package kakugari;

import java.io.IOException;
import java.util.List;

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

        	System.out.print(comment);
        	System.out.print(user_id);
        	System.out.print(item_id);

        	if(comment != null && !comment.isEmpty()){
	        	Comment p = new Comment();
	        	p.setItem_id(item_id);
	        	p.setUser_id(user_id);
	        	p.setComment(comment);



            CommentDAO dao = new CommentDAO();
            int line = dao.commentinsert(p);

            if (line > 0){
            	System.out.print("完・精子ました！！");
            	CommentDAO dao1 = new CommentDAO();
            	List<Comment> list = dao1.commentsearch(item_id);

            	System.out.print(list);

            	String json = new Gson().toJson(list);
                response.getWriter().write(json);
            }
        	}else{

            	CommentDAO dao1 = new CommentDAO();
            	List<Comment> list = dao1.commentsearch(item_id);

            	System.out.print(list);

            	String json = new Gson().toJson(list);
                response.getWriter().write(json);

        	}



        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
