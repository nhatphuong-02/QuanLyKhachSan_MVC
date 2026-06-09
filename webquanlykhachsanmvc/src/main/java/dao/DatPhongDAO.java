package dao;

import models.BookingHistory;
import models.DatPhong;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DatPhongDAO {

    public boolean isRoomBooked(int maPhong,
                                String ngayNhan,
                                String ngayTra) throws Exception {

        String sql =
                "SELECT COUNT(*) FROM tblDatPhong " +
                "WHERE MaPhong = ? " +
                "AND TrangThai NOT IN (N'Đã hủy') " +
                "AND NOT (NgayTra <= ? OR NgayNhan >= ?)";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, maPhong);
        ps.setString(2, ngayNhan);
        ps.setString(3, ngayTra);

        ResultSet rs = ps.executeQuery();

        rs.next();

        return rs.getInt(1) > 0;
    }

    public void insert(DatPhong dp) throws Exception {

        String sql =
                "INSERT INTO tblDatPhong " +
                "(MaKhachHang, MaPhong, NgayDat, NgayNhan, NgayTra, TrangThai) " +
                "VALUES (?, ?, GETDATE(), ?, ?, ?)";

        Connection conn = DBConnection.getConnection();

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, dp.getMaKhachHang());
        ps.setInt(2, dp.getMaPhong());
        ps.setString(3, dp.getNgayNhan());
        ps.setString(4, dp.getNgayTra());
        ps.setString(5, dp.getTrangThai());

        ps.executeUpdate();
    }

    public void updateTrangThai(int maDatPhong, String trangThai) throws Exception {
        String sql = "UPDATE tblDatPhong SET TrangThai = ? WHERE MaDatPhong = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, trangThai);
        ps.setInt(2, maDatPhong);

        ps.executeUpdate();
    }

    public List<BookingHistory> getHistory(String username,String role, String keyword) throws Exception {

        List<BookingHistory> list =
                new ArrayList<>();

        String sql;

        if ("ADMIN".equals(role)) {

            sql =
                    "SELECT dp.MaDatPhong, p.TenPhong, p.SoPhong, " +
                    "kh.HoTen, dp.NgayNhan, dp.NgayTra, dp.TrangThai, " +
                    "hd.MaHoaDon, hd.TongTien, hd.TrangThai AS TrangThaiHD " +
                    "FROM tblDatPhong dp " +
                    "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
                    "JOIN tblKhachHang kh ON dp.MaKhachHang = kh.MaKhachHang " +
                    "LEFT JOIN tblHoaDon hd ON dp.MaDatPhong = hd.MaDatPhong " +
                    "WHERE (p.TenPhong LIKE ? OR kh.HoTen LIKE ?) " +
                    "ORDER BY dp.MaDatPhong DESC";

        } else {

            sql =
                    "SELECT dp.MaDatPhong, p.TenPhong, p.SoPhong, " +
                    "kh.HoTen, dp.NgayNhan, dp.NgayTra, dp.TrangThai, " +
                    "hd.MaHoaDon, hd.TongTien, hd.TrangThai AS TrangThaiHD " +
                    "FROM tblDatPhong dp " +
                    "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
                    "JOIN tblKhachHang kh ON dp.MaKhachHang = kh.MaKhachHang " +
                    "JOIN tblTaiKhoan tk ON kh.MaKhachHang = tk.MaKhachHang " +
                    "LEFT JOIN tblHoaDon hd ON dp.MaDatPhong = hd.MaDatPhong " +
                    "WHERE tk.Username=? AND p.TenPhong LIKE ? " +
                    "ORDER BY dp.MaDatPhong DESC";
        }

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        if ("ADMIN".equals(role)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
        } else {
            ps.setString(1, username);
            ps.setString(2, "%" + keyword + "%");
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            BookingHistory item =
                    new BookingHistory();

            item.setMaDP(rs.getInt("MaDatPhong"));
            item.setTenPhong(rs.getString("TenPhong"));
            item.setSoPhong(rs.getString("SoPhong"));
            item.setHoTen(rs.getString("HoTen"));
            item.setNgayNhan(rs.getDate("NgayNhan"));
            item.setNgayTra(rs.getDate("NgayTra"));
            item.setTrangThai(rs.getString("TrangThai"));
            item.setMaHD(rs.getInt("MaHoaDon"));
            item.setTongTien(rs.getDouble("TongTien"));
            item.setTrangThaiHD(rs.getString("TrangThaiHD"));

            list.add(item);
        }

        return list;
    }
}