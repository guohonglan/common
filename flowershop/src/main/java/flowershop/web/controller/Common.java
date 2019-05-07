package flowershop.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import flowershop.common.CommonUtils;
import flowershop.interfaces.Cartservice;
import flowershop.interfaces.Commentservice;
import flowershop.interfaces.FlowerInfoservice;
import flowershop.interfaces.FlowerMakingsservice;
import flowershop.interfaces.Heartedservice;
import flowershop.interfaces.SlideShowservice;
import flowershop.interfaces.UserInfoservice;
import flowershop.pojo.Cart;
import flowershop.pojo.Comment;
import flowershop.pojo.CommonVo;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.FlowerMakings;
import flowershop.pojo.Hearted;
import flowershop.pojo.SlideShow;
import flowershop.pojo.UserInfo;

public class Common {

	//更新session的User信息
	public void updatesession(UserInfoservice userInfoservice,String NickName,HttpSession session)
	{
		UserInfo userinfo=new UserInfo();
		userinfo.setNickName(NickName);
		UserInfo currentuser=userInfoservice.returnloginuserinfo(userinfo);
		session.setAttribute("currentuser", currentuser);
	}

	//获得slideshow的所有信息
	public void getallslideshow(SlideShowservice slideShowservice,Model model)
	{
		List<SlideShow> list=slideShowservice.getallslideshow();
		model.addAttribute("slideshowlist",list);
	}
	
	//按要求查询FlowerMakings的信息
	public void getflowermakingslist(FlowerMakingsservice flowerMakingsservice,FlowerMakings flowerMakings,Model model)
	{
		List<FlowerMakings> list=flowerMakingsservice.getallflowermakings(flowerMakings);
		model.addAttribute("fmlist", list);
	}
	
	//按要求查询FlowerInfo的信息--已登录
	public void getflowerlisthadlogin(Heartedservice heartedservice,FlowerInfoservice flowerInfoservice,FlowerInfo flowerInfo,Model model,CommonVo commonvo,String NickName)
	{		
		List<FlowerInfo> list=flowerInfoservice.getflowerlist(flowerInfo);
		for(Hearted h:heartedservice.getheartedlist(NickName))
		{
			for(FlowerInfo f:list)
			{
				if(h.getFid().equals(f.getFid()))
				{
					f.setIsornotheart(h.getHeartid());
				}							
			}			
		}

		PageInfo<FlowerInfo> pageinfo=new PageInfo<>(list);
		model.addAttribute("page",pageinfo);
		commonvo.setF1(list);	
	}
	
	//按要求查询FlowerInfo的信息--未登录
	public void getflowerlist(FlowerInfoservice flowerInfoservice,FlowerInfo flowerInfo,Model model,CommonVo commonvo)
	{				
		List<FlowerInfo> list=flowerInfoservice.getflowerlist(flowerInfo);			
		PageInfo<FlowerInfo> pageinfo=new PageInfo<>(list);
		model.addAttribute("page",pageinfo);
		commonvo.setF1(list);	
	}
		
	//获取销量前五
	public void gettopfivelist(FlowerInfoservice flowerInfoservice,Model model,CommonVo commonvo)
	{
		List<FlowerInfo> topfive=flowerInfoservice.gettopfiveflower();
		commonvo.setF2(topfive);
	}
	//获得花的评论
	public void getcomment(Commentservice commentservice,FlowerInfo flowerInfo,Model model,CommonVo commonvo)
	{
		List<Comment> clist=commentservice.getflowercomment(flowerInfo);
		commonvo.setComment(clist);
	}
	
	//根据NickName查询用户的所有购物车信息
	public void getcart(Cartservice cartservice,Cart cart,Model model)
	{
		List<Cart> cartlist=cartservice.getusercart(cart);
		model.addAttribute("cartlist", cartlist);
	}
	
	//保存图片
	public String saveimage(MultipartFile Picture,String derct) throws IllegalStateException, IOException
	{
		String locpath="D:\\软件\\eclipse\\eclipse-workspace\\flowershop"+"\\src\\main\\webapp\\static\\Image"+derct;
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
		return newpicture;
	}
	
	//删除图片
	public void deleteimage(String path)
	{
		String pathstr="D:\\软件\\eclipse\\eclipse-workspace\\flowershop"+"\\src\\main\\webapp\\static\\"+path;
		File file=new File(pathstr);
		if(file.isFile()&&file.exists())
		{
			file.delete();
		}
		else
		{ }
	}
	
	//校验用户昵称和密码
	public int validatenickname(Model model,String pwd,String nickname,int size)
	{
		System.out.println("validatename.....");
		String message=CommonUtils.validatenickname(nickname,size);		
		String message2=CommonUtils.validatepwd(pwd);
	    System.out.println(message);
		System.out.println(message2);
		int params=0;
		if(message!=null&&message2!=null)
		{ 
	        params=1; //昵称密码都有错误
			model.addAttribute("nmsg",message);
			model.addAttribute("pmsg",message2);
		}
		else if(message!=null&&message2==null)
		{
			params=2; //昵称有误，密码无误
			model.addAttribute("nmsg",message);
		}
		else if(message==null&&message2!=null)
		{
			params=3; //昵称无误，密码有误
			model.addAttribute("pmsg",message2);
		}
		else {}
		System.out.println(message);
		System.out.println(message2);
		System.out.println(params);
		return  params;
	}
}
