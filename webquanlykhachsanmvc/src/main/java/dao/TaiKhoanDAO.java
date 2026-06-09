package dao;

import models.TaiKhoan;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TaiKhoanDAO {

    public void insert(TaiKhoan taiKhoan) throws Exception {
        String sql = "INSERT INTO tblTaiKhoan (Username, Password, VaiTro, MaKhachHang) VALUES (?, ?, ?, ?)";

        Connection conn = DBConnection.getConnection();

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, taiKhoan.getUsername());
        ps.setString(2, taiKhoan.getPassword());
        ps.setString(3, taiKhoan.getVaiTro());
        ps.setInt(4, taiKhoan.getMaKhachHang());

        ps.executeUpdate();
    }

   public TaiKhoan login(String username, String password) throws Exception {
        String sql = "SELECT * FROM tblTaiKhoan WHERE Username = ? AND Password = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            TaiKhoan tk = new TaiKhoan();

            tk.setUsername(rs.getString("Username"));
            tk.setPassword(rs.getString("Password"));
            tk.setVaiTro(rs.getString("VaiTro"));
            tk.setMaKhachHang(rs.getInt("MaKhachHang"));

            return tk;
        }

        return null;
    }
}