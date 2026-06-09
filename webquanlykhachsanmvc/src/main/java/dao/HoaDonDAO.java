package dao;

import models.HoaDon;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HoaDonDAO {

    public List<HoaDon> getInvoicesByRole(String username, String role) throws Exception {
        List<HoaDon> list = new ArrayList<>();

        String sql;

        if ("ADMIN".equals(role)) {
            sql = "SELECT hd.MaHoaDon, p.TenPhong, dp.NgayNhan, dp.NgayTra, " +
                  "hd.TongTien, hd.TrangThai " +
                  "FROM tblHoaDon hd " +
                  "JOIN tblDatPhong dp ON hd.MaDatPhong = dp.MaDatPhong " +
                  "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
                  "ORDER BY hd.MaHoaDon DESC";
        } else {
            sql = "SELECT hd.MaHoaDon, p.TenPhong, dp.NgayNhan, dp.NgayTra, " +
                  "hd.TongTien, hd.TrangThai " +
                  "FROM tblHoaDon hd " +
                  "JOIN tblDatPhong dp ON hd.MaDatPhong = dp.MaDatPhong " +
                  "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
                  "JOIN tblTaiKhoan tk ON dp.MaKhachHang = tk.MaKhachHang " +
                  "WHERE tk.Username = ? " +
                  "AND hd.TrangThai = N'Chưa thanh toán' " +
                  "ORDER BY hd.MaHoaDon DESC";
        }

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        if (!"ADMIN".equals(role)) {
            ps.setString(1, username);
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            HoaDon hd = new HoaDon();

            hd.setMaHoaDon(rs.getInt("MaHoaDon"));
            hd.setTenPhong(rs.getString("TenPhong"));
            hd.setNgayNhan(rs.getDate("NgayNhan"));
            hd.setNgayTra(rs.getDate("NgayTra"));
            hd.setTongTien(rs.getDouble("TongTien"));
            hd.setTrangThai(rs.getString("TrangThai"));

            list.add(hd);
        }

        return list;
    }

    public HoaDon getInvoiceById(int maHoaDon) throws Exception {
        String sql =
                "SELECT hd.MaHoaDon, hd.MaDatPhong, p.TenPhong, p.SoPhong, " +
                "dp.NgayNhan, dp.NgayTra, hd.TongTien " +
                "FROM tblHoaDon hd " +
                "JOIN tblDatPhong dp ON hd.MaDatPhong = dp.MaDatPhong " +
                "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
                "WHERE hd.MaHoaDon = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, maHoaDon);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            HoaDon hd = new HoaDon();

            hd.setMaHoaDon(rs.getInt("MaHoaDon"));
            hd.setMaDatPhong(rs.getInt("MaDatPhong"));
            hd.setTenPhong(rs.getString("TenPhong"));
            hd.setSoPhong(rs.getString("SoPhong"));
            hd.setNgayNhan(rs.getDate("NgayNhan"));
            hd.setNgayTra(rs.getDate("NgayTra"));
            hd.setTongTien(rs.getDouble("TongTien"));

            return hd;
        }

        return null;
    }

    public void updatePayment(int maHoaDon, String phuongThuc) throws Exception {
        String sql =
                "UPDATE tblHoaDon " +
                "SET TrangThai = N'Đã thanh toán', PhuongThucTT = ? " +
                "WHERE MaHoaDon = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, phuongThuc);
        ps.setInt(2, maHoaDon);

        ps.executeUpdate();
    }

    public List<HoaDon> getAdminInvoices() throws Exception {

    List<HoaDon> list =
            new ArrayList<>();

    String sql =
            "SELECT hd.MaHoaDon, kh.HoTen, " +
            "p.TenPhong, p.SoPhong, " +
            "dp.NgayNhan, dp.NgayTra, " +
            "hd.TongTien, hd.TrangThai " +
            "FROM tblHoaDon hd " +
            "JOIN tblDatPhong dp ON hd.MaDatPhong = dp.MaDatPhong " +
            "JOIN tblKhachHang kh ON dp.MaKhachHang = kh.MaKhachHang " +
            "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
            "ORDER BY hd.MaHoaDon DESC";

    Connection conn =
            DBConnection.getConnection();

    PreparedStatement ps =
            conn.prepareStatement(sql);

    ResultSet rs =
            ps.executeQuery();

    while (rs.next()) {

        HoaDon hd =
                new HoaDon();

        hd.setMaHoaDon(
                rs.getInt("MaHoaDon"));

        hd.setHoTen(
                rs.getString("HoTen"));

        hd.setTenPhong(
                rs.getString("TenPhong"));

        hd.setSoPhong(
                rs.getString("SoPhong"));

        hd.setNgayNhan(
                rs.getDate("NgayNhan"));

        hd.setNgayTra(
                rs.getDate("NgayTra"));

        hd.setTongTien(
                rs.getDouble("TongTien"));

        hd.setTrangThai(
                rs.getString("TrangThai"));

        list.add(hd);
    }

    return list;
}
}