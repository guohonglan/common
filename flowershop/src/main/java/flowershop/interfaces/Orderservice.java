package flowershop.interfaces;

import java.util.List;

import flowershop.pojo.Order;
import flowershop.pojo.UserInfo;

public interface Orderservice {

	void generateorder(Order order);
	List<Order> getorderlist(String nickname);
	Order getorderdetail(String orderId);
	void modstatus(Order order);
	void updatenickname(UserInfo userInfo);
	void deleteorder(String orderId);
}
