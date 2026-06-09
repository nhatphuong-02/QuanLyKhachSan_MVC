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

    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.jpg">

    <title>Thanh Toán</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/payment.css">
</head>
<body>

<div class="page-header">
    <h2 class="page-title">
        <i class="fa-solid fa-credit-card me-2" style="color:var(--primary-gold)"></i>
        Xác Nhận Thanh Toán
    </h2>
    <a href="${from}" class="btn-back">
        <i class="fa-solid fa-arrow-left"></i> Quay Lại
    </a>
</div>

<div class="flex-grow-1 d-flex align-items-center justify-content-center p-4">
    <div class="payment-card">

        <div class="payment-card-header">
            <h5><i class="fa-solid fa-file-invoice me-2"></i>Chi Tiết Hóa Đơn</h5>
            <p>Mã hóa đơn: #${invoice.maHoaDon}</p>
        </div>

        <div class="invoice-detail">
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-door-open me-2"></i>Phòng</span>
                <span class="detail-value">${invoice.tenPhong} (${invoice.soPhong})</span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-regular fa-calendar-check me-2"></i>Ngày nhận</span>
                <span class="detail-value">${invoice.ngayNhan}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-regular fa-calendar-minus me-2"></i>Ngày trả</span>
                <span class="detail-value">${invoice.ngayTra}</span>
            </div>
            <div class="total-row">
                <span class="total-label">Tổng Thanh Toán</span>
                <span class="total-amount">
                    <fmt:formatNumber value="${invoice.tongTien}" type="number"/> VNĐ
                </span>
            </div>
        </div>

        <div class="payment-form">
            <form action="payment" method="post">
                <input type="hidden" name="maHoaDon" value="${invoice.maHoaDon}">
                <input type="hidden" name="from" value="${from}">

                <div class="method-label">Chọn phương thức thanh toán</div>
                <div class="method-options">
                    <input type="radio" class="method-option" name="phuongThuc"
                           id="tienMat" value="Tiền mặt" checked>
                    <label for="tienMat">
                        <i class="fa-solid fa-money-bill-wave"></i> Tiền mặt
                    </label>

                    <input type="radio" class="method-option" name="phuongThuc"
                           id="chuyenKhoan" value="Chuyển khoản">
                    <label for="chuyenKhoan">
                        <i class="fa-solid fa-building-columns"></i> Chuyển khoản
                    </label>

                    <input type="radio" class="method-option" name="phuongThuc"
                           id="theNganHang" value="Thẻ ngân hàng">
                    <label for="theNganHang">
                        <i class="fa-solid fa-credit-card"></i> Thẻ ngân hàng
                    </label>
                </div>

                <button type="submit" class="btn-confirm">
                    <i class="fa-solid fa-check-circle"></i> Xác Nhận Thanh Toán
                </button>
            </form>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>