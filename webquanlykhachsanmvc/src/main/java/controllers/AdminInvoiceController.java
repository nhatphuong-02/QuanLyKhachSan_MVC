package controllers;

import models.HoaDon;
import services.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-invoice")
public class AdminInvoiceController
        extends HttpServlet {

    private InvoiceService invoiceService =
            new InvoiceService();

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

            if (session == null ||
                    !"ADMIN".equals(
                            session.getAttribute("role"))) {

                response.sendRedirect("rooms");
                return;
            }

            List<HoaDon> invoices =
                    invoiceService.getAdminInvoices();

            request.setAttribute(
                    "invoices",
                    invoices);

            request.getRequestDispatcher(
                    "views/admin/adminInvoice.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard");
        }
    }
}