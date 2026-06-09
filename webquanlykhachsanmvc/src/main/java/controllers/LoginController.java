package controllers;

import models.TaiKhoan;
import services.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        request.getRequestDispatcher("views/login/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            TaiKhoan taiKhoan = authService.login(username, password);

            if (taiKhoan != null) {
                HttpSession session = request.getSession();

                session.setAttribute("user", taiKhoan.getUsername());
                session.setAttribute("role", taiKhoan.getVaiTro());
                session.setAttribute("account", taiKhoan);
                session.setAttribute("maKhachHang", taiKhoan.getMaKhachHang());

                response.sendRedirect("home");

            } else {
                request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
                request.getRequestDispatcher("views/login/login.jsp")
                        .forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "Lỗi đăng nhập: " + e.getMessage());
            request.getRequestDispatcher("views/login/login.jsp")
                    .forward(request, response);
        }
    }
}