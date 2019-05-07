package flowershop.dao;

import java.util.List;

import flowershop.pojo.Comment;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.Mycomment;
import flowershop.pojo.UserInfo;

public interface CommentMapper {

	List<Comment> getflowercomment(FlowerInfo flowerInfo);
	void updatenickname(UserInfo userInfo);
	void writecomment(Comment comment);
	List<Mycomment> getmycomment(UserInfo userinfo);
}
