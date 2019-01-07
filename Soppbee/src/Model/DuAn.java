package Model;

public class DuAn {
	private int maDA;
	private String tenDA;
	private String vitriDA;
	private float kinhDo;
	private float viDo;
	private int maCDT;
	private int maDVTN;
	private int maDVTC;
	private int dienTich;
	private int maDoXD;
	private int tongVonDauTu;
	private int namBatDau;
	private int namHoanThanh;
	private int tongSoToaNha;
	private int tongSoCanHo;
	private int dienTichCanHo;
	private int giaBan;
	private int giaThue;
	private int giaiDoan;
	private int maTaiChinh;
	private String tenCDT;
	
	
	
	public int getMaDVTC() {
		return maDVTC;
	}
	public void setMaDVTC(int maDVTC) {
		this.maDVTC = maDVTC;
	}
	public String getTenCDT() {
		return tenCDT;
	}
	public void setTenCDT(String tenCDT) {
		this.tenCDT = tenCDT;
	}
	public String getVitriDA() {
		return vitriDA;
	}
	public void setVitriDA(String vitriDA) {
		this.vitriDA = vitriDA;
	}
	public int getMaDA() {
		return maDA;
	}
	public void setMaDA(int maDA) {
		this.maDA = maDA;
	}
	public String getTenDA() {
		return tenDA;
	}
	public void setTenDA(String tenDA) {
		this.tenDA = tenDA;
	}
	public float getKinhDo() {
		return kinhDo;
	}
	public void setKinhDo(float kinhDo) {
		this.kinhDo = kinhDo;
	}
	public float getViDo() {
		return viDo;
	}
	public void setViDo(float viDo) {
		this.viDo = viDo;
	}
	public int getMaCDT() {
		return maCDT;
	}
	public void setMaCDT(int maCDT) {
		this.maCDT = maCDT;
	}
	public int getMaDVTN() {
		return maDVTN;
	}
	public void setMaDVTN(int maDVTN) {
		this.maDVTN = maDVTN;
	}
	public int getDienTich() {
		return dienTich;
	}
	public void setDienTich(int dienTich) {
		this.dienTich = dienTich;
	}
	public int getMaDoXD() {
		return maDoXD;
	}
	public void setMaDoXD(int maDoXD) {
		this.maDoXD = maDoXD;
	}
	public int getTongVonDauTu() {
		return tongVonDauTu;
	}
	public void setTongVonDauTu(int tongVonDauTu) {
		this.tongVonDauTu = tongVonDauTu;
	}
	public int getNamBatDau() {
		return namBatDau;
	}
	public void setNamBatDau(int namBatDau) {
		this.namBatDau = namBatDau;
	}
	public int getNamHoanThanh() {
		return namHoanThanh;
	}
	public void setNamHoanThanh(int namHoanThanh) {
		this.namHoanThanh = namHoanThanh;
	}
	public int getTongSoToaNha() {
		return tongSoToaNha;
	}
	public void setTongSoToaNha(int tongSoToaNha) {
		this.tongSoToaNha = tongSoToaNha;
	}
	public int getTongSoCanHo() {
		return tongSoCanHo;
	}
	public void setTongSoCanHo(int tongSoCanHo) {
		this.tongSoCanHo = tongSoCanHo;
	}
	public int getDienTichCanHo() {
		return dienTichCanHo;
	}
	public void setDienTichCanHo(int dienTichCanHo) {
		this.dienTichCanHo = dienTichCanHo;
	}
	public int getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}
	public int getGiaThue() {
		return giaThue;
	}
	public void setGiaThue(int giaThue) {
		this.giaThue = giaThue;
	}
	public int getGiaiDoan() {
		return giaiDoan;
	}
	public void setGiaiDoan(int giaiDoan) {
		this.giaiDoan = giaiDoan;
	}
	public int getMaTaiChinh() {
		return maTaiChinh;
	}
	public void setMaTaiChinh(int maTaiChinh) {
		this.maTaiChinh = maTaiChinh;
	}
	public int getDVTC() {
		return maDVTC;
	}
	public void setDVTC(int maDVTC) {
		this.maDVTC = maDVTC;
	}
	public DuAn(int maDA, String tenDA, float kinhDo, float viDo, int maCDT, int maDVTN, int maDVTC, int dienTich, int maDoXD,
			int tongVonDauTu, int namBatDau, int namHoanThanh, int tongSoToaNha, int tongSoCanHo, int dienTichCanHo,
			int giaBan, int giaThue, int giaiDoan, int maTaiChinh) {
		super();
		this.maDA = maDA;
		this.tenDA = tenDA;
		this.kinhDo = kinhDo;
		this.viDo = viDo;
		this.maCDT = maCDT;
		this.maDVTN = maDVTN;
		this.maDVTC = maDVTC;
		this.dienTich = dienTich;
		this.maDoXD = maDoXD;
		this.tongVonDauTu = tongVonDauTu;
		this.namBatDau = namBatDau;
		this.namHoanThanh = namHoanThanh;
		this.tongSoToaNha = tongSoToaNha;
		this.tongSoCanHo = tongSoCanHo;
		this.dienTichCanHo = dienTichCanHo;
		this.giaBan = giaBan;
		this.giaThue = giaThue;
		this.giaiDoan = giaiDoan;
		this.maTaiChinh = maTaiChinh;
	}
	public DuAn() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DuAn(String tenDA, String vitriDA, int dienTich, int maDoXD, 
			int tongSoToaNha, int giaiDoan) {
		super();
		this.tenDA = tenDA;
		this.vitriDA = vitriDA;
		this.dienTich = dienTich;
		this.maDoXD = maDoXD;
	
		this.tongSoToaNha = tongSoToaNha;
		this.giaiDoan = giaiDoan;
	}
	public void get(int int1) {
		// TODO Auto-generated method stub
		
	}
	
}
