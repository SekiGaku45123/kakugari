package history;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.History;
import dao.HistoryDAO;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HistoryDAO dao = new HistoryDAO();
        List<History> historyList = dao.getHistory();

        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("/main_kakugari/rireki.jsp").forward(request, response);
    }
}
