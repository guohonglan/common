package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.SlideShowMapper;
import flowershop.interfaces.SlideShowservice;
import flowershop.pojo.SlideShow;

@Transactional
@Service
public class SlideShowserviceImpl implements SlideShowservice {

	@Autowired
	private SlideShowMapper slideShowMapper;
	
	@Override
	public List<SlideShow> getallslideshow() {
		
		return slideShowMapper.getallslideshow();
	}

	@Override
	public void addslideshow(SlideShow slideShow) {
		
		slideShowMapper.addslideshow(slideShow);
	}

	@Override
	public void deleteslideshow(String SlideId) {
		
		slideShowMapper.deleteslideshow(SlideId);
	}

	@Override
	public String findoneslideshow(String SlideId) {
		
		return slideShowMapper.findoneslideshow(SlideId);
	}

}
