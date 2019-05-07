package flowershop.interfaces;

import java.util.List;

import flowershop.pojo.Cart;
import flowershop.pojo.UserInfo;

public interface Cartservice {

	void addcart(Cart cart) throws Exception;
	int getflowercount(Cart cart);
	int confirmhaveornot(Cart cart);
	void updatecart(Cart cart);
	void deletecart(Cart cart);
	List<Cart> getusercart(Cart cart);
	Cart getconfirmshop(Cart cart);
	void updatenickname(UserInfo userInfo);
}
