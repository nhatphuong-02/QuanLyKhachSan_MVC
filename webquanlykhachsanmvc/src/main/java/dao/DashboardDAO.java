package dao;

import models.DashboardStats;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public DashboardStats getStats() throws Exception {

        DashboardStats stats =
                new DashboardStats();

        Connection conn =
                DBConnection.getConnection();

        // doanh thu
        PreparedStatement psDT =
                conn.prepareStatement(
                        "SELECT ISNULL(SUM(TongTien),0) Tong " +
                        "FROM tblHoaDon " +
                        "WHERE TrangThai=N'Đã thanh toán'");

        ResultSet rsDT =
                psDT.executeQuery();

        if (rsDT.next()) {
            stats.setDoanhThu(
                    rsDT.getDouble("Tong"));
        }

        // booking
        PreparedStatement psBooking =
                conn.prepareStatement(
                        "SELECT COUNT(*) TongBooking FROM tblDatPhong");

        ResultSet rsBooking =
                psBooking.executeQuery();

        if (rsBooking.next()) {
            stats.setTongBooking(
                    rsBooking.getInt("TongBooking"));
        }

        // phòng trống
        PreparedStatement psTrong =
                conn.prepareStatement(
                        "SELECT COUNT(*) PhongTrong " +
                        "FROM tblPhong WHERE TrangThai=N'Trống'");

        ResultSet rsTrong =
                psTrong.executeQuery();

        if (rsTrong.next()) {
            stats.setPhongTrong(
                    rsTrong.getInt("PhongTrong"));
        }

        // phòng đã đặt
        PreparedStatement psDat =
                conn.prepareStatement(
                        "SELECT COUNT(*) PhongDat " +
                        "FROM tblPhong WHERE TrangThai=N'Đã Đặt'");

        ResultSet rsDat =
                psDat.executeQuery();

        if (rsDat.next()) {
            stats.setPhongDat(
                    rsDat.getInt("PhongDat"));
        }

        // khách hàng
        PreparedStatement psKH =
                conn.prepareStatement(
                        "SELECT COUNT(*) TongKH FROM tblKhachHang");

        ResultSet rsKH =
                psKH.executeQuery();

        if (rsKH.next()) {
            stats.setTongKH(
                    rsKH.getInt("TongKH"));
        }

        return stats;
    }
}