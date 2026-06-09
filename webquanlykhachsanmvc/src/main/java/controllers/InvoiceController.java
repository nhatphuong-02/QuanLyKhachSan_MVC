package controllers;

import models.HoaDon;
import services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/invoice")
public class InvoiceController extends HttpServlet {

    private InvoiceService invoiceService = new InvoiceService();

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

            String username = (String) session.getAttribute("user");
            String role = (String) session.getAttribute("role");

            List<HoaDon> invoices =
                    invoiceService.getInvoices(username, role);

            request.setAttribute("invoices", invoices);

            request.getRequestDispatcher("views/payment/invoice.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }
}