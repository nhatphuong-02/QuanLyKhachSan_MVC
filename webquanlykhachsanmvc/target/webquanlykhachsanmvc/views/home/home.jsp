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
    <title>The Grand Horizon Hotel</title>
    <link rel="icon" type="image/jpg" href="${pageContext.request.contextPath}/assets/images/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- CSS trang chủ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css">
</head>
<body>

<nav class="navbar navbar-luxury navbar-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand navbar-brand-luxury d-flex align-items-center">
            <i class="fa-solid fa-hotel me-2" style="color: var(--primary-gold);"></i>
            THE GRAND HORIZON <span>&nbsp;HOTEL</span>
        </a>
        <div class="d-flex align-items-center gap-2">

    <c:choose>

        <%-- ĐÃ ĐĂNG NHẬP --%>
        <c:when test="${not empty sessionScope.user}">

            <span class="text-light fw-semibold me-2">

                <i class="fa-solid fa-user me-2"
                   style="color: var(--primary-gold);"></i>

                Xin chào

                <span style="color: var(--primary-gold);">
                    ${sessionScope.user} !
                </span>

            </span>

            <a href="logout"
               class="btn btn-outline-light btn-luxury-action border-0">

                <i class="fa-solid fa-right-from-bracket me-2"></i>

                Đăng xuất

            </a>

        </c:when>

        <%-- CHƯA ĐĂNG NHẬP --%>
        <c:otherwise>

            <a href="login"
               class="btn btn-outline-light btn-luxury-action border-0">

                <i class="fa-solid fa-right-to-bracket me-2"></i>

                Đăng nhập

            </a>

        </c:otherwise>

    </c:choose>

</div>
    </div>
</nav>

<div class="container mt-3">

    <%-- Panel Admin --%>
    <c:if test="${sessionScope.role == 'ADMIN'}">
        <div class="dashboard-panel">
            <div class="panel-title">
                <i class="fa-solid fa-sliders me-2"></i>Bảng điều khiển quản trị viên
            </div>
            <div class="d-flex flex-wrap gap-2">
                <a href="history" class="btn btn-primary btn-luxury-action bg-gradient border-0 px-4">
                    <i class="fa-solid fa-clock-rotate-left me-2"></i>Lịch sử đặt phòng
                </a>
                <a href="admin" class="btn btn-dark btn-luxury-action bg-gradient border-0 px-4"
                   style="background-color: #2d3748 !important;">
                    <i class="fa-solid fa-bed me-2"></i>Quản lý phòng
                </a>
                <a href="admin-invoice" class="btn btn-success btn-luxury-action bg-gradient border-0 px-4">
                    <i class="fa-solid fa-file-invoice-dollar me-2"></i>Thanh toán & Trả phòng
                </a>
            </div>
        </div>
    </c:if>

    <%-- Panel User --%>
    <c:if test="${sessionScope.role != 'ADMIN' && sessionScope.role != null}">
        <div class="dashboard-panel">
            <div class="panel-title">
                <i class="fa-solid fa-user me-2"></i>Tài khoản của bạn
            </div>
            <div class="d-flex flex-wrap gap-2">
                <a href="invoice" class="btn btn-luxury-action bg-gradient border-0 px-4"
                   style="background-color: var(--primary-gold) !important; color: white;">
                    <i class="fa-solid fa-file-invoice me-2"></i>Hóa Đơn Của Tôi
                </a>
                <a href="history" class="btn btn-primary btn-luxury-action bg-gradient border-0 px-4">
                    <i class="fa-solid fa-clock-rotate-left me-2"></i>Lịch Sử Đặt Phòng
                </a>
                <a href="checkout" class="btn btn-warning btn-luxury-action bg-gradient border-0 px-4"
                   style="color: white;">
                    <i class="fa-solid fa-right-from-bracket me-2"></i>Trả Phòng & Thanh Toán
                </a>
            </div>
        </div>
    </c:if>

</div>

<div class="container mt-3">
    <div class="search-container">
        <form action="home" method="get">
            <div class="row g-2">
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-text bg-transparent border-end-0 text-muted"
                              style="border-radius: 8px 0 0 8px; border: 1px solid #e2e8f0;">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </span>
                        <input type="text"
                               name="keyword"
                               class="form-control form-control-luxury border-start-0"
                               style="border-radius: 0 8px 8px 0;"
                               placeholder="Tìm theo tên hoặc hạng phòng...">
                    </div>
                </div>
                <div class="col-md-4">
                    <select name="trangThai" class="form-select form-select-luxury">
                        <option value="">Tất cả trạng thái</option>
                        <option value="Trống">Trống</option>
                        <option value="Đã Đặt">Đã Đặt</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-search-luxury w-100 h-100 py-2">
                        Tìm kiếm
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="container mt-4 mb-4">
    <div class="row g-3">
        <c:forEach items="${rooms}" var="r">
            <div class="col-xl-4 col-md-6">
                <div class="card room-card">

                    <c:choose>
                        <c:when test="${r.trangThai == 'Trống'}">
                            <span class="status-badge badge-available">Sẵn Sàng</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-badge badge-booked">Đang Bận</span>
                        </c:otherwise>
                    </c:choose>

                    <div class="room-image-wrapper">
                        <img src="assets/images/${r.hinhAnh}"
                             class="room-card-img"
                             alt="${r.tenPhong}">
                    </div>

                    <div class="room-body">
                        <h4 class="room-title">${r.tenPhong}</h4>

                        <div class="room-meta">
                            <i class="fa-solid fa-door-open text-muted"></i>
                            <span>Mã phòng: <strong>${r.soPhong}</strong></span>
                        </div>

                        <div class="room-meta">
                            <i class="fa-solid fa-circle-info text-muted"></i>
                            <span>Trạng thái: ${r.trangThai}</span>
                        </div>

                        <div class="room-price-box">
                            <span class="price-label">Giá / Đêm</span>
                            <span class="price-amount">
                                <fmt:formatNumber value="${r.giaPhong}" type="number"/> VNĐ
                            </span>
                        </div>

                        <div class="mt-3">
                            <c:choose>
                                <c:when test="${r.trangThai == 'Trống'}">
                                    <a href="booking-page?id=${r.maPhong}"
                                       class="btn btn-book-now w-100 d-block text-center text-decoration-none">
                                        <i class="fa-regular fa-calendar-check me-2"></i>Đặt Phòng
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-disabled-luxury w-100" disabled>
                                        <i class="fa-solid fa-ban me-2"></i>Phòng Đã Kín
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>