package kakugari;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Images;
import dao.ImageDAO;

@WebServlet(urlPatterns={"/kakugari/myServlet"})
public class Category1 extends HttpServlet {

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
            ImageDAO dao = new ImageDAO();
            List<Images> list = dao.all();

            // リストをJSON形式に変換して出力
            String json = new Gson().toJson(list);
            response.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}

