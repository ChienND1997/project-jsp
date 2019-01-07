package Model;

public class ChiTietCongTrinh {
	private int maduan;
	private int maCT;
	private int dienTich;
	private int socho;
	public int getMaduan() {
		return maduan;
	}
	public void setMaduan(int maduan) {
		this.maduan = maduan;
	}
	public int getMaCT() {
		return maCT;
	}
	public void setMaCT(int maCT) {
		this.maCT = maCT;
	}
	public int getDientich() {
		return dienTich;
	}
	public void setDientich(int dienTich) {
		this.dienTich = dienTich;
	}
	public int getSocho() {
		return socho;
	}
	public void setSocho(int socho) {
		this.socho = socho;
	}
	public ChiTietCongTrinh() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietCongTrinh(int maduan, int maCT, int dienTich, int socho) {
		super();
		this.maduan = maduan;
		this.maCT = maCT;
		this.dienTich = dienTich;
		this.socho = socho;
	}

}
