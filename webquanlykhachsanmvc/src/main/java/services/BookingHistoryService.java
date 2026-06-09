package services;

import dao.DatPhongDAO;
import models.BookingHistory;

import java.util.List;

public class BookingHistoryService {

    private DatPhongDAO datPhongDAO =
            new DatPhongDAO();

    public List<BookingHistory> getHistory(
            String username,
            String role,
            String keyword) throws Exception {

        return datPhongDAO.getHistory(
                username,
                role,
                keyword
        );
    }
}