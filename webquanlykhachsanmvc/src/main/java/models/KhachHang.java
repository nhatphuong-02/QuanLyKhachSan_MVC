package models;

public class KhachHang {
    private int maKhachHang;
    private String hoTen;
    private String sdt;
    private String email;
    private String diaChi;

    public KhachHang() {}

    public KhachHang(String hoTen, String sdt, String email, String diaChi) {
        this.hoTen = hoTen;
        this.sdt = sdt;
        this.email = email;
        this.diaChi = diaChi;
    }

    public int getMaKhachHang() { return maKhachHang; }
    public void setMaKhachHang(int maKhachHang) { this.maKhachHang = maKhachHang; }

    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }

    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
}