package flowershop.web.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import flowershop.common.CommonUtils;
import flowershop.interfaces.Commentservice;
import flowershop.interfaces.FlowerInfoservice;
import flowershop.interfaces.FlowerMakingsservice;
import flowershop.interfaces.Heartedservice;
import flowershop.pojo.CommonVo;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.FlowerMakings;
import flowershop.pojo.Hearted;
import flowershop.pojo.UserInfo;

@Controller
public class FlowerInfoController {
	
	@Autowired
	private FlowerInfoservice flowerInfoservice;
	@Autowired
	private Commentservice commentservice;
	@Autowired
	private FlowerMakingsservice flowerMakingsservice;
	@Autowired
	private Heartedservice heartedservice;
	@RequestMapping("sorting")
	public String sorting(@RequestParam(required=true,defaultValue="1") Integer pageNo,String search,Model model,HttpSession session)
	{
        PageHelper.startPage(pageNo,9);
		
		CommonVo commonvo=new CommonVo();
		Common common=new Common();
		//紧跟着的第一个方法会被分页
		FlowerInfo flowerInfo=new FlowerInfo();
		flowerInfo.setFname(search);
		System.out.println("bbbbbbbbbbb");
		if(session.getAttribute("currentuser")!=null)
		{
			UserInfo user=(UserInfo)session.getAttribute("currentuser");
			common.getflowerlisthadlogin(heartedservice,flowerInfoservice, flowerInfo, model,commonvo,user.getNickName());
		}	
		else
		{
			common.getflowerlist(flowerInfoservice, flowerInfo, model, commonvo);
		}
		common.gettopfivelist(flowerInfoservice, model,commonvo);
		commonvo.setTemp(0);
		model.addAttribute("search",search);
		model.addAttribute("commonvo",commonvo);
		return "sorting";
	}
	
	@RequestMapping("sortingbyfmid")
	public String sortingbyfmid(@RequestParam(required=true,defaultValue="1") Integer pageNo,String id,Model model,HttpSession session)
	{		
		PageHelper.startPage(pageNo,9);
		CommonVo commonvo=new CommonVo();
		Common common=new Common();
		FlowerInfo flowerInfo=new FlowerInfo();
		flowerInfo.setFmid(id);
		System.out.println("bbbbbbbbbbbb");
		if(session.getAttribute("currentuser")!=null)
		{
			UserInfo user=(UserInfo)session.getAttribute("currentuser");
			common.getflowerlisthadlogin(heartedservice, flowerInfoservice, flowerInfo, model, commonvo, user.getNickName());	
		}
		else
		{
			common.getflowerlist(flowerInfoservice, flowerInfo, model, commonvo);
		}
		common.gettopfivelist(flowerInfoservice, model,commonvo);
		
		FlowerMakings fmlist=flowerMakingsservice.getoneflowermakings(id);
		model.addAttribute("fmlist",fmlist);
		commonvo.setTemp(1);
		model.addAttribute("commonvo",commonvo);
		return "sorting";
	}
	
	@RequestMapping("sortingbycondition")
	private String sortingbycondition(@RequestParam(required=true,defaultValue="1") Integer pageNo,String condition,Model model,HttpSession session)
	{
		PageHelper.startPage(pageNo,9);
		CommonVo commonvo=new CommonVo();
		Common common=new Common();
		FlowerInfo flowerInfo=new FlowerInfo();
		flowerInfo.setSuitcondition(condition);
		if(session.getAttribute("currentuser")!=null)
		{
			UserInfo user=(UserInfo)session.getAttribute("currentuser");
			common.getflowerlisthadlogin(heartedservice, flowerInfoservice, flowerInfo, model, commonvo, user.getNickName());	
		}
		else
		{
			common.getflowerlist(flowerInfoservice, flowerInfo, model, commonvo);
		}
		common.gettopfivelist(flowerInfoservice, model,commonvo);
		model.addAttribute("condition",condition);
		commonvo.setTemp(2);
		model.addAttribute("commonvo",commonvo);
		return "sorting";
	}
	@RequestMapping("sortingbycolor")
	private String sortingbycolor(@RequestParam(required=true,defaultValue="1") Integer pageNo,String color,Model model,HttpSession session)
	{
		PageHelper.startPage(pageNo,9);
		CommonVo commonvo=new CommonVo();
		Common common=new Common();
		FlowerInfo flowerInfo=new FlowerInfo();
		flowerInfo.setColor(color);
		if(session.getAttribute("currentuser")!=null)
		{
			UserInfo user=(UserInfo)session.getAttribute("currentuser");
			common.getflowerlisthadlogin(heartedservice, flowerInfoservice, flowerInfo, model, commonvo, user.getNickName());	
		}
		else
		{
			common.getflowerlist(flowerInfoservice, flowerInfo, model, commonvo);
		}
		common.gettopfivelist(flowerInfoservice, model,commonvo);
		model.addAttribute("color",color);
		commonvo.setTemp(3);
		model.addAttribute("commonvo",commonvo);
		return "sorting";
	}
	@RequestMapping("flowerdetail")
	public String getoneflowerinfo(String id,Model model,HttpSession session)
	{
		CommonVo commonvo=new CommonVo();
		Common common=new Common();
		FlowerInfo flowerInfo=new FlowerInfo();
		flowerInfo.setFid(id);
		FlowerInfo flist=flowerInfoservice.getflowerdetail(flowerInfo);
		
		common.getcomment(commentservice, flowerInfo, model,commonvo);
		common.gettopfivelist(flowerInfoservice, model,commonvo);
		
		if(session.getAttribute("currentuser")!=null)
		{
			UserInfo user=(UserInfo)session.getAttribute("currentuser");
			List<Hearted> hlist=heartedservice.getheartedlist(user.getNickName());
			for(Hearted h:hlist)
			{
				if(id.equals(h.getFid()))
				{
					flist.setIsornotheart(h.getHeartid());
				}
			}
		}
		else {}
		model.addAttribute("flist",flist);
		model.addAttribute("commonvo",commonvo);
		return "info";
	}		
	
	
	@RequestMapping("getfmid")
	public String getfmid(Model model)
	{
		List<FlowerMakings> fmlist=flowerMakingsservice.getallflowermakings(new FlowerMakings());
		model.addAttribute("fmlist",fmlist);
		model.addAttribute("tabid",6);
		model.addAttribute("temp2",0);
		return "Backstage/home";
	}
	
	@RequestMapping("addflower")
	public String addflower(String fname,String fmid,String saleprice,String fmeaning,MultipartFile fimage,Model model) throws IllegalStateException, IOException
	{
		FlowerInfo flowerInfo=new FlowerInfo();
		flowerInfo.setFid(CommonUtils.ReturnId(7));
		flowerInfo.setFname(fname);
		flowerInfo.setFmid(fmid);
		flowerInfo.setSalePrice(new BigDecimal(saleprice));
		flowerInfo.setFmeaning(fmeaning);
		flowerInfo.setSaleQuantity(0);
		if(!fimage.isEmpty())
		{
			//保存图片
			Common com=new Common();
			String path=com.saveimage(fimage, "\\Flower\\");
			flowerInfo.setFimage("Image/Flower/"+path);
			
			flowerInfoservice.addflower(flowerInfo);
		}
		else
		{}		
		return "redirect:getfmid.action";
	}
	
	@RequestMapping("getflowerlist")
	public String getflowerlist(String fmid,String tabid,Model model)
	{
		if(Integer.parseInt(tabid)==7)
		{
			model.addAttribute("temp",0);			
		}
		else
		{
			model.addAttribute("temp",1);	
		}
				
		if(fmid!=null)
		{
		   FlowerInfo finfo=new FlowerInfo();
		   finfo.setFmid(fmid);
		   List<FlowerInfo> flist=flowerInfoservice.getflowerlist(finfo);
		   model.addAttribute("flist",flist);
		}
		else
		{
		   FlowerInfo finfo=new FlowerInfo();
		   finfo.setFmid("1108");
		   List<FlowerInfo> flist=flowerInfoservice.getflowerlist(finfo);
		   model.addAttribute("flist",flist);
		}
		List<FlowerMakings> fmlist=flowerMakingsservice.getallflowermakings(new FlowerMakings());
		model.addAttribute("fmlist",fmlist);
		model.addAttribute("tabid",7);
		return "Backstage/home";
	}
	
	@RequestMapping("updateflower")
	public String updateflower(String fid,String fmid,Model model)
	{
		FlowerInfo finfo=new FlowerInfo();
		finfo.setFid(fid);
		FlowerInfo flist=flowerInfoservice.getflowerdetail(finfo);
		model.addAttribute("finfo",flist);
		
		List<FlowerMakings> fmlist=flowerMakingsservice.getallflowermakings(new FlowerMakings());
		model.addAttribute("fmlist",fmlist);
		
		model.addAttribute("tabid",6);
		model.addAttribute("temp2",1);
		return "Backstage/home";
	}
	
	@RequestMapping("modifyflower")
	public String modifyflower(String fid,String fname,String fmid,String saleprice,String fmeaning,String fimagepath,MultipartFile fimage,RedirectAttributes attr) throws IllegalStateException, IOException
	{
		FlowerInfo info=new FlowerInfo();
		info.setFid(fid);
		info.setFmid(fmid);
		info.setFname(fname);
		info.setFmeaning(fmeaning);
		info.setSalePrice(new BigDecimal(saleprice));
		if(!fimage.isEmpty())
		{
			//保存新图片
			Common com=new Common();
			String path=com.saveimage(fimage, "\\Flower\\");
			info.setFimage("Image/Flower/"+path);
			
			//删除原始图片		
			com.deleteimage(fimagepath);
		}
		else
		{
			info.setFimage(fimagepath);
		}								
				
		//修改数据库
		flowerInfoservice.updateflower(info);
		
		attr.addAttribute("tabid",7);
		attr.addAttribute("fmid",fmid);
		return "redirect:getflowerlist";
	}
	@RequestMapping("deleteflower")
	public String deleteflower(String fid,String fmid,RedirectAttributes attr)
	{
		FlowerInfo info1=new FlowerInfo();
		info1.setFid(fid);
		FlowerInfo info=flowerInfoservice.getflowerdetail(info1);
		//删除图片
		Common com=new Common();
		com.deleteimage(info.getFimage());
		
		//删除数据库信息
		flowerInfoservice.deleteflower(fid);
		
		attr.addAttribute("fmid",fmid);
		attr.addAttribute("tabid",8);
		return "redirect:getflowerlist";
	}
}
