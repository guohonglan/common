package flowershop.interfaces;

import java.util.List;

import flowershop.pojo.SlideShow;

public interface SlideShowservice {

	List<SlideShow> getallslideshow();
	void addslideshow(SlideShow slideShow);
	void deleteslideshow(String SlideId);
	String findoneslideshow(String SlideId);
}
