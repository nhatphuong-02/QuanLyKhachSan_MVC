package controllers;

import services.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        request.getRequestDispatcher("views/login/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            String hoTen = request.getParameter("hoTen");
            String sdt = request.getParameter("sdt");
            String email = request.getParameter("email");
            String diaChi = request.getParameter("diaChi");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            authService.register(
                    hoTen,
                    sdt,
                    email,
                    diaChi,
                    username,
                    password
            );

            request.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("views/login/login.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "Đăng ký thất bại!");
            request.getRequestDispatcher("views/login/register.jsp")
                    .forward(request, response);
        }
    }
}