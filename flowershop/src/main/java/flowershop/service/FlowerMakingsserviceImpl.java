package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.FlowerMakingsMapper;
import flowershop.interfaces.FlowerMakingsservice;
import flowershop.pojo.FlowerMakings;

@Transactional
@Service
public class FlowerMakingsserviceImpl implements FlowerMakingsservice {

	@Autowired
	private FlowerMakingsMapper flowerMakingsMapper;
	@Override
	public List<FlowerMakings> getallflowermakings(FlowerMakings flowerMakings) {
		
		return flowerMakingsMapper.getallflowermakings(flowerMakings);
	}
	@Override
	public void addfm(FlowerMakings flowerMakings) {
		
		flowerMakingsMapper.addfm(flowerMakings);
	}
	@Override
	public void modifyfm(FlowerMakings flowerMakings) {
		
		flowerMakingsMapper.modifyfm(flowerMakings);
	}
	@Override
	public void deletefm(String fmid) {
		
		flowerMakingsMapper.deletefm(fmid);
	}
	@Override
	public FlowerMakings getoneflowermakings(String fmid) {
		
		return flowerMakingsMapper.getoneflowermakings(fmid);
	}
}
