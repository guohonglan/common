package flowershop.web.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import flowershop.common.CommonUtils;
import flowershop.interfaces.FlowerMakingsservice;
import flowershop.pojo.FlowerMakings;

@Controller
public class FlowerMakingsController {

	@Autowired
	private FlowerMakingsservice flowerMakingsservice;
	
	@RequestMapping("toadddfm")
	public String toadddfm(String tabid,Model model)
	{
		model.addAttribute("tabid", 3);
        model.addAttribute("temp3",0);
		return "Backstage/home";
	}
	@RequestMapping(value="addfm",method=RequestMethod.POST)
	public String addfm(@RequestParam("image")MultipartFile[] file,String fmname,Model model) throws IllegalStateException, IOException
	{
		System.out.println("123456456");
		System.out.println(fmname);
		System.out.println(file[0].getOriginalFilename());
		System.out.println(file[1].getOriginalFilename());
		FlowerMakings fm=new FlowerMakings();
		fm.setFmid(CommonUtils.ReturnId(4));
		fm.setFmName(fmname);
				
		//保存图片
		Common com=new Common();
		String fmimg=com.saveimage(file[0], "\\FlowerMakings\\");
		
		//保存缩略图
		String fmbitimg=com.saveimage(file[1], "\\FlowerMakings\\");
		
		fm.setFmImage("Image/FlowerMakings/"+fmimg);
		fm.setFmImageBitmap("Image/FlowerMakings/"+fmbitimg);
		flowerMakingsservice.addfm(fm);	
		model.addAttribute("tabid",3);
		model.addAttribute("temp3",0);
		return "Backstage/home";
	}
	
	@RequestMapping("getallfmlist")
	public String getallfmlist(String tabid,Model model)
	{
		List<FlowerMakings> fmlist=flowerMakingsservice.getallflowermakings(new FlowerMakings());
		model.addAttribute("fmlist",fmlist);
		model.addAttribute("tabid", 4);
		if(Integer.parseInt(tabid)==5)
		{
			model.addAttribute("sigal", 1);
		}
		
		else
		{
			model.addAttribute("sigal", 0);
		}
		return "Backstage/home";
	}
	
	@RequestMapping("deletefm")
	public String deletefm(String fmid,RedirectAttributes attr)
	{
		//删除原始图片
		FlowerMakings flowerMakings=new FlowerMakings();
		flowerMakings.setFmid(fmid);
		List<FlowerMakings> fmlist=flowerMakingsservice.getallflowermakings(flowerMakings);

		Common com=new Common();
		for(FlowerMakings fm:fmlist)
		{
			//删除图片
			com.deleteimage(fm.getFmImage());
			//删除缩略图
			com.deleteimage(fm.getFmImageBitmap());
		}
		flowerMakingsservice.deletefm(fmid);
		attr.addAttribute("tabid",5);
		return "redirect:getallfmlist";
	}
	
	@RequestMapping("modifyfm")
	public String modifyfm(String fmid,Model model)
	{
		FlowerMakings fmlist=flowerMakingsservice.getoneflowermakings(fmid);
		model.addAttribute("fm", fmlist);
		model.addAttribute("tabid",3);
		model.addAttribute("temp3",1);
		return "Backstage/home";
	}
	
	@RequestMapping("suremodifyfm")
	public String suremodifyfm(@RequestParam("image")MultipartFile[] file,String fmid,String fmname,RedirectAttributes attr,String orfmimg,String orfmbitimg) throws IllegalStateException, IOException
	{
		if(fmname==null)
		{
			return "redirect:modifyfm";
		}
		else
		{
			Common com=new Common();
			//保存修改图片		
			FlowerMakings fm=new FlowerMakings();
			fm.setFmid(fmid);
			fm.setFmName(fmname);
			
			if(file[0].isEmpty())
			{
				fm.setFmImage(orfmimg);
			}
			else if(file[1].isEmpty())
			{
				fm.setFmImage(orfmbitimg);
			}
			else if(!file[0].isEmpty())
			{
				String fmimg=com.saveimage(file[0], "\\FlowerMakings\\");												
				fm.setFmImage("Image/FlowerMakings/"+fmimg);
				//删除图片
			    com.deleteimage(orfmimg);				
			}
			else if(!file[1].isEmpty())
			{
				String fmbitimg=com.saveimage(file[1], "\\FlowerMakings\\");
				fm.setFmImageBitmap("Image/FlowerMakings/"+fmbitimg);
				//删除缩略图
			    com.deleteimage(orfmbitimg);
			}
			else {}			
			flowerMakingsservice.modifyfm(fm);																    					    
		    attr.addAttribute("tabid",4);
			return "redirect:getallfmlist";
		}						
	}

}
