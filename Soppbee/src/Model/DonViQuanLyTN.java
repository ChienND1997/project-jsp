package Model;

public class DonViQuanLyTN {
	private int maDVTN;
	private String tenDVTN;
	private String SDT;
	private String fax;
	public int getMaDVTN() {
		return maDVTN;
	}
	public void setMaDVTN(int maDVTN) {
		this.maDVTN = maDVTN;
	}
	public String getTenDVTN() {
		return tenDVTN;
	}
	public void setTenDVTN(String tenDVTN) {
		this.tenDVTN = tenDVTN;
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
	public DonViQuanLyTN(int maDVTN, String tenDVTN, String sDT, String fax) {
		super();
		this.maDVTN = maDVTN;
		this.tenDVTN = tenDVTN;
		SDT = sDT;
		this.fax = fax;
	}
	public DonViQuanLyTN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
