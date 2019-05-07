package flowershop.pojo;

import java.util.List;

import com.github.pagehelper.PageInfo;

public class CommonVo {

	private List<FlowerInfo> f1;
	private List<FlowerInfo> f2;
	private List<FlowerInfo> f3;
	private List<FlowerMakings> fm;
	private List<SlideShow> slide;
	private List<Comment> comment;
	private int temp;
	

	public List<FlowerInfo> getF1() {
		return f1;
	}
	public void setF1(List<FlowerInfo> f1) {
		this.f1 = f1;
	}
	public List<FlowerInfo> getF2() {
		return f2;
	}
	public void setF2(List<FlowerInfo> f2) {
		this.f2 = f2;
	}
	
	public List<FlowerInfo> getF3() {
		return f3;
	}
	public void setF3(List<FlowerInfo> f3) {
		this.f3 = f3;
	}
	public List<FlowerMakings> getFm() {
		return fm;
	}
	public void setFm(List<FlowerMakings> fm) {
		this.fm = fm;
	}
	public List<SlideShow> getSlide() {
		return slide;
	}
	public void setSlide(List<SlideShow> slide) {
		this.slide = slide;
	}
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	
}
