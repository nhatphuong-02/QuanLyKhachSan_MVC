package dao;

import models.Phong;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PhongDAO {

    public List<Phong> getAllRooms() {
        List<Phong> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT p.*, lp.GiaCoBan " +
                    "FROM tblPhong p " +
                    "JOIN tblLoaiPhong lp ON p.MaLoaiPhong = lp.MaLoaiPhong " +
                    "ORDER BY p.MaPhong DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRoom(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Phong getRoomById(int maPhong) throws Exception {
        String sql =
                "SELECT p.*, lp.GiaCoBan " +
                "FROM tblPhong p " +
                "JOIN tblLoaiPhong lp ON p.MaLoaiPhong = lp.MaLoaiPhong " +
                "WHERE p.MaPhong = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, maPhong);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return mapRoom(rs);
        }

        return null;
    }

    public List<Phong> searchRooms(String keyword, String trangThai) {
        List<Phong> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT p.*, lp.GiaCoBan " +
                    "FROM tblPhong p " +
                    "JOIN tblLoaiPhong lp ON p.MaLoaiPhong = lp.MaLoaiPhong " +
                    "WHERE 1=1 ";

            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += "AND (p.TenPhong LIKE ? OR p.SoPhong LIKE ?) ";
            }

            if (trangThai != null && !trangThai.trim().isEmpty()) {
                sql += "AND p.TrangThai = ? ";
            }

            sql += "ORDER BY p.MaPhong DESC";

            PreparedStatement ps = conn.prepareStatement(sql);

            int index = 1;

            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
                ps.setString(index++, "%" + keyword + "%");
            }

            if (trangThai != null && !trangThai.trim().isEmpty()) {
                ps.setString(index++, trangThai);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRoom(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addRoom(Phong phong) throws Exception {
        String sql =
                "INSERT INTO tblPhong " +
                "(SoPhong, TenPhong, MaLoaiPhong, TrangThai, HinhAnh) " +
                "VALUES (?, ?, ?, ?, ?)";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, phong.getSoPhong());
        ps.setString(2, phong.getTenPhong());
        ps.setInt(3, phong.getMaLoaiPhong());
        ps.setString(4, phong.getTrangThai());
        ps.setString(5, phong.getHinhAnh());

        ps.executeUpdate();
    }

    public void updateRoom(Phong phong) throws Exception {
        String sql =
                "UPDATE tblPhong " +
                "SET SoPhong = ?, " +
                "TenPhong = ?, " +
                "MaLoaiPhong = ?, " +
                "TrangThai = ?, " +
                "HinhAnh = ? " +
                "WHERE MaPhong = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, phong.getSoPhong());
        ps.setString(2, phong.getTenPhong());
        ps.setInt(3, phong.getMaLoaiPhong());
        ps.setString(4, phong.getTrangThai());
        ps.setString(5, phong.getHinhAnh());
        ps.setInt(6, phong.getMaPhong());

        ps.executeUpdate();
    }

    public void deleteRoom(int maPhong) throws Exception {
        String sql = "DELETE FROM tblPhong WHERE MaPhong = ?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, maPhong);

        ps.executeUpdate();
    }

    private Phong mapRoom(ResultSet rs) throws Exception {
        Phong phong = new Phong();

        phong.setMaPhong(rs.getInt("MaPhong"));
        phong.setSoPhong(rs.getString("SoPhong"));
        phong.setTenPhong(rs.getString("TenPhong"));
        phong.setMaLoaiPhong(rs.getInt("MaLoaiPhong"));
        phong.setGiaPhong(rs.getDouble("GiaCoBan"));
        phong.setTrangThai(rs.getString("TrangThai"));
        phong.setHinhAnh(rs.getString("HinhAnh"));

        return phong;
    }
}