package controllers;

import models.Phong;
import services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/add-room")
public class AddRoomController extends HttpServlet {

    private RoomService roomService =
            new RoomService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            Phong phong = new Phong();

            phong.setSoPhong(
                    request.getParameter("soPhong"));

            phong.setTenPhong(
                    request.getParameter("tenPhong"));

            phong.setMaLoaiPhong(
                    Integer.parseInt(
                            request.getParameter("maLoaiPhong")));

            phong.setTrangThai(
                    request.getParameter("trangThai"));

            phong.setHinhAnh(
                    request.getParameter("hinhAnh"));

            roomService.addRoom(phong);

            response.sendRedirect("admin");

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error",
                    "Thêm phòng thất bại!");

            request.getRequestDispatcher("views/admin/admin.jsp")
                    .forward(request, response);
        }
    }
}