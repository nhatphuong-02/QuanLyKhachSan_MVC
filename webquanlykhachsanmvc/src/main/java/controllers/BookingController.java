package controllers;

import services.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingController extends HttpServlet {

    private BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login");
                return;
            }

            String username = (String) session.getAttribute("user");
            String role = (String) session.getAttribute("role");

            int maPhong = Integer.parseInt(request.getParameter("maPhong"));
            String ngayNhan = request.getParameter("ngayNhan");
            String ngayTra = request.getParameter("ngayTra");

            if (ngayNhan == null || ngayTra == null ||
                ngayNhan.trim().isEmpty() || ngayTra.trim().isEmpty()) {

                request.setAttribute("error", "Vui lòng chọn đầy đủ ngày nhận và ngày trả.");
                request.getRequestDispatcher("views/feature/booking.jsp").forward(request, response);
                return;
            }

            if (ngayNhan.compareTo(ngayTra) >= 0) {

                request.setAttribute("error", "Ngày trả phải lớn hơn ngày nhận.");
                request.getRequestDispatcher("views/feature/booking.jsp").forward(request, response);
                return;
            }

            if ("ADMIN".equals(role)) {
                int maKhachHang = Integer.parseInt(request.getParameter("maKhachHang"));

                bookingService.bookRoomByAdmin(
                        maKhachHang,
                        maPhong,
                        ngayNhan,
                        ngayTra
                );

            } else {
                bookingService.bookRoom(
                        username,
                        maPhong,
                        ngayNhan,
                        ngayTra
                );
            }

            response.sendRedirect("invoice");

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", e.getMessage());

            request.getRequestDispatcher("views/feature/booking.jsp")
                    .forward(request, response);
        }
    }
}