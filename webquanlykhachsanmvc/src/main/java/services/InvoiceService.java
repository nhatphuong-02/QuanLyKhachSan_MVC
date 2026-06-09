package services;

import dao.HoaDonDAO;
import models.HoaDon;

import java.util.List;

public class InvoiceService {

    private HoaDonDAO hoaDonDAO = new HoaDonDAO();

    public List<HoaDon> getInvoices(String username, String role) throws Exception {
        return hoaDonDAO.getInvoicesByRole(username, role);
    }

    public HoaDon getInvoiceById(int maHoaDon) throws Exception {
        return hoaDonDAO.getInvoiceById(maHoaDon);
    }

    public List<HoaDon> getAdminInvoices() throws Exception {
    return hoaDonDAO.getAdminInvoices();
}
}