package flowershop.pojo;

import java.math.BigDecimal;

public class FlowerInfo extends FlowerMakings{

	private String fid; 
    private String fname;
    private String fmeaning;
    private BigDecimal SalePrice;
    private String fimage;
    private int SaleQuantity;
    private int Quantity;
    private String suitcondition;
    private String color;
    private String isornotheart;
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFmeaning() {
		return fmeaning;
	}
	public void setFmeaning(String fmeaning) {
		this.fmeaning = fmeaning;
	}
	public BigDecimal getSalePrice() {
		return SalePrice;
	}
	public void setSalePrice(BigDecimal salePrice) {
		SalePrice = salePrice;
	}
	
	public String getFimage() {
		return fimage;
	}
	public void setFimage(String fimage) {
		this.fimage = fimage;
	}
	public int getSaleQuantity() {
		return SaleQuantity;
	}
	public void setSaleQuantity(int saleQuantity) {
		SaleQuantity = saleQuantity;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public String getSuitcondition() {
		return suitcondition;
	}
	public void setSuitcondition(String suitcondition) {
		this.suitcondition = suitcondition;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getIsornotheart() {
		return isornotheart;
	}
	public void setIsornotheart(String isornotheart) {
		this.isornotheart = isornotheart;
	}
	
}
