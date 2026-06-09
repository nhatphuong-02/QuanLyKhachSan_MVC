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
    <title>Quản Trị Phòng - Admin</title>
    <link rel="icon" type="image/jpeg" href="${pageContext.request.contextPath}/assets/images/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="container-fluid px-3 py-3">

    <%-- ── Header ── --%>
    <div class="card header-card shadow mb-3">
        <div class="card-body px-4 py-3">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-2">
                <div class="header-title text-white m-0">
                    <i class="fa-solid fa-screwdriver-wrench me-2" style="color:var(--primary-gold)"></i>
                    QUẢN TRỊ <span>VẬN HÀNH</span>
                </div>
                <div class="d-flex flex-wrap gap-2">
                    <a href="dashboard" class="btn btn-luxury btn-light">
                        <i class="fa-solid fa-chart-pie me-1 text-primary"></i>Dashboard
                    </a>
                    <a href="admin-invoice" class="btn btn-luxury btn-light">
                        <i class="fa-solid fa-file-invoice-dollar me-1 text-success"></i>Hóa Đơn
                    </a>
                    <a href="home" class="btn btn-luxury btn-outline-light">
                        <i class="fa-solid fa-arrow-left-long me-1"></i>Trang Chủ
                    </a>
                    <a href="logout" class="btn btn-luxury btn-danger border-0">
                        <i class="fa-solid fa-right-from-bracket me-1"></i>Đăng Xuất
                    </a>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger">
            ${sessionScope.error}
        </div>
        <c:remove var="error" scope="session"/>
    </c:if>
    
    <%-- ── Search ── --%>
    <div class="card custom-card mb-3">
        <div class="card-body px-4 py-3">
            <form action="search-room" method="get">
                <div class="row g-2">
                    <div class="col-md-10">
                        <div class="input-group">
                            <span class="input-group-text bg-transparent text-muted"
                                  style="border-radius:7px 0 0 7px;border:1px solid var(--border-color);border-right:none">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </span>
                            <input type="text" name="keyword"
                                   class="form-control form-control-luxury border-start-0"
                                   style="border-radius:0 7px 7px 0"
                                   placeholder="Nhập tên phòng hoặc hạng phòng...">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-luxury btn-dark w-100" style="background-color:var(--dark-luxury)">
                            <i class="fa-solid fa-search me-1"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%-- ── Add Room ── --%>
    <div class="card custom-card mb-3">
        <div class="card-header-luxury">
            <div class="panel-title text-success">
                <i class="fa-solid fa-circle-plus"></i> THÊM PHÒNG MỚI
            </div>
        </div>

        <c:if test="${not empty error}">
            <div class="alert-luxury">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <div class="card-body px-4 py-3">
            <form action="add-room" method="post" class="row g-2">
                <div class="col-md-2">
                    <label class="form-label form-label-luxury">Số Phòng</label>
                    <input type="text" name="soPhong" class="form-control form-control-luxury"
                           placeholder="VD: P.402" required>
                </div>
                <div class="col-md-2">
                    <label class="form-label form-label-luxury">Tên Phòng</label>
                    <input type="text" name="tenPhong" class="form-control form-control-luxury"
                           placeholder="VD: Deluxe Suite" required>
                </div>
                <div class="col-md-2">
                    <label class="form-label form-label-luxury">Mã Loại Phòng</label>
                    <select name="maLoaiPhong"
                            class="form-select form-select-luxury"
                            required>
                        <option value="1">1 - Phòng Đơn</option>
                        <option value="2">2 - Phòng Đôi</option>
                        <option value="3">3 - VIP</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label class="form-label form-label-luxury">Trạng Thái</label>
                    <select name="trangThai" class="form-select form-select-luxury">
                        <option value="Trống">Trống</option>
                        <option value="Đã Đặt">Đã Đặt</option>
                        <option value="Bảo trì">Bảo trì</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label class="form-label form-label-luxury">File Hình Ảnh</label>
                    <input type="text" name="hinhAnh" class="form-control form-control-luxury"
                           placeholder="room1.jpg" required>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button class="btn btn-luxury btn-success w-100 border-0">
                        <i class="fa-solid fa-plus me-1"></i>Thêm Phòng
                    </button>
                </div>
            </form>
        </div>
    </div>

    <%-- ── Room Table ── --%>
    <div class="card custom-card">
        <div class="card-header-luxury">
            <div class="panel-title" style="color:var(--primary-gold)">
                <i class="fa-solid fa-list-check"></i> DANH SÁCH PHÒNG TOÀN HỆ THỐNG
            </div>
        </div>
        <div class="card-body px-4 py-3">
            <div class="table-responsive table-responsive-luxury">
                <table class="table table-luxury table-hover align-middle">
                    <thead>
                        <tr>
                            <th style="width:60px">Mã</th>
                            <th style="width:90px">Số Phòng</th>
                            <th>Tên Phòng</th>
                            <th style="width:150px">Đơn Giá / Đêm</th>
                            <th style="width:120px">Trạng Thái</th>
                            <th style="width:120px">Hình Ảnh</th>
                            <th style="width:320px" class="text-center">Cập Nhật Nhanh</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${rooms}" var="r">
                            <tr>
                                <td class="fw-bold text-secondary">#${r.maPhong}</td>
                                <td><span class="badge bg-secondary px-2 py-1">${r.soPhong}</span></td>
                                <td class="fw-semibold text-dark">${r.tenPhong}</td>
                                <td class="price-cell">
                                    <fmt:formatNumber value="${r.giaPhong}" type="number" maxFractionDigits="0"/> VNĐ
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${r.trangThai == 'Trống'}">
                                            <span class="badge-premium badge-empty">
                                                <i class="fa-solid fa-circle-check"></i>Trống
                                            </span>
                                        </c:when>
                                        <c:when test="${r.trangThai == 'Đã Đặt'}">
                                            <span class="badge-premium badge-booked">
                                                <i class="fa-solid fa-user-lock"></i>Đã Đặt
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge-premium badge-maintenance">
                                                <i class="fa-solid fa-screwdriver-wrench"></i>Bảo Trì
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <img src="assets/images/${r.hinhAnh}"
                                         width="95" height="62"
                                         class="rounded border shadow-sm"
                                         style="object-fit:cover"
                                         alt="${r.tenPhong}">
                                </td>
                                <td>
                                    <div class="inline-edit-box">
                                        <form action="update-room" method="post">
                                            <input type="hidden" name="maPhong" value="${r.maPhong}">

                                            <div class="row g-1 mb-1">
                                                <div class="col-6">
                                                    <input type="text" name="soPhong" value="${r.soPhong}"
                                                           class="form-control form-control-luxury table-inline-input"
                                                           placeholder="Số phòng">
                                                </div>
                                                <div class="col-6">
                                                    <input type="text" name="tenPhong" value="${r.tenPhong}"
                                                           class="form-control form-control-luxury table-inline-input"
                                                           placeholder="Tên phòng">
                                                </div>
                                            </div>

                                            <div class="mb-1">
                                                <select name="maLoaiPhong"
                                                        class="form-select form-select-luxury table-inline-select w-100"
                                                        required>
                                                    <option value="1" ${r.maLoaiPhong == 1 ? 'selected' : ''}>1 - Phòng Đơn</option>
                                                    <option value="2" ${r.maLoaiPhong == 2 ? 'selected' : ''}>2 - Phòng Đôi</option>
                                                    <option value="3" ${r.maLoaiPhong == 3 ? 'selected' : ''}>3 - VIP</option>
                                                </select>
                                            </div>

                                            <div class="row g-1 mb-1">
                                                <div class="col-6">
                                                    <select name="trangThai" class="form-select form-select-luxury table-inline-select">
                                                        <option value="Trống"   ${r.trangThai == 'Trống'   ? 'selected' : ''}>Trống</option>
                                                        <option value="Đã Đặt" ${r.trangThai == 'Đã Đặt' ? 'selected' : ''}>Đã Đặt</option>
                                                        <option value="Bảo trì" ${r.trangThai == 'Bảo trì' ? 'selected' : ''}>Bảo trì</option>
                                                    </select>
                                                </div>
                                                <div class="col-6">
                                                    <input type="text" name="hinhAnh" value="${r.hinhAnh}"
                                                           class="form-control form-control-luxury table-inline-input"
                                                           placeholder="File ảnh">
                                                </div>
                                            </div>

                                            <div class="row g-1">
                                                <div class="col-6">
                                                    <button class="btn btn-luxury btn-primary btn-sm w-100 border-0">
                                                        <i class="fa-solid fa-floppy-disk me-1"></i>Lưu
                                                    </button>
                                                </div>
                                                <div class="col-6">
                                                    <a href="delete-room?id=${r.maPhong}"
                                                       class="btn btn-luxury btn-outline-danger btn-sm w-100"
                                                       onclick="return confirm('Bạn có chắc muốn xóa phòng này?')">
                                                        <i class="fa-solid fa-trash-can me-1"></i>Xóa
                                                    </a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>