package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.FlowerInfoMapper;
import flowershop.interfaces.FlowerInfoservice;
import flowershop.pojo.FlowerInfo;

@Transactional
@Service
public class FlowerInfoserviceImpl implements FlowerInfoservice {

	@Autowired
	private FlowerInfoMapper flowerInfoMapper;
	
	@Override
	public List<FlowerInfo> getflowerlist(FlowerInfo flowerInfo) {
		
		return flowerInfoMapper.getflowerlist(flowerInfo);
	}

	@Override
	public List<FlowerInfo> gettopfiveflower() {
		
		return flowerInfoMapper.gettopfiveflower();
	}

	@Override
	public FlowerInfo getflowerdetail(FlowerInfo flowerInfo) {
		
		return flowerInfoMapper.getflowerdetail(flowerInfo);
	}

	@Override
	public void addsalequantity(FlowerInfo flowerInfo) {
		
		flowerInfoMapper.addsalequantity(flowerInfo);
	}

	@Override
	public void addflower(FlowerInfo flowerInfo) {
		
		flowerInfoMapper.addflower(flowerInfo);
	}

	@Override
	public void updateflower(FlowerInfo flowerInfo) {
		flowerInfoMapper.updateflower(flowerInfo);
		
	}

	@Override
	public void deleteflower(String fid) {
		
		flowerInfoMapper.deleteflower(fid);
	}

	@Override
	public List<FlowerInfo> gettop8flowerlist(FlowerInfo flowerInfo) {
		
		return flowerInfoMapper.gettop8flowerlist(flowerInfo);
	}

}
