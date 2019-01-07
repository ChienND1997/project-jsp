package Model;

public class TaiChinhDuAn {
	private int maTC;
	private int GPMB;
	private int TK;
	private int HT;
	private int TC;
	private int QL;
	private int NVTC;
	private int VVNH;
	private boolean thue;
	public int getMaTC() {
		return maTC;
	}
	public void setMaTC(int maTC) {
		this.maTC = maTC;
	}
	public int getGPMB() {
		return GPMB;
	}
	public void setGPMB(int gPMB) {
		GPMB = gPMB;
	}
	public int getTK() {
		return TK;
	}
	public void setTK(int tK) {
		TK = tK;
	}
	public int getHT() {
		return HT;
	}
	public void setHT(int hT) {
		HT = hT;
	}
	public int getTC() {
		return TC;
	}
	public void setTC(int tC) {
		TC = tC;
	}
	public int getQL() {
		return QL;
	}
	public void setQL(int qL) {
		QL = qL;
	}
	public int getNVTC() {
		return NVTC;
	}
	public void setNVTC(int nVTC) {
		NVTC = nVTC;
	}
	public int getVVNH() {
		return VVNH;
	}
	public void setVVNH(int vVNH) {
		VVNH = vVNH;
	}
	public boolean isThue() {
		return thue;
	}
	public void setThue(boolean thue) {
		this.thue = thue;
	}
	public TaiChinhDuAn(int maTC, int gPMB, int tK, int hT, int tC, int qL, int nVTC, int vVNH, boolean thue) {
		super();
		this.maTC = maTC;
		GPMB = gPMB;
		TK = tK;
		HT = hT;
		TC = tC;
		QL = qL;
		NVTC = nVTC;
		VVNH = vVNH;
		this.thue = thue;
	}
	public TaiChinhDuAn() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
