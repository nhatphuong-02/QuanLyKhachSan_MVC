package services;

import dao.DatPhongDAO;
import dao.HoaDonDAO;
import models.HoaDon;

public class PaymentService {

    private HoaDonDAO hoaDonDAO = new HoaDonDAO();
    private DatPhongDAO datPhongDAO = new DatPhongDAO();

    public void payInvoice(int maHoaDon, String phuongThuc) throws Exception {
        HoaDon hoaDon = hoaDonDAO.getInvoiceById(maHoaDon);

        if (hoaDon == null) {
            throw new Exception("Không tìm thấy hóa đơn");
        }

        hoaDonDAO.updatePayment(maHoaDon, phuongThuc);

        datPhongDAO.updateTrangThai(
                hoaDon.getMaDatPhong(),
                "Đã Trả"
        );
    }
}