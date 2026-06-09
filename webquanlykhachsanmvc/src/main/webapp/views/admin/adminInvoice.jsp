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
    <link rel="icon" type="image/jpg" href="${pageContext.request.contextPath}/assets/images/logo.jpg">
    <title>Quản Lý Hóa Đơn - Admin</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminInvoice.css">
</head>
<body>

<div class="page-header">
    <h2 class="page-title">
        <i class="fa-solid fa-file-invoice-dollar me-2 text-secondary"></i>
        Hóa Đơn
        <span>Toàn Bộ Giao Dịch</span>
    </h2>
    <a href="admin" class="btn-back">
        <i class="fa-solid fa-arrow-left"></i> Quay lại
    </a>
</div>

<div class="container-fluid px-4">
    <div class="table-container">
        <c:choose>
            <c:when test="${empty invoices}">
                <div style="text-align:center;padding:50px;color:#94a3b8">
                    <i class="fa-regular fa-file-lines" style="font-size:2.5rem;display:block;margin-bottom:12px"></i>
                    <p>Chưa có hóa đơn nào trong hệ thống.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-admin">
                        <thead>
                            <tr>
                                <th style="width:6%">Mã HD</th>
                                <th style="width:14%">Khách Hàng</th>
                                <th style="width:14%">Phòng</th>
                                <th style="width:11%">Nhận Phòng</th>
                                <th style="width:11%">Trả Phòng</th>
                                <th style="width:16%">Tổng Tiền</th>
                                <th style="width:14%">Trạng Thái</th>
                                <th style="width:10%; text-align:center">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${invoices}">
                                <tr>
                                    <td class="id-cell">#${i.maHoaDon}</td>

                                    <td>
                                        <i class="fa-solid fa-user me-2 text-secondary" style="font-size:0.78rem"></i>
                                        ${i.hoTen}
                                    </td>

                                    <td>
                                        <i class="fa-solid fa-door-open me-2 text-secondary" style="font-size:0.78rem"></i>
                                        ${i.tenPhong}
                                        <div style="font-size:0.74rem;color:#94a3b8">Phòng ${i.soPhong}</div>
                                    </td>

                                    <td style="color:#475569;font-weight:500">
                                        <i class="fa-regular fa-calendar-check me-1" style="color:#94a3b8"></i>${i.ngayNhan}
                                    </td>

                                    <td style="color:#475569;font-weight:500">
                                        <i class="fa-regular fa-calendar-minus me-1" style="color:#94a3b8"></i>${i.ngayTra}
                                    </td>

                                    <td class="price-cell">
                                        <fmt:formatNumber value="${i.tongTien}" type="number"/> VNĐ
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${i.trangThai == 'Đã thanh toán'}">
                                                <span class="badge-invoice paid">
                                                    <i class="fa-solid fa-circle-check" style="font-size:0.72rem"></i> Đã Thanh Toán
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-invoice unpaid">
                                                    <i class="fa-solid fa-clock" style="font-size:0.72rem"></i> Chưa Thanh Toán
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td style="text-align:center">
                                        <c:choose>
                                            <c:when test="${i.trangThai == 'Chưa thanh toán'}">
                                                <a href="payment?id=${i.maHoaDon}&from=admin-invoice" class="btn-pay">
                                                    <i class="fa-solid fa-credit-card"></i> Thanh Toán
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="btn-done">
                                                    <i class="fa-solid fa-check"></i> Hoàn Thành
                                                </span>
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