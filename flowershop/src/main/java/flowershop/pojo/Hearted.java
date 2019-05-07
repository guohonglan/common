package flowershop.pojo;

import java.util.Date;

import flowershop.common.CommonUtils;

public class Hearted extends FlowerInfo{

	private String heartid;
	private String NickName;
	private Date heartdate;
	public String getHeartid() {
		return heartid;
	}
	public void setHeartid(String heartid) {
		this.heartid = heartid;
	}
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public Date getHeartdate() {
		return heartdate;
	}
	public void setHeartdate(Date heartdate) {
		this.heartdate = heartdate;
	}
	public Hearted()
	{
		super();
		this.heartdate=new Date();
		this.heartid=CommonUtils.ReturnId(10);
	}
}