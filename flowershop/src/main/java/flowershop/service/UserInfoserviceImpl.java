package flowershop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.UserInfoDaoMapper;
import flowershop.interfaces.UserInfoservice;
import flowershop.pojo.UserInfo;
import flowershop.pojo.UserInfoVo;

@Transactional
@Service
public class UserInfoserviceImpl implements UserInfoservice {

	@Autowired
	private UserInfoDaoMapper userInfoDaoMapper;

	@Override
	public int userlogin(UserInfo userInfo) {
		
		return userInfoDaoMapper.userlogin(userInfo);
	}

	@Override
	public UserInfo returnloginuserinfo(UserInfo userInfo) {
		
		return userInfoDaoMapper.returnloginuserinfo(userInfo);
	}

	@Override
	public void changeuserinfo(UserInfoVo userInfovo) {
		userInfoDaoMapper.changeuserinfo(userInfovo);
		
	}

	@Override
	public void userregister(UserInfo userinfo) {
		
		userInfoDaoMapper.userregister(userinfo);
	}

	@Override
	public void deleteuser(String nickname) {
		
		userInfoDaoMapper.deleteuser(nickname);
	}

}
