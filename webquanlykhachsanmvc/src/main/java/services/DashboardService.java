package services;

import dao.DashboardDAO;
import models.DashboardStats;

public class DashboardService {

    private DashboardDAO dashboardDAO =
            new DashboardDAO();

    public DashboardStats getStats() throws Exception {
        return dashboardDAO.getStats();
    }
}