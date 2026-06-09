package controllers;

import utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/delete-room")
public class DeleteRoomController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int maPhong = Integer.parseInt(request.getParameter("id"));

            Connection conn = DBConnection.getConnection();

            String checkSql =
                    "SELECT COUNT(*) AS SoLuong " +
                    "FROM tblDatPhong " +
                    "WHERE MaPhong=?";

            PreparedStatement checkPs = conn.prepareStatement(checkSql);
            checkPs.setInt(1, maPhong);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next() && rs.getInt("SoLuong") > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("error",
                        "Phòng đang có lịch sử đặt phòng, không thể xóa!");

                response.sendRedirect("admin");
                return;
            }

            String deleteSql =
                    "DELETE FROM tblPhong WHERE MaPhong=?";

            PreparedStatement deletePs = conn.prepareStatement(deleteSql);
            deletePs.setInt(1, maPhong);
            deletePs.executeUpdate();

            response.sendRedirect("admin");

        } catch (Exception e) {
            e.printStackTrace();

            HttpSession session = request.getSession();
            session.setAttribute("error",
                    "Không thể xóa phòng này!");

            response.sendRedirect("admin");
        }
    }
}