package Model;

public class ChuDauTu {
	private int maCDT;
	private String tenCDT;
	private String SDT;
	private String fax;
	public int getMaCDT() {
		return maCDT;
	}
	public void setMaCDT(int maCDT) {
		this.maCDT = maCDT;
	}
	public String getTenCDT() {
		return tenCDT;
	}
	public void setTenCDT(String tenCDT) {
		this.tenCDT = tenCDT;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public ChuDauTu(int maCDT, String tenCDT, String sDT, String fax) {
		super();
		this.maCDT = maCDT;
		this.tenCDT = tenCDT;
		SDT = sDT;
		this.fax = fax;
	}
	public ChuDauTu() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
