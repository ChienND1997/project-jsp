package Model;

public class ChiTietDoiTuong {
	private int maDA;
	private int maDT;
	private int socho;
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
	public int getSocho() {
		return socho;
	}
	public void setSocho(int socho) {
		this.socho = socho;
	}
	public ChiTietDoiTuong(int maDA, int maDT, int socho) {
		super();
		this.maDA = maDA;
		this.maDT = maDT;
		this.socho = socho;
	}
	public ChiTietDoiTuong() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
