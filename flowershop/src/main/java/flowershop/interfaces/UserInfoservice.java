package flowershop.interfaces;


import flowershop.pojo.UserInfo;
import flowershop.pojo.UserInfoVo;

public interface UserInfoservice {

	int userlogin(UserInfo userInfo);
	UserInfo returnloginuserinfo(UserInfo userInfo);
	
	void changeuserinfo(UserInfoVo userInfovo);
	
	void userregister(UserInfo userinfo);
	//注销用户
    void deleteuser(String nickname);
}
