package controllers;

import utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String role = (String) session.getAttribute("role");
            String user = (String) session.getAttribute("user");

            if (role == null) {
                response.sendRedirect("login");
                return;
            }

            Connection conn = DBConnection.getConnection();

            // Lấy các phòng user đang thuê và chưa thanh toán
            String sql =
                "SELECT dp.MaDatPhong, p.TenPhong, p.SoPhong, p.HinhAnh, " +
                "dp.NgayNhan, dp.NgayTra, dp.TrangThai, " +
                "hd.MaHoaDon, hd.TongTien, hd.TrangThai AS TrangThaiHD " +
                "FROM tblDatPhong dp " +
                "JOIN tblPhong p ON dp.MaPhong = p.MaPhong " +
                "JOIN tblTaiKhoan tk ON dp.MaKhachHang = tk.MaKhachHang " +
                "LEFT JOIN tblHoaDon hd ON dp.MaDatPhong = hd.MaDatPhong " +
                "WHERE tk.Username = ? " +
                "AND hd.TrangThai = N'Chưa thanh toán' " +
                "ORDER BY dp.MaDatPhong DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();

            List<Map<String, Object>> list = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> item = new HashMap<>();
                item.put("MaDatPhong", rs.getInt("MaDatPhong"));
                item.put("TenPhong",   rs.getString("TenPhong"));
                item.put("SoPhong",    rs.getString("SoPhong"));
                item.put("HinhAnh",    rs.getString("HinhAnh"));
                item.put("NgayNhan",   rs.getDate("NgayNhan"));
                item.put("NgayTra",    rs.getDate("NgayTra"));
                item.put("TrangThai",  rs.getString("TrangThai"));
                item.put("MaHoaDon",   rs.getInt("MaHoaDon"));
                item.put("TongTien",   rs.getDouble("TongTien"));
                item.put("TrangThaiHD",rs.getString("TrangThaiHD"));
                list.add(item);
            }

            request.setAttribute("checkouts", list);
            request.getRequestDispatcher("views/feature/checkout.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}