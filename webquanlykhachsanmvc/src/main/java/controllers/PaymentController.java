package controllers;

import models.HoaDon;
import services.InvoiceService;
import services.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {

    private InvoiceService invoiceService = new InvoiceService();
    private PaymentService paymentService = new PaymentService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("role") == null) {
                response.sendRedirect("login");
                return;
            }

            int maHoaDon = Integer.parseInt(request.getParameter("id"));

            String from = request.getParameter("from");
            if (from == null) {
                from = "invoice";
            }

            HoaDon invoice = invoiceService.getInvoiceById(maHoaDon);

            request.setAttribute("invoice", invoice);
            request.setAttribute("from", from);

            request.getRequestDispatcher("views/payment/payment.jsp")
                .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("invoice");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("role") == null) {
                response.sendRedirect("login");
                return;
            }

            int maHoaDon =
                    Integer.parseInt(request.getParameter("maHoaDon"));

            String phuongThuc =
                    request.getParameter("phuongThuc");

            String from =
                    request.getParameter("from");

            if (from == null) {
                from = "invoice";
            }

            paymentService.payInvoice(maHoaDon, phuongThuc);

            response.sendRedirect(from);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("invoice");
        }
    }
}