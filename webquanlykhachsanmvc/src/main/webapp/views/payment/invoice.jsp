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

    <title>Hóa Đơn</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;1,400&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/invoice.css">
</head>
<body>

<div class="premium-header">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="premium-logo-area">
            <img src="${pageContext.request.contextPath}/assets/images/logo.jpg" alt="Hotel Logo">
            <h2 class="premium-title">
                Hóa Đơn<span>Quản Lý Giao Dịch Khách Sạn</span>
            </h2>
        </div>
        <a href="home" class="btn-home-luxury">
            <i class="fa-solid fa-house me-2"></i>Trang Chủ
        </a>
    </div>
</div>

<div class="container">
    <div class="luxury-card">
        <div class="table-responsive">
            <table class="table table-luxury align-middle">
                <thead>
                    <tr>
                        <th style="width: 8%">Mã HD</th>
                        <th style="width: 22%">Tên Phòng</th>
                        <th style="width: 14%">Ngày Nhận</th>
                        <th style="width: 14%">Ngày Trả</th>
                        <th style="width: 16%">Tổng Tiền</th>
                        <th style="width: 14%">Trạng Thái</th>
                        <th style="width: 12%; text-align: right;">Thao Tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>

                        <c:when test="${not empty invoices}">

                            <c:forEach items="${invoices}" var="i">

                                <tr>
                                    <td>${i.maHoaDon}</td>
                                    <td>${i.tenPhong}</td>
                                    <td>${i.ngayNhan}</td>
                                    <td>${i.ngayTra}</td>
                                    <td>${i.tongTien} VNĐ</td>
                                    <td>${i.trangThai}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${i.trangThai == 'Chưa thanh toán'}">
                                                <a href="payment?id=${i.maHoaDon}&from=invoice"
                                                class="btn btn-success btn-sm">
                                                    Thanh Toán
                                                </a>
                                            </c:when>

                                            <c:otherwise>
                                                <span class="badge bg-success">
                                                    Đã Thanh Toán
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>

                            </c:forEach>

                        </c:when>

                        <c:otherwise>

                            <tr>
                                <td colspan="7" class="text-center py-5 text-muted">

                                    <i class="fa-solid fa-file-circle-xmark me-2"></i>

                                    Bạn chưa có hóa đơn nào

                                </td>
                            </tr>

                        </c:otherwise>

                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>