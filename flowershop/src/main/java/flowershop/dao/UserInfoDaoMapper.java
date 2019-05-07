package flowershop.dao;

import flowershop.pojo.UserInfo;
import flowershop.pojo.UserInfoVo;

public interface UserInfoDaoMapper {

	//用户登录
	int userlogin(UserInfo userInfo);
	UserInfo returnloginuserinfo(UserInfo userInfo);
	
	//换头像
	void changeuserinfo(UserInfoVo userInfovo);
    
	//用户注册
	void userregister(UserInfo userinfo);
	//注销用户
	void deleteuser(String nickname);
}
