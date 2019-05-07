package flowershop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.AdminInfoMapper;
import flowershop.interfaces.AdminInfoservice;
import flowershop.pojo.AdminInfo;

@Transactional
@Service
public class AdminInfoserviceImpl implements AdminInfoservice {

	@Autowired
	private AdminInfoMapper adminInfoMapper;
	
	@Override
	public int adminlogin(AdminInfo adminInfo) {
		
		return adminInfoMapper.adminlogin(adminInfo);
	}

}
