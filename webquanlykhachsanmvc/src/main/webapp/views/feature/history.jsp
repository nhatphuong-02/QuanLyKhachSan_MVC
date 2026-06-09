<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch Sử Đặt Phòng</title>
    <link rel="icon" type="image/jpeg" href="assets/images/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/history.css">
</head>
<body>

<div class="page-header">
    <h2 class="page-title">
        <i class="fa-solid fa-rectangle-list text-secondary"></i>
        Lịch Sử Đặt Phòng
        <c:choose>
            <c:when test="${sessionScope.role == 'ADMIN'}">
                <span class="subtitle">Toàn Bộ Hệ Thống</span>
            </c:when>
            <c:otherwise>
                <span class="subtitle">Của Tôi</span>
            </c:otherwise>
        </c:choose>
    </h2>
    <c:choose>
        <c:when test="${sessionScope.role == 'ADMIN'}">
            <a href="admin" class="btn-back"><i class="fa-solid fa-arrow-left"></i> Trang Admin</a>
        </c:when>
        <c:otherwise>
            <a href="home" class="btn-back"><i class="fa-solid fa-arrow-left"></i> Trang Chủ</a>
        </c:otherwise>
    </c:choose>
</div>

<div class="container-fluid px-4">

    <form action="history" method="get" class="search-bar">
        <i class="fa-solid fa-magnifying-glass" style="color:#94a3b8;font-size:0.8rem"></i>
        <input type="text" name="keyword" value="${keyword}"
               placeholder="${sessionScope.role == 'ADMIN' ? 'Tìm tên khách hoặc phòng...' : 'Tìm theo tên phòng...'}">
        <button type="submit">Tìm</button>
    </form>

    <div class="table-container">
        <c:choose>
            <c:when test="${empty history}">
                <div class="empty-state">
                    <i class="fa-regular fa-calendar-xmark"></i>
                    <p>Không có dữ liệu đặt phòng.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-admin">
                        <thead>
                            <tr>
                                <th style="width:5%">Mã ĐP</th>
                                <c:if test="${sessionScope.role == 'ADMIN'}">
                                    <th style="width:11%">Khách Hàng</th>
                                </c:if>
                                <th style="width:15%">Phòng</th>
                                <th style="width:10%">Check-in</th>
                                <th style="width:10%">Check-out</th>
                                <th style="width:14%">Tổng Tiền</th>
                                <th style="width:12%">Trạng Thái ĐP</th>
                                <th style="width:12%">Thanh Toán</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="h" items="${history}">
                                <tr>
                                    <td class="id-cell">#${h.maDP}</td>

                                    <c:if test="${sessionScope.role == 'ADMIN'}">
                                        <td>
                                            <i class="fa-solid fa-user me-1 text-secondary" style="font-size:0.75rem"></i>
                                            ${h.hoTen}
                                        </td>
                                    </c:if>

                                    <td>
                                        <span style="font-weight:600;color:var(--dark-luxury)">
                                            <i class="fa-solid fa-door-open me-1 text-secondary" style="font-size:0.75rem"></i>
                                            ${h.tenPhong}
                                        </span>
                                        <div style="font-size:0.72rem;color:#94a3b8">Phòng ${h.soPhong}</div>
                                    </td>

                                    <td style="color:#475569;font-weight:500">
                                        <i class="fa-regular fa-calendar-check me-1" style="color:#94a3b8"></i>${h.ngayNhan}
                                    </td>

                                    <td style="color:#475569;font-weight:500">
                                        <i class="fa-regular fa-calendar-minus me-1" style="color:#94a3b8"></i>${h.ngayTra}
                                    </td>

                                    <td class="price-cell">
                                        <c:choose>
                                            <c:when test="${h.tongTien > 0}">
                                                <fmt:formatNumber value="${h.tongTien}" type="number"/> VNĐ
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color:#94a3b8;font-weight:400;font-size:0.78rem">Chưa có</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${h.trangThai == 'Đã xác nhận'}">
                                                <span class="badge-booking confirmed"><i class="fa-solid fa-circle" style="font-size:0.38rem"></i>${h.trangThai}</span>
                                            </c:when>
                                            <c:when test="${h.trangThai == 'Chờ xác nhận'}">
                                                <span class="badge-booking pending"><i class="fa-solid fa-circle" style="font-size:0.38rem"></i>${h.trangThai}</span>
                                            </c:when>
                                            <c:when test="${h.trangThai == 'Đã hủy'}">
                                                <span class="badge-booking cancelled"><i class="fa-solid fa-circle" style="font-size:0.38rem"></i>${h.trangThai}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-booking default">${h.trangThai}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${h.trangThaiHD == 'Đã thanh toán'}">
                                                <span class="badge-invoice paid"><i class="fa-solid fa-circle-check" style="font-size:0.7rem"></i>Đã Thanh Toán</span>
                                            </c:when>
                                            <c:when test="${h.trangThaiHD == 'Chưa thanh toán'}">
                                                <span class="badge-invoice unpaid"><i class="fa-solid fa-clock" style="font-size:0.7rem"></i>Chưa Thanh Toán</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-invoice none"><i class="fa-solid fa-minus" style="font-size:0.7rem"></i>Chưa có HĐ</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>