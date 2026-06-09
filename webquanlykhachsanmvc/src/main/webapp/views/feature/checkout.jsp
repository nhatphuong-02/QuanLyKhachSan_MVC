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
    <title>Trả Phòng - The Grand Horizon</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/checkout.css">
</head>
<body>

<div class="page-header">
    <h2 class="page-title">
        <i class="fa-solid fa-right-from-bracket me-2"></i>
        Trả Phòng
        <span>Phòng Chưa Thanh Toán</span>
    </h2>
    <a href="home" class="btn-back">
        <i class="fa-solid fa-arrow-left"></i> Quay Lại
    </a>
</div>

<div class="container pb-4">
    <c:choose>
        <c:when test="${empty checkouts}">
            <div class="empty-state">
                <i class="fa-solid fa-circle-check" style="color:#2ed573"></i>
                <p style="font-size:1rem;margin-bottom:6px;color:#475569;font-weight:600">
                    Tất cả hóa đơn đã được thanh toán!
                </p>
                <p style="font-size:0.83rem;margin-bottom:20px">
                    Bạn không có phòng nào cần thanh toán.
                </p>
                <a href="home" class="btn-go-home">
                    <i class="fa-solid fa-house"></i> Về Trang Chủ
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <p style="color:#718096;font-size:0.83rem;margin-bottom:16px">
                Bạn có <strong style="color:var(--dark-luxury)">${checkouts.size()} phòng</strong> cần thanh toán.
            </p>
            <c:forEach var="c" items="${checkouts}">
                <div class="checkout-card">
                    <img src="${pageContext.request.contextPath}/assets/images/${c.HinhAnh}"
                         class="checkout-img"
                         alt="${c.TenPhong}">
                    <div class="checkout-body">
                        <div class="checkout-info">
                            <h5>
                                <i class="fa-solid fa-door-open me-2" style="color:var(--primary-gold)"></i>
                                ${c.TenPhong}
                                <span style="font-size:0.75rem;color:#94a3b8;font-weight:400">
                                    — Phòng ${c.SoPhong}
                                </span>
                            </h5>
                            <div class="checkout-meta">
                                <i class="fa-regular fa-calendar-check" style="color:var(--primary-gold)"></i>
                                Check-in: <strong>${c.NgayNhan}</strong>
                            </div>
                            <div class="checkout-meta">
                                <i class="fa-regular fa-calendar-minus" style="color:#ff4757"></i>
                                Check-out: <strong>${c.NgayTra}</strong>
                            </div>
                            <div class="checkout-price">
                                <fmt:formatNumber value="${c.TongTien}" type="number"/> VNĐ
                            </div>
                        </div>
                        <a href="payment?id=${c.MaHoaDon}&from=checkout" class="btn-checkout">
                            <i class="fa-solid fa-credit-card"></i>
                            Thanh Toán
                        </a>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>