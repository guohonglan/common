package flowershop.pojo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import flowershop.common.CommonUtils;

public class Order {
	private String orderId;
	private String NickName;   
    private Date orderDate;
    private BigDecimal TotalPrice;
    private String ConsigneeName;
    private String ConsigneeTel;
    private String ConsigneeAddress;        
    private String Status;
    private List<OrderDetails> orderDetails;
    
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getOrderDate() {
		return CommonUtils.TransferDateToString(orderDate, "yyyy-MM-dd HH:mm:ss");
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public BigDecimal getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(BigDecimal totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getConsigneeName() {
		return ConsigneeName;
	}
	public void setConsigneeName(String consigneeName) {
		ConsigneeName = consigneeName;
	}
	public String getConsigneeTel() {
		return ConsigneeTel;
	}
	public void setConsigneeTel(String consigneeTel) {
		ConsigneeTel = consigneeTel;
	}
	public String getConsigneeAddress() {
		return ConsigneeAddress;
	}
	public void setConsigneeAddress(String consigneeAddress) {
		ConsigneeAddress = consigneeAddress;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	   
	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	public Order()
	{
		super();
		this.orderDate=new Date();
		this.orderId=CommonUtils.ReturnId(15);
	}
    
    
}
