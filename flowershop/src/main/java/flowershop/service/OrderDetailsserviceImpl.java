package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.OrderDetailsMapper;
import flowershop.interfaces.OrderDetailsservice;
import flowershop.pojo.OrderDetails;

@Transactional
@Service
public class OrderDetailsserviceImpl implements OrderDetailsservice{

	@Autowired
	private OrderDetailsMapper orderDetailsMapper;
	@Override
	public void generateorderdetails(OrderDetails orderDetails) {
	 
		orderDetailsMapper.generateorderdetails(orderDetails);
	}
	@Override
	public List<OrderDetails> getorderdetailslist(String orderId) {
		
		return orderDetailsMapper.getorderdetailslist(orderId);
	}
	@Override
	public void modiscommented(OrderDetails orderDetails) {
		
		orderDetailsMapper.modiscommented(orderDetails);
	}
	@Override
	public void deleteorderdetail(OrderDetails orderDetails) {
		
		orderDetailsMapper.deleteorderdetail(orderDetails);
	}

}
