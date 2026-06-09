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
    <title>Đặt Phòng - The Grand Horizon</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/booking.css">
</head>
<body>

<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-xl-9 col-lg-11">
            <div class="card booking-master-card shadow">
                <div class="row g-0">

                    <div class="col-md-5">
                        <div class="booking-image-panel">
                            <img src="${pageContext.request.contextPath}/assets/images/${room.hinhAnh}"
                                 class="booking-img" alt="${room.tenPhong}">
                            <div class="image-overlay-badge">
                                <p class="overlay-label">Số phòng</p>
                                <p class="overlay-value">${room.soPhong}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="booking-form-panel">

                            <h2 class="booking-title">${room.tenPhong}</h2>
                            <div class="room-status-indicator">
                                <i class="fa-solid fa-circle-check"></i> Phòng khả dụng
                            </div>

                            <div class="spec-grid">
                                <div class="spec-item">
                                    <span class="spec-label"><i class="fa-solid fa-door-closed me-2"></i>Số hiệu phòng</span>
                                    <span class="spec-value">${room.soPhong}</span>
                                </div>
                                <div class="spec-item">
                                    <span class="spec-label"><i class="fa-solid fa-bell me-2"></i>Trạng thái</span>
                                    <span class="spec-value">${room.trangThai}</span>
                                </div>
                                <div class="spec-item">
                                    <span class="spec-label"><i class="fa-solid fa-tags me-2"></i>Giá / Đêm</span>
                                    <span class="spec-value price">
                                        <fmt:formatNumber value="${room.giaPhong}" type="number"/> VNĐ
                                    </span>
                                </div>
                            </div>

                            <a href="home" class="btn-back-luxury mb-3 d-inline-flex align-items-center gap-2">
                                <i class="fa-solid fa-arrow-left"></i> Quay lại danh sách
                            </a>

                            <c:if test="${not empty error}">
                                <div class="alert alert-luxury">
                                    <i class="fa-solid fa-circle-exclamation fs-6"></i>
                                    <div>${error}</div>
                                </div>
                            </c:if>

                            <form action="booking" method="post">
                                <input type="hidden" name="maPhong" value="${room.maPhong}">

                                <c:if test="${sessionScope.role == 'ADMIN'}">
                                    <div class="mb-3">
                                        <label class="form-label form-label-luxury">
                                            <i class="fa-solid fa-user me-1 text-secondary"></i> Chọn Khách Hàng
                                        </label>
                                        <select name="maKhachHang" class="input-date-luxury" required>
                                            <option value="">-- Chọn khách hàng --</option>
                                            <c:forEach var="kh" items="${khachHangList}">
                                                <option value="${kh.maKhachHang}">
                                                    ${kh.hoTen} — ${kh.sdt}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </c:if>

                                <div class="mb-3">
                                    <label class="form-label form-label-luxury">
                                        <i class="fa-regular fa-calendar-plus me-1 text-secondary"></i> Ngày nhận phòng (Check-in)
                                    </label>
                                    <input type="date" name="ngayNhan"
                                           class="input-date-luxury" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label form-label-luxury">
                                        <i class="fa-regular fa-calendar-minus me-1 text-secondary"></i> Ngày trả phòng (Check-out)
                                    </label>
                                    <input type="date" name="ngayTra"
                                           class="input-date-luxury" required>
                                </div>

                                <button class="btn-confirm-luxury bg-gradient shadow-sm">
                                    <i class="fa-solid fa-check me-2"></i>Xác Nhận Đặt Phòng
                                </button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>