package flowershop.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import flowershop.common.CommonUtils;
import flowershop.interfaces.Heartedservice;
import flowershop.pojo.CommonVo;
import flowershop.pojo.Hearted;

@Controller
public class HeartedController {

	@Autowired
	private Heartedservice heartedservice;
	
	@RequestMapping("addhearted")
	public String addhearted(String NickName,String fid,Model model,RedirectAttributes attr)
	{
		Hearted hearted=new Hearted();
		hearted.setFid(fid);
		hearted.setNickName(NickName);
		
		//加入数据库
		heartedservice.addhearted(hearted);
		attr.addAttribute("nickname",NickName);
		return "redirect:hearted.action";
	}
	
	@RequestMapping("hearted")
	public String getheartedlist(String nickname,Model model)
	{
		List<Hearted> hlist=heartedservice.getheartedlist(nickname);
		model.addAttribute("hlist",hlist);
		return "hearted";
	}
	
	@RequestMapping("deletehearted")
	public String deletehearted(String heartid,String nickname,Model model,RedirectAttributes attr)
	{
		heartedservice.deletehearted(heartid);
		attr.addAttribute("nickname",nickname);
		return "redirect:hearted.action";
	}
	
	@RequestMapping("deleteheartedIninfo")
	public String deleteheartedIninfo(String heartid,String fid,Model model,RedirectAttributes attr)
	{
		heartedservice.deletehearted(heartid);
		attr.addAttribute("id",fid);
		return "redirect:flowerdetail.action";
	}
}
