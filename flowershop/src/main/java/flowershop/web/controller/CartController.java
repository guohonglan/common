package flowershop.web.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import flowershop.common.CommonUtils;
import flowershop.interfaces.Cartservice;
import flowershop.interfaces.FlowerInfoservice;
import flowershop.pojo.Cart;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.UserInfo;

@Controller
public class CartController {

	@Autowired
	private Cartservice cartservice;
	@Autowired
	private FlowerInfoservice flowerInfoservice;
	
	@RequestMapping("addcart")
	public String addcart(String NickName,String fid,Model model) throws Exception
	{
		Cart cart=new Cart();
		cart.setNickName(NickName);
		cart.setFid(fid);
		int sigal=cartservice.confirmhaveornot(cart);
		if(sigal>0)
		{
			int fcount=cartservice.getflowercount(cart)+1;
			cart.setQuantity(fcount);
			try {				
				cartservice.updatecart(cart);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
		}
		else
		{
			cart.setQuantity(1);		
			cartservice.addcart(cart);					
		}		
		return cart(NickName,model);
	}
	
	@RequestMapping("cart")
	public String cart(String NickName,Model model)
	{
		Cart cart=new Cart();
		cart.setNickName(NickName);
	    Common common=new Common();
	    common.getcart(cartservice, cart, model);
		return "cart";				
	}
	
	@RequestMapping("deletecart")
	public String deletecart(String NickName,String fid,Model model)
	{
		Cart cart=new Cart();
		cart.setFid(fid);
		cart.setNickName(NickName);
		//删除购物车信息
		cartservice.deletecart(cart);
		//返回新的购物车信息
		Common common=new Common();
	    common.getcart(cartservice, cart, model);
		return "cart";
	}
	
	@RequestMapping("confirmshop")
	public String confirmshop(String[] fids,String msg,Model model,HttpSession session)
	{
		System.out.println("1111111111");
		//从Session中获取要购买的商品的信息					
		if(session.getAttribute("flist")!=null)
		{
			System.out.println("222222222");
			List<FlowerInfo> seflist=(List<FlowerInfo>)session.getAttribute("flist");
			double sesumofmoney=(double)session.getAttribute("sumofmoney");
			model.addAttribute("msg",msg);
			model.addAttribute("flist", seflist);	
			model.addAttribute("sumofmoney", sesumofmoney);			
			return "confirmShop";
		}
		else if(session.getAttribute("cartlist")!=null)
		{
			System.out.println("3333333333");
			List<Cart> secartlist=(List<Cart>)session.getAttribute("cartlist");
			double sesumofmoney=(double)session.getAttribute("sumofmoney");
			model.addAttribute("msg",msg);
			model.addAttribute("cartlist", secartlist);
			model.addAttribute("sumofmoney", sesumofmoney);
			return "confirmShop";
		}
		else
		{
			System.out.println("44444444444");
			List<FlowerInfo> flist=new ArrayList<>();
			List<Cart> cartlist=new ArrayList<>();
			
			UserInfo userinfo=(UserInfo)session.getAttribute("currentuser");
			//总价
			double sumofmoney=0;
			//获取购买的花的信息
			if(fids!=null)
			{
				//直接购买
				if(fids.length==1)
				{				
					FlowerInfo flowerInfo=new FlowerInfo();
					flowerInfo.setFid(fids[0]);
					FlowerInfo f=flowerInfoservice.getflowerdetail(flowerInfo);
					f.setQuantity(1);
					sumofmoney=f.getQuantity()*f.getSalePrice().doubleValue();
					flist.add(f);			
				}
				//从购物车中购买
				else
				{			
					Cart cart;
					for(String id:fids)
					{
						cart=new Cart();
						cart.setFid(id);
						cart.setNickName(userinfo.getNickName());
						Cart c=cartservice.getconfirmshop(cart);
						sumofmoney+=c.getQuantity()*c.getSalePrice().doubleValue();
						cartlist.add(c);
					}				
				}
				model.addAttribute("cartlist", cartlist);
				//存入session中，生成订单时可以从session中获取信息
				session.setAttribute("cartlist", cartlist);	
				
				model.addAttribute("flist", flist);				
				session.setAttribute("flist", flist);
				
				model.addAttribute("sumofmoney", sumofmoney);
				session.setAttribute("sumofmoney", sumofmoney);
				return "confirmShop";
			}
			//如果没有选择商品
			else
			{
				model.addAttribute("msg","您未选择任何商品！");
				Cart cart2=new Cart();
				cart2.setNickName(userinfo.getNickName());
			    Common common=new Common();
			    common.getcart(cartservice, cart2, model);
				return "cart";
			}			
		}		
	}	
}
