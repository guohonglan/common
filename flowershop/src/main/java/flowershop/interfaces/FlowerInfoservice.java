package flowershop.interfaces;

import java.util.List;

import flowershop.pojo.FlowerInfo;

public interface FlowerInfoservice {

	List<FlowerInfo> getflowerlist(FlowerInfo flowerInfo);
	List<FlowerInfo> gettopfiveflower();
	FlowerInfo getflowerdetail(FlowerInfo flowerInfo);
	void addsalequantity(FlowerInfo flowerInfo);
	void addflower(FlowerInfo flowerInfo);
	void deleteflower(String fid);
	void updateflower(FlowerInfo flowerInfo);
	List<FlowerInfo> gettop8flowerlist(FlowerInfo flowerInfo);
}
