package Models.Objects;

public class User {
	
	private String userName;
	private String userPassword;
	private String userMail;
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserMail() {
		return userMail;
	}
	
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
}
