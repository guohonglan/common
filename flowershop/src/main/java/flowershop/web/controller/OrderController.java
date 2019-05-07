package flowershop.web.controller;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import flowershop.interfaces.Cartservice;
import flowershop.interfaces.Commentservice;
import flowershop.interfaces.FlowerInfoservice;
import flowershop.interfaces.OrderDetailsservice;
import flowershop.interfaces.Orderservice;
import flowershop.pojo.Cart;
import flowershop.pojo.Comment;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.Order;
import flowershop.pojo.OrderDetails;
import flowershop.pojo.UserInfo;

@Controller
public class OrderController {

	@Autowired
	private Orderservice orderservice;
	@Autowired
	private OrderDetailsservice orderDetailsservice;
	@Autowired
	private Cartservice cartservice;
	@Autowired
	private FlowerInfoservice flowerInfoservice;
	@Autowired
	private Commentservice commentservice;
	
	//生成订单
	@RequestMapping("addorder")
	public String addorder(String nickname,String consigneename,String consigneetel,String address,String minuteaddress,Model model,HttpSession session,RedirectAttributes attr)
	{
		if(nickname!=""&&consigneename!=""&&consigneetel!=""&&address!=""&&minuteaddress!="") 
		{
			//从Session中获取要购买的商品的信息
			List<Cart> cartlist=(List<Cart>)session.getAttribute("cartlist");
			List<FlowerInfo> flist=(List<FlowerInfo>)session.getAttribute("flist");
			double sumofmoney=(double)session.getAttribute("sumofmoney");
			
			//生成订单
			String consigneeaddress=address+minuteaddress;
			Order order=new Order();
			order.setNickName(nickname);
			order.setConsigneeName(consigneename);
			order.setConsigneeTel(consigneetel);
			order.setConsigneeAddress(consigneeaddress);
			order.setTotalPrice(new BigDecimal(sumofmoney));
			order.setStatus("交易中");		
			
			//从购物车中购买
			if(cartlist.size()>0)
			{
				for(Cart c:cartlist)
				{
					//生成订单详情
					OrderDetails details=new OrderDetails();
					details.setOrderId(order.getOrderId());
					details.setFid(c.getFid());
					details.setQuantity(c.getQuantity());
					details.setSalePrice(c.getSalePrice());
					details.setIsCommented("未评价");
					orderDetailsservice.generateorderdetails(details);
					
					//增加销量
					FlowerInfo flowerinfo=new FlowerInfo();
					flowerinfo.setFid(c.getFid());
					flowerinfo.setSaleQuantity(c.getQuantity());
					flowerInfoservice.addsalequantity(flowerinfo);
					
					//删除购物车
					Cart cart=new Cart();
					cart.setNickName(nickname);
					cart.setFid(c.getFid());
					cartservice.deletecart(cart);
					
					//清除session
					session.removeAttribute("cartlist");
				}
			}
			//直接购买
			else
			{
				for(FlowerInfo f:flist)
				{
					//生成订单详情
					OrderDetails details=new OrderDetails();
					details.setOrderId(order.getOrderId());
					details.setFid(f.getFid());
					details.setQuantity(f.getQuantity());
					details.setSalePrice(f.getSalePrice());
					details.setIsCommented("未评价");
					orderDetailsservice.generateorderdetails(details);
					
					//增加销量
					FlowerInfo flowerinfo=new FlowerInfo();
					flowerinfo.setFid(f.getFid());
					flowerinfo.setSaleQuantity(f.getQuantity());
					flowerInfoservice.addsalequantity(flowerinfo);		
					
					//清除session
					session.removeAttribute("flist");
				}
			}
			//生成订单
			orderservice.generateorder(order);
			return myBuy(model,session);
		}
		else
		{
			attr.addAttribute("msg","请完善信息！");
			return "redirect:confirmshop.action";
		}
		
	}
	
	@RequestMapping("myBuy")
	public String myBuy(Model model,HttpSession session)
	{
		UserInfo userinfo=(UserInfo)session.getAttribute("currentuser");
		//获取用户订单表
		List<Order> orderlist=orderservice.getorderlist(userinfo.getNickName());
		for(Order o:orderlist)
		{
			List<OrderDetails> detailslist=orderDetailsservice.getorderdetailslist(o.getOrderId());
			o.setOrderDetails(detailslist);
			
		}
		model.addAttribute("orderlist", orderlist);
		return "myBuy";
	}
	
	//获取订单详细信息
	@RequestMapping("detail")
	public String orderdetail(String orderId,Model model)
	{
		Order order=orderservice.getorderdetail(orderId);
		List<OrderDetails> details=orderDetailsservice.getorderdetailslist(orderId);
		order.setOrderDetails(details);
		model.addAttribute("orderlist", order);
		return"detail";
	}
	
	//修改收货状态
	@RequestMapping("modifystatus")
	public String modifystatus(String orderId,Model model,HttpSession session)
	{
		//修改收货状态
		Order order=new Order();
		order.setOrderId(orderId);
		order.setStatus("已收货");
		orderservice.modstatus(order);
		
		return myBuy(model, session);
	}
	
	//写评论
	@RequestMapping("writecomment")
	public String writecomment(String nickname,String orderId,String fid,String comment,Model model,RedirectAttributes attr)
	{
		System.out.println(nickname+"==="+fid+"==="+orderId+"==="+comment);
		
		//写评论
		Comment com=new Comment();
		if(comment==null)
		{
			com.setCommentContents("该用户默认给了好评！");
		}
		else
		{
			com.setCommentContents(comment);
		}
		com.setNickName(nickname);
		com.setFid(fid);		
		commentservice.writecomment(com);
		
		//修改评论状态
		OrderDetails details=new OrderDetails();
		details.setFid(fid);
		details.setOrderId(orderId);
		details.setIsCommented("已评价");
		orderDetailsservice.modiscommented(details);		
		attr.addAttribute("nickname",nickname);
		return "redirect:mycomment.action";
	}
}
