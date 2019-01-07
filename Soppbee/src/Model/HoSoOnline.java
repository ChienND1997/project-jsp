package Model;

public class HoSoOnline {
	private int CMND;
	private String hoten;
	private String email;
	private String nghenghiep;
	private int thunhap;
	private String doituong;
	private String duan;
	private String congty;
	public int getCMND() {
		return CMND;
	}
	public void setCMND(int cMND) {
		CMND = cMND;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNghenghiep() {
		return nghenghiep;
	}
	public void setNghenghiep(String nghenghiep) {
		this.nghenghiep = nghenghiep;
	}
	public int getThunhap() {
		return thunhap;
	}
	public void setThunhap(int thunhap) {
		this.thunhap = thunhap;
	}
	public String getDoituong() {
		return doituong;
	}
	public void setDoituong(String doituong) {
		this.doituong = doituong;
	}
	public String getDuan() {
		return duan;
	}
	public void setDuan(String duan) {
		this.duan = duan;
	}
	public String getCongty() {
		return congty;
	}
	public void setCongty(String congty) {
		this.congty = congty;
	}
	public HoSoOnline(int cMND, String hoten, String email, String nghenghiep, int thunhap, String doituong,
			String duan, String congty) {
		super();
		CMND = cMND;
		this.hoten = hoten;
		this.email = email;
		this.nghenghiep = nghenghiep;
		this.thunhap = thunhap;
		this.doituong = doituong;
		this.duan = duan;
		this.congty = congty;
	}
	public HoSoOnline() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
