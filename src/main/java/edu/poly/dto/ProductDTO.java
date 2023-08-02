package edu.poly.dto;

public class ProductDTO {
    int maSP;
    String tenSP;
    double dongia;
    String mota;
    String hinhanh;
    int soluong;
    String tenloai;

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public double getDongia() {
        return dongia;
    }

    public void setDongia(double dongia) {
        this.dongia = dongia;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getTenloai() {
        return tenloai;
    }

    public void setTenloai(String tenloai) {
        this.tenloai = tenloai;
    }

    public ProductDTO() {
    }

    public ProductDTO(int maSP, String tenSP, double dongia, String mota, String hinhanh, int soluong, String tenloai) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.dongia = dongia;
        this.mota = mota;
        this.hinhanh = hinhanh;
        this.soluong = soluong;
        this.tenloai = tenloai;
    }
}
