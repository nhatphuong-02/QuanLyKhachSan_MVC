package controllers;

import models.DashboardStats;
import services.DashboardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController
        extends HttpServlet {

    private DashboardService dashboardService =
            new DashboardService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            DashboardStats stats =
                    dashboardService.getStats();

            request.setAttribute(
                    "doanhThu",
                    stats.getDoanhThu());

            request.setAttribute(
                    "tongBooking",
                    stats.getTongBooking());

            request.setAttribute(
                    "phongTrong",
                    stats.getPhongTrong());

            request.setAttribute(
                    "phongDat",
                    stats.getPhongDat());

            request.setAttribute(
                    "tongKH",
                    stats.getTongKH());

            request.getRequestDispatcher(
                    "views/feature/dashboard.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin");
        }
    }
}