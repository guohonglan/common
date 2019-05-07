package flowershop.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import flowershop.common.CommonUtils;
import flowershop.interfaces.SlideShowservice;
import flowershop.pojo.SlideShow;

@Controller
public class SlideShowController {

	@Autowired
	private SlideShowservice slideShowservice;
	
	@RequestMapping("home")
	public String tohome()
	{
		return "Backstage/home";
	}
	@RequestMapping(value="addslideshow",produces= {"text/html;charset=utf-8;","application/json;"})
	@ResponseBody
	public String addslideshow(MultipartFile picture) throws IllegalStateException, IOException
	{
		Common com=new Common();
		String siname=com.saveimage(picture, "\\SlideShow\\");
		SlideShow slideShow=new SlideShow();
		slideShow.setSlideId(CommonUtils.ReturnId(4));
		slideShow.setSlideImage("Image/SlideShow/"+siname);
		slideShowservice.addslideshow(slideShow);		
		return "图片上传成功！";
	}
	
	@RequestMapping("getallslideshow")
	public String getallslideshow(Model model)
	{
		List<SlideShow> list=slideShowservice.getallslideshow();
		model.addAttribute("slidelist", list);
		model.addAttribute("tabid", 2);	
		return "Backstage/home";
	}
	
	@RequestMapping("deleteslideshow")
	public String deleteslideshow(String sids[])
	{
		if(sids!=null)
		{
			for(String id:sids)
			{
				//删除磁盘图片
				String path=slideShowservice.findoneslideshow(id);
				Common com=new Common();
				com.deleteimage(path);
				
				//删除数据库信息
				slideShowservice.deleteslideshow(id);
			}
		}
		
		return "redirect:getallslideshow";
	}

}
