<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - The Grand Horizon</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
</head>
<body>

<div class="dashboard-header">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <h2 class="dashboard-title">
            <i class="fa-solid fa-chart-line me-2 text-secondary"></i>Admin Dashboard
            <span>Bảng Điều Hành</span>
        </h2>
        <a href="admin" class="btn btn-action-luxury shadow-sm">
            <i class="fa-solid fa-bed me-2"></i>Quản Lý Phòng
        </a>
    </div>
</div>

<div class="container-fluid px-4">

    <div class="section-indicator">Báo cáo tổng quan</div>
    <div class="row mb-2">

        <div class="col-xl-4 col-md-6 mb-3">
            <div class="card metric-card card-revenue shadow-sm">
                <div class="card-body p-0 metric-flex">
                    <div>
                        <div class="metric-label">Tổng Doanh Thu</div>
                        <h3 class="metric-value">
                            <fmt:formatNumber value="${doanhThu}" type="number"/>
                            <span style="color:#a0aec0;">VNĐ</span>
                        </h3>
                    </div>
                    <div class="metric-icon-box">
                        <i class="fa-solid fa-wallet"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-4 col-md-6 mb-3">
            <div class="card metric-card card-booking shadow-sm">
                <div class="card-body p-0 metric-flex">
                    <div>
                        <div class="metric-label">Tổng Đặt Phòng</div>
                        <h3 class="metric-value">
                            ${tongBooking}
                            <span style="color:#a0aec0;">Lượt</span>
                        </h3>
                    </div>
                    <div class="metric-icon-box">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-4 col-md-12 mb-3">
            <div class="card metric-card card-customer shadow-sm">
                <div class="card-body p-0 metric-flex">
                    <div>
                        <div class="metric-label">Tổng Khách Hàng</div>
                        <h3 class="metric-value">
                            ${tongKH}
                            <span style="color:#a0aec0;">Người</span>
                        </h3>
                    </div>
                    <div class="metric-icon-box">
                        <i class="fa-solid fa-users"></i>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="section-indicator">Trạng thái phòng</div>
    <div class="row">

        <div class="col-md-6 mb-3">
            <div class="card metric-card card-empty shadow-sm">
                <div class="card-body p-0 metric-flex">
                    <div>
                        <div class="metric-label">Phòng Trống</div>
                        <h3 class="metric-value">
                            ${phongTrong}
                            <span style="color:#a0aec0;">Phòng</span>
                        </h3>
                    </div>
                    <div class="metric-icon-box">
                        <i class="fa-solid fa-door-open"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 mb-3">
            <div class="card metric-card card-occupied shadow-sm">
                <div class="card-body p-0 metric-flex">
                    <div>
                        <div class="metric-label">Phòng Đang Thuê</div>
                        <h3 class="metric-value">
                            ${phongDat}
                            <span style="color:#a0aec0;">Phòng</span>
                        </h3>
                    </div>
                    <div class="metric-icon-box">
                        <i class="fa-solid fa-door-closed"></i>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>