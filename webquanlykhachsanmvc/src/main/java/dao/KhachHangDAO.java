package dao;

import models.KhachHang;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KhachHangDAO {

    public int insert(KhachHang khachHang) throws Exception {
        String sql = "INSERT INTO tblKhachHang (HoTen, SDT, Email, DiaChi) VALUES (?, ?, ?, ?)";

        Connection conn = DBConnection.getConnection();

        PreparedStatement ps = conn.prepareStatement(
                sql,
                Statement.RETURN_GENERATED_KEYS
        );

        ps.setString(1, khachHang.getHoTen());
        ps.setString(2, khachHang.getSdt());
        ps.setString(3, khachHang.getEmail());
        ps.setString(4, khachHang.getDiaChi());

        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return -1;
    }

    public int getMaKhachHangByUsername(String username) throws Exception {

        String sql =
                "SELECT MaKhachHang FROM tblTaiKhoan WHERE Username=?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, username);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("MaKhachHang");
        }

        return 0;
    }

    public List<KhachHang> getAllCustomers() throws Exception {

        List<KhachHang> list =
                new ArrayList<>();

        String sql =
                "SELECT * FROM tblKhachHang ORDER BY HoTen";

        Connection conn =
                DBConnection.getConnection();

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ResultSet rs =
                ps.executeQuery();

        while (rs.next()) {

            KhachHang kh =
                    new KhachHang();

            kh.setMaKhachHang(
                    rs.getInt("MaKhachHang"));

            kh.setHoTen(
                    rs.getString("HoTen"));

            kh.setSdt(
                    rs.getString("SDT"));

            list.add(kh);

            }

        return list;
    }
}