package Model;

public class DoiTuong {
	private int maDT;
	private String tenDT;
	public int getMaDT() {
		return maDT;
	}
	public void setMaDT(int maDT) {
		this.maDT = maDT;
	}
	public String getTenDT() {
		return tenDT;
	}
	public void setTenDT(String tenDT) {
		this.tenDT = tenDT;
	}
	public DoiTuong(int maDT, String tenDT) {
		super();
		this.maDT = maDT;
		this.tenDT = tenDT;
	}
	public DoiTuong() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
