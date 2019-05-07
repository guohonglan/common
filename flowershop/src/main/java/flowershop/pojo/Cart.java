package flowershop.pojo;

import java.util.Date;

import flowershop.common.CommonUtils;

public class Cart extends FlowerInfo{

	private String NickName;
	private int Quantity;
	private Date CartDate;
	
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}	
	public String getCartDate() {
		return CommonUtils.TransferDateToString(CartDate, "yyyy-MM-dd HH:mm:ss");
	}
	public void setCartDate(Date cartDate) {
		CartDate = cartDate;
	}
	public Cart()
	{
		super();
		this.CartDate=new Date();
	}
}
