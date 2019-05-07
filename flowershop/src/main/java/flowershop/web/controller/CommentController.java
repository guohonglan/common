package flowershop.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import flowershop.interfaces.Commentservice;
import flowershop.pojo.Mycomment;
import flowershop.pojo.UserInfo;

@Controller
public class CommentController {

	@Autowired
	private Commentservice commentservice;
	
	@RequestMapping("mycomment")
	public String mycomment(String nickname,Model model)
	{
		UserInfo u=new UserInfo();
		u.setNickName(nickname);
		List<Mycomment> list=commentservice.getmycomment(u);
		model.addAttribute("list",list);
		return "MyComment";
	}
}
