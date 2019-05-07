package flowershop.dao;

import java.util.List;

import flowershop.pojo.FlowerMakings;

public interface FlowerMakingsMapper {

	List<FlowerMakings> getallflowermakings(FlowerMakings flowerMakings);
	void addfm(FlowerMakings flowerMakings);
	void modifyfm(FlowerMakings flowerMakings);
	void deletefm(String fmid);
	FlowerMakings getoneflowermakings(String fmid);
}
