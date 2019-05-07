package flowershop.web.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import flowershop.common.CommonUtils;
import flowershop.interfaces.Cartservice;
import flowershop.interfaces.Commentservice;
import flowershop.interfaces.FlowerInfoservice;
import flowershop.interfaces.FlowerMakingsservice;
import flowershop.interfaces.OrderDetailsservice;
import flowershop.interfaces.Orderservice;
import flowershop.interfaces.SlideShowservice;
import flowershop.interfaces.UserInfoservice;
import flowershop.pojo.Cart;
import flowershop.pojo.CommonVo;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.FlowerMakings;
import flowershop.pojo.Order;
import flowershop.pojo.OrderDetails;
import flowershop.pojo.SlideShow;
import flowershop.pojo.UserInfo;
import flowershop.pojo.UserInfoVo;

@Controller
public class UserInfoController {

	@Autowired
    private UserInfoservice userInfoservice;
	@Autowired
	private SlideShowservice slideShowservice;	
	@Autowired
	private FlowerMakingsservice flowerMakingsservice;
	@Autowired	
	private Cartservice cartservice;
	@Autowired
	private Commentservice commentservice;
	@Autowired
	private Orderservice orderservice;
	@Autowired
	private OrderDetailsservice orderDetailsservice;
	@Autowired
	private FlowerInfoservice flowerInfoservice;
	@RequestMapping("redirect")
	public String redirecttojsp(String flag)
	{
		return flag;
	}
		
	//用户登录
	@RequestMapping("tologin")
	public String Login(String NickName,String Password,HttpSession session,Model model)
	{
		Common com=new Common();
		int errors=com.validatenickname(model,Password,NickName,16);	
		System.out.println(errors);
		if(errors!=0)
		{
			System.out.println("tologin.....");
			return "login";
		}
		else 
		{					
			System.out.println("validatename,correct!");
			UserInfo Requestuserinfo=new UserInfo();
			String password=CommonUtils.GetMD5String(Password);
			Requestuserinfo.setNickName(NickName);
			Requestuserinfo.setPassword(password);		
			
			int num=userInfoservice.userlogin(Requestuserinfo);	
			if(num!=0)
			{
				System.out.println("validate,correct!");
				//向session中存储user信息
				UserInfo ResponseuserInfo=userInfoservice.returnloginuserinfo(Requestuserinfo);
				session.setAttribute("currentuser", ResponseuserInfo);			
				return index(model);
			}
			else
			{
				model.addAttribute("nmsg", "昵称或密码错误");
				return "login";
			}
		}

	}

	//index.jsp
	@RequestMapping("index")
	public String index(Model model)
	{		
		CommonVo commonvo=new CommonVo();
		//轮播图
		List<SlideShow> slide=slideShowservice.getallslideshow();
		commonvo.setSlide(slide);
		//花材名
		List<FlowerMakings> fm=flowerMakingsservice.getallflowermakings(new FlowerMakings());
		commonvo.setFm(fm);
		
		FlowerInfo flower=new FlowerInfo();
		flower.setSuitcondition("爱情鲜花");
		//爱情鲜花区域
		List<FlowerInfo> flove=flowerInfoservice.gettop8flowerlist(flower);
		commonvo.setF1(flove);
		flower.setSuitcondition(null);
		flower.setFmid("1108");
		//玫瑰区域
		List<FlowerInfo> frose=flowerInfoservice.gettop8flowerlist(flower);
		commonvo.setF2(frose);
		flower.setFmid(null);
		flower.setColor("黄色");
		//黄色鲜花区域
		List<FlowerInfo> fyellow=flowerInfoservice.gettop8flowerlist(flower);
		commonvo.setF3(fyellow);
		model.addAttribute("commonvo",commonvo);
		return "index";
	}
					
	//用户修改头像
	@RequestMapping("changuserimage")
	public String changeuseimage(MultipartFile Picture,Model model,HttpSession session) throws IllegalStateException, Exception
	{
		String locpath="D:\\Image\\User\\";
		//图片新名字
		String newpicname=CommonUtils.ReturnImageName();
		//图片旧名字
		String oldname=Picture.getOriginalFilename();
		//获取图片格式
		String sux=oldname.substring(oldname.lastIndexOf("."));		
		String newpicture=newpicname+sux;
				
		//新建本地文件流
		File file=new File(locpath+newpicture);
		File path=new File(locpath);
		if(!path.exists())
		{
			path.mkdir();
		}
		//写入本地磁盘
		Picture.transferTo(file);
        
		//从session中获取当前用户信息
		UserInfo userinfo=(UserInfo)session.getAttribute("currentuser");
		
		//修改数据库信息
		UserInfoVo vo=new UserInfoVo();
		UserInfo userinfo2=new UserInfo();
		userinfo2.setPicture(newpicture);
        vo.setUserinfo(userinfo2);
		vo.setTempName(userinfo.getNickName());
		userInfoservice.changeuserinfo(vo);
		
		model.addAttribute("msgimg", "头像修改成功");	

		//删除旧的头像
		String oldpicture=locpath+userinfo.getPicture();
		File oldfile=new File(oldpicture);
		oldfile.delete();
		
		//更新session
		Common common=new Common();
		common.updatesession(userInfoservice,userinfo.getNickName(), session);
		model.addAttribute("tabid",0);
		return "user";
	}
	
	//用户修改基本信息
	@RequestMapping("changeuserinfo")
	public String changeuserinfo(String NickName,String Sex,String BirthDay,HttpSession session,Model model)
	{
		System.out.println(NickName);
		Common common=new Common();
		int errors=common.validatenickname(model,null,NickName,16);
		model.addAttribute("pmsg","");
		if(errors==1||errors==2)
		{
			
		}		
		else
		{
			//从session中获取当前用户信息
			UserInfo currentuser=(UserInfo)session.getAttribute("currentuser");
			//用户修改后的信息
			UserInfo user1=new UserInfo();			
			user1.setSex(Sex);
			user1.setBirthDay(BirthDay);
			user1.setConstellation(CommonUtils.CaculateConstellation(BirthDay));
		
			//包装类
			UserInfoVo vo=new UserInfoVo();
			vo.setUserinfo(user1);
					
			//如果昵称未修改
			if(NickName.equals(currentuser.getNickName()))
			{
				vo.setTempName(currentuser.getNickName());
				userInfoservice.changeuserinfo(vo);
				model.addAttribute("nmsg", "信息修改成功");
				//更新session								
				common.updatesession(userInfoservice,currentuser.getNickName(), session);
			}
			//如果昵称修改了
			else if(!NickName.equals(currentuser.getNickName()))
			{	
				user1.setNickName(NickName);		
				int singal=userInfoservice.userlogin(user1);
				if(singal>0)
				{
					model.addAttribute("nmsg", "该昵称已存在");
				}		
				else
				{					
					vo.setTempName(currentuser.getNickName());
					userInfoservice.changeuserinfo(vo);
					model.addAttribute("nmsg", "信息修改成功");
					
					//修改cart的NickName
					UserInfo u=new UserInfo();
					u.setNickName(currentuser.getNickName());
					u.setPassword(NickName);
					cartservice.updatenickname(u);
					//修改Comment的NickName
					commentservice.updatenickname(u);
					//修改Order的NickName
					orderservice.updatenickname(u);
					//更新session								
					common.updatesession(userInfoservice,NickName, session);
				}
			}
		}
		
		model.addAttribute("tabid",1);
		return "user";
	}
	
	//用户修改密码
	@RequestMapping("changeuserpwd")
	public String changeuserpwd(String pwd1,String pwd2,Model model,HttpSession session)
	{
		Common com=new Common();
		int errors=com.validatenickname(model, pwd1, null,0);
		if(errors==1||errors==3)
		{
			
		}
		else if(!pwd2.equals(pwd1))
		{
			model.addAttribute("msg", "两次输入的密码不一致");
		}
		else
		{
			UserInfo userinfo=(UserInfo)session.getAttribute("currentuser");
			UserInfoVo vo=new UserInfoVo();
			UserInfo user=new UserInfo();
			user.setPassword(CommonUtils.GetMD5String(pwd1));
			vo.setUserinfo(user);
			vo.setTempName(userinfo.getNickName());
			model.addAttribute("msg", "密码修改成功");
		}
		model.addAttribute("tabid",2);
		return "user";
	}
	//用户注册
	@RequestMapping("userreister")
	public String userreister(String NickName,String pwd1,String pwd2,Model model)
	{
		//检验参数
		Common com=new Common();
		int errors=com.validatenickname(model, pwd1,NickName,16);
		if(errors!=0)
		{
			return "register";
		}	
		//比较两次填的密码是否一致
		else if(!pwd1.equals(pwd2))
		{
			model.addAttribute("msg","两次输入的密码不一致");
			return "register";
		}
		//格式正确
		else
		{
			UserInfo user=new UserInfo();
			user.setNickName(NickName);
			user.setPassword(CommonUtils.GetMD5String(pwd1));
			
			System.out.println(user.getNickName()+"----"+user.getPassword());
			//注册用户信息
			userInfoservice.userregister(user);
			
			return "login";
		}
	}
	
	//注销用户
	@RequestMapping("deleteuser")
	public String deleteuser(HttpSession session)
	{
		//获取session里的信息
		UserInfo userinfo=(UserInfo)session.getAttribute("currentuser");
		
		//删除订单
		//1.查出用户相关订单
		List<Order> orderlist=orderservice.getorderlist(userinfo.getNickName());
		
		for(Order o:orderlist)
		{
			List<OrderDetails> orderdelist=new ArrayList<>();
			orderdelist=orderDetailsservice.getorderdetailslist(o.getOrderId());
			for(OrderDetails od:orderdelist)
			{
				//2.删除订单详细
				OrderDetails ods=new OrderDetails();
				ods.setFid(od.getFid());
				ods.setOrderId(od.getOrderId());
				orderDetailsservice.deleteorderdetail(ods);
			}
			//3.删除订单
			orderservice.deleteorder(o.getOrderId());
		}
		//删除购物车
		//1.查询用户的所有购物车信息
		Cart cart=new Cart();
		cart.setNickName(userinfo.getNickName());
		List<Cart> cartlist=cartservice.getusercart(cart);
		for(Cart c:cartlist)
		{
			//2.删除购物车
			cart.setFid(c.getFid());
			cartservice.deletecart(cart);
		}
		//删除用户头像
		String locpath="D:\\Image\\User\\";
		String picture=locpath+userinfo.getPicture();
		File oldfile=new File(picture);
		oldfile.delete();
		//删除用户
		userInfoservice.deleteuser(userinfo.getNickName());		
		//删除session里的用户信息
		session.removeAttribute("currentuser");
		//跳转到登陆界面
		return "login";
	}
	
}
