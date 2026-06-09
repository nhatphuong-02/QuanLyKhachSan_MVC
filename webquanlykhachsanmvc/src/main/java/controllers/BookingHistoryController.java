package controllers;

import models.BookingHistory;
import services.BookingHistoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/history")
public class BookingHistoryController
        extends HttpServlet {

    private BookingHistoryService historyService =
            new BookingHistoryService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            HttpSession session =
                    request.getSession(false);

            if (session == null) {
                response.sendRedirect("login");
                return;
            }

            String role =
                    (String) session.getAttribute("role");

            String user =
                    (String) session.getAttribute("user");

            String keyword =
                    request.getParameter("keyword");

            if (keyword == null) {
                keyword = "";
            }

            List<BookingHistory> history =
                    historyService.getHistory(
                            user,
                            role,
                            keyword
                    );

            request.setAttribute("history", history);
            request.setAttribute("keyword", keyword);

            request.getRequestDispatcher(
                    "views/feature/history.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("rooms");
        }
    }
}