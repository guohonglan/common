package flowershop.pojo;

import java.math.BigDecimal;

public class Mycomment extends Comment{
    private String fname;
    private BigDecimal SalePrice;
    private String fimage;
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
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

}
