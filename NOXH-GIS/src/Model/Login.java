package Model;

public class Login {
	private String account;
	private String password;
	private long IDR;
	
	
	public long getIDR() {
		return IDR;
	}
	public void setIDR(long l) {
		IDR = l;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public Login(String account, String password,int IDR) {
		super();
		this.IDR = IDR;
		this.account = account;
		this.password = password;

	}
	public Login() {
		super();

	}
	
	
}
