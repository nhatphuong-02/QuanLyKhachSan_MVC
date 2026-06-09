package services;

import dao.KhachHangDAO;
import dao.TaiKhoanDAO;
import models.KhachHang;
import models.TaiKhoan;

public class AuthService {

    private KhachHangDAO khachHangDAO = new KhachHangDAO();
    private TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

    public void register(String hoTen,String sdt,String email,String diaChi,String username,String password) throws Exception {

        KhachHang khachHang = new KhachHang(hoTen, sdt, email, diaChi);

        int maKhachHang = khachHangDAO.insert(khachHang);

        TaiKhoan taiKhoan = new TaiKhoan(username,password,"USER",maKhachHang);

        taiKhoanDAO.insert(taiKhoan);
    }

    public TaiKhoan login(String username, String password) throws Exception {
        return taiKhoanDAO.login(username, password);
    }
}