package services;

import dao.DatPhongDAO;
import dao.KhachHangDAO;
import models.DatPhong;

public class BookingService {

    private DatPhongDAO datPhongDAO = new DatPhongDAO();
    private KhachHangDAO khachHangDAO = new KhachHangDAO();

    public void bookRoomByAdmin(int maKhachHang, int maPhong, String ngayNhan, String ngayTra) throws Exception {

        if (datPhongDAO.isRoomBooked(
                maPhong,
                ngayNhan,
                ngayTra)) {

            throw new Exception("Phòng đã được đặt");
        }

        DatPhong dp = new DatPhong(
                maKhachHang,
                maPhong,
                ngayNhan,
                ngayTra,
                "Đã Đặt"
        );

        datPhongDAO.insert(dp);
    }

    public void bookRoom(String username,int maPhong,String ngayNhan,String ngayTra) throws Exception {

        int maKhachHang = khachHangDAO.getMaKhachHangByUsername(username);

        if (maKhachHang == 0)
            throw new Exception("Không tìm thấy khách hàng");

        if (datPhongDAO.isRoomBooked(maPhong, ngayNhan, ngayTra))
            throw new Exception("Phòng đã được đặt");

        DatPhong dp = new DatPhong(maKhachHang,maPhong,ngayNhan,ngayTra, "Đã Đặt");

        datPhongDAO.insert(dp);
    }
}