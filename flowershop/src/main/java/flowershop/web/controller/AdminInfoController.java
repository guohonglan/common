package flowershop.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import flowershop.common.CommonUtils;
import flowershop.interfaces.AdminInfoservice;
import flowershop.pojo.AdminInfo;

@Controller
public class AdminInfoController {

	@Autowired
	private AdminInfoservice adminInfoservice;
	
	@RequestMapping("blogin")
	public String toadminlogin()
	{
		return "Backstage/login";
	}
	
	@RequestMapping("adminlogin")
	public String adminlogin(String adminid,String password,Model model,HttpSession session)
	{
		AdminInfo info=new AdminInfo();
		info.setAdminId(adminid);
		info.setPassword(CommonUtils.GetMD5String(password));
		int count=adminInfoservice.adminlogin(info);
		if(count>0)
		{
			System.out.println("11111111111111111");
			session.setAttribute("adminid",adminid);
			return "Backstage/home";
		}
		else
		{
			System.out.println("222222222222222222");
			model.addAttribute("msg","账号或密码错误！");
			return "Backstage/login";
		}
	}
}
