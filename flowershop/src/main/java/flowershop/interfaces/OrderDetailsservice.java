package flowershop.interfaces;

import java.util.List;

import flowershop.pojo.OrderDetails;

public interface OrderDetailsservice {

	void generateorderdetails(OrderDetails orderDetails);
	List<OrderDetails> getorderdetailslist(String orderId);
	void modiscommented(OrderDetails orderDetails);
	void deleteorderdetail(OrderDetails orderDetails);
}
