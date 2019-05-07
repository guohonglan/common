package flowershop.pojo;


public class UserInfo {
  
     private String NickName;
     private String Password;
     private String Picture;
     private String BirthDay;
     private String Sex;
     private String Constellation;
     
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getPicture() {
		return Picture;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public String getBirthDay() {
		return BirthDay;
	}
	public void setBirthDay(String birthDay) {
		BirthDay = birthDay;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getConstellation() {
		return Constellation;
	}
	public void setConstellation(String constellation) {
		Constellation = constellation;
	}
	public UserInfo(String userId, String nickName, String password, String picture, String birthDay, String sex,
			String constellation) {
		super();
		NickName = nickName;
		Password = password;
		Picture = picture;
		BirthDay = birthDay;
		Sex = sex;
		Constellation = constellation;
	}
	public UserInfo()
	{
		super();
	}
	
	
}
