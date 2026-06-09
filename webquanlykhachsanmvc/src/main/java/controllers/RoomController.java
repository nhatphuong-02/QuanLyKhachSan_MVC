package controllers;

import models.Phong;
import services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/rooms")
public class RoomController extends HttpServlet {

    private RoomService roomService =
            new RoomService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        List<Phong> rooms =
                roomService.getAllRooms();

        request.setAttribute("rooms", rooms);

        request.getRequestDispatcher("views/home/home.jsp")
                .forward(request, response);
    }
}