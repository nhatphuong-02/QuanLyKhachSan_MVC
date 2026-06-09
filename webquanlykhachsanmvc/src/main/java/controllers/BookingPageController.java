package controllers;

import dao.KhachHangDAO;
import models.KhachHang;
import models.Phong;
import services.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/booking-page")
public class BookingPageController
        extends HttpServlet {

    private RoomService roomService =
            new RoomService();

    private KhachHangDAO khachHangDAO =
            new KhachHangDAO();

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

            String role = null;

            if (session != null)
                role = (String) session.getAttribute("role");

            String idParam =
                    request.getParameter("id");

            if (idParam == null || idParam.trim().isEmpty()) {
                    response.sendRedirect("home");
                    return;
            }

            int maPhong =
                    Integer.parseInt(idParam);

            Phong room =
                    roomService.getRoomById(maPhong);

            request.setAttribute("room", room);

            if ("ADMIN".equals(role)) {

                List<KhachHang> khachHangList =
                        khachHangDAO.getAllCustomers();

                request.setAttribute(
                        "khachHangList",
                        khachHangList
                );
            }

            request.getRequestDispatcher(
                    "views/feature/booking.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("rooms");
        }
    }
}