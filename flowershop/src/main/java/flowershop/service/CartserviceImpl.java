package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.CartMapper;
import flowershop.exceptionresolver.MyException;
import flowershop.interfaces.Cartservice;
import flowershop.pojo.Cart;
import flowershop.pojo.UserInfo;

@Transactional
@Service
public class CartserviceImpl implements Cartservice {

	@Autowired
	private CartMapper cartMapper;
	@Override
	public void addcart(Cart cart) throws Exception{           
		    cartMapper.addcart(cart);					 
	}

	@Override
	public int getflowercount(Cart cart) {
		
		return cartMapper.getflowercount(cart);
	}

	@Override
	public int confirmhaveornot(Cart cart) {
		
		return cartMapper.confirmhaveornot(cart);
	}

	@Override
	public void updatecart(Cart cart) {
		cartMapper.updatecart(cart);
	}

	@Override
	public void deletecart(Cart cart) {
		cartMapper.deletecart(cart);
	}

	@Override
	public List<Cart> getusercart(Cart cart) {
		
		return cartMapper.getusercart(cart);
	}

	@Override
	public Cart getconfirmshop(Cart cart) {
	
		return cartMapper.getconfirmshop(cart);
	}

	@Override
	public void updatenickname(UserInfo userInfo) {
		
		cartMapper.updatenickname(userInfo);
	}

}
