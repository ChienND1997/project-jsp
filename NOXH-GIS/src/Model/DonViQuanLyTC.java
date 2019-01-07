package Model;

public class DonViQuanLyTC {
	private int maDVTC;
	private String tenDVTC;
	private String SDT;
	private String fax;
	public int getMaDVTC() {
		return maDVTC;
	}
	public void setMaDVTC(int maDVTC) {
		this.maDVTC = maDVTC;
	}
	public String getTenDVTC() {
		return tenDVTC;
	}
	public void setTenDVTC(String tenDVTC) {
		this.tenDVTC = tenDVTC;
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
	public DonViQuanLyTC(int maDVTC, String tenDVTC, String sDT, String fax) {
		super();
		this.maDVTC = maDVTC;
		this.tenDVTC = tenDVTC;
		SDT = sDT;
		this.fax = fax;
	}
	public DonViQuanLyTC() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
