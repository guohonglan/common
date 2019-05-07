package flowershop.dao;

import java.util.List;

import flowershop.pojo.OrderDetails;

public interface OrderDetailsMapper {

	void generateorderdetails(OrderDetails orderDetails);
	List<OrderDetails> getorderdetailslist(String orderId);
	void modiscommented(OrderDetails orderDetails);
	void deleteorderdetail(OrderDetails orderDetails);
}
