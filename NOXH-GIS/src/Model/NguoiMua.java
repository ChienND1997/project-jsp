package Model;

public class NguoiMua {
	private int maNM;
	private int maDA;
	private int maDT;
	private String hoTen;
	private String SDT;
	private String CMND;
	private String tenPhong;
	private String diaChi;
	private String tenDA;
	public String getTenDA() {
		return tenDA;
	}
	public void setTenDA(String tenDA) {
		this.tenDA = tenDA;
	}
	public int getMaNM() {
		return maNM;
	}
	public void setMaNM(int maNM) {
		this.maNM = maNM;
	}
	public int getMaDA() {
		return maDA;
	}
	public void setMaDA(int maDA) {
		this.maDA = maDA;
	}
	public int getMaDT() {
		return maDT;
	}
	public void setMaDT(int maDT) {
		this.maDT = maDT;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	public String getTenPhong() {
		return tenPhong;
	}
	public void setTenPhong(String tenPhong) {
		this.tenPhong = tenPhong;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public NguoiMua( String hoTen, String sDT, String cMND, String tenPhong,
			String diaChi) {
		super();
		this.hoTen = hoTen;
		SDT = sDT;
		CMND = cMND;
		this.tenPhong = tenPhong;
		this.diaChi = diaChi;
	}
	
	public NguoiMua(int maNM, int maDA, int maDT, String hoTen, String sDT, String cMND, String tenPhong,
			String diaChi) {
		super();
		this.maNM = maNM;
		this.maDA = maDA;
		this.maDT = maDT;
		this.hoTen = hoTen;
		SDT = sDT;
		CMND = cMND;
		this.tenPhong = tenPhong;
		this.diaChi = diaChi;
	}
	public NguoiMua() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
