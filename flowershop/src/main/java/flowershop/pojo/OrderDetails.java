package flowershop.pojo;

import java.math.BigDecimal;

public class OrderDetails  extends FlowerInfo{

	private String orderId;
	private int Quantity;
	private String isCommented;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public String getIsCommented() {
		return isCommented;
	}
	public void setIsCommented(String isCommented) {
		this.isCommented = isCommented;
	}
	
		
}
