package models;

public class DatPhong {

    private int maDatPhong;
    private int maKhachHang;
    private int maPhong;
    private String ngayNhan;
    private String ngayTra;
    private String trangThai;

    public DatPhong() {}

    public DatPhong(int maKhachHang, int maPhong,
                    String ngayNhan, String ngayTra,
                    String trangThai) {
        this.maKhachHang = maKhachHang;
        this.maPhong = maPhong;
        this.ngayNhan = ngayNhan;
        this.ngayTra = ngayTra;
        this.trangThai = trangThai;
    }

    public int getMaKhachHang() { return maKhachHang; }
    public int getMaPhong() { return maPhong; }
    public String getNgayNhan() { return ngayNhan; }
    public String getNgayTra() { return ngayTra; }
    public String getTrangThai() { return trangThai; }
}