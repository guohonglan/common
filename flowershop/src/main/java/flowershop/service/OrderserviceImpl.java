package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.OrderMapper;
import flowershop.interfaces.Orderservice;
import flowershop.pojo.Order;
import flowershop.pojo.UserInfo;

@Transactional
@Service
public class OrderserviceImpl implements Orderservice {

	@Autowired
	private OrderMapper orderMapper;
	@Override
	public void generateorder(Order order) {
		orderMapper.generateorder(order);
	}
	@Override
	public List<Order> getorderlist(String nickname) {
		
		return orderMapper.getorderlist(nickname);
	}
	@Override
	public Order getorderdetail(String orderId) {
		
		return orderMapper.getorderdetail(orderId);
	}
	@Override
	public void modstatus(Order order) {
		
		orderMapper.modstatus(order);
	}
	@Override
	public void updatenickname(UserInfo userInfo) {
		
		orderMapper.updatenickname(userInfo);
	}
	@Override
	public void deleteorder(String orderId) {
		
		orderMapper.deleteorder(orderId);
	}

}
