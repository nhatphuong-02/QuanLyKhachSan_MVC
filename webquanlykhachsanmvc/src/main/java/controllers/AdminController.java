package controllers;

import models.Phong;
import services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        List<Phong> list = roomService.getAllRooms();

        request.setAttribute("rooms", list);

        request.getRequestDispatcher("views/admin/admin.jsp")
                .forward(request, response);
    }
}