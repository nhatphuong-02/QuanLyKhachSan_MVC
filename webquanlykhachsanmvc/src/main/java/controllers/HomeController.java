package controllers;

import dao.PhongDAO;
import models.Phong;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String keyword =
                request.getParameter("keyword");

        String trangThai =
                request.getParameter("trangThai");

        PhongDAO phongDAO =
                new PhongDAO();

        List<Phong> list =
                phongDAO.searchRooms(
                        keyword,
                        trangThai);

        request.setAttribute(
                "rooms",
                list);

        request.getRequestDispatcher(
                "views/home/home.jsp")
                .forward(request,response);
    }
}