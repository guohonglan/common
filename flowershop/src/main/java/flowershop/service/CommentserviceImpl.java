package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flowershop.dao.CommentMapper;
import flowershop.interfaces.Commentservice;
import flowershop.pojo.Comment;
import flowershop.pojo.FlowerInfo;
import flowershop.pojo.Mycomment;
import flowershop.pojo.UserInfo;

@Transactional
@Service
public class CommentserviceImpl implements Commentservice {

	@Autowired
	private CommentMapper commentMapper;
	@Override
	public List<Comment> getflowercomment(FlowerInfo flowerInfo) {
		
		return commentMapper.getflowercomment(flowerInfo);
	}
	@Override
	public void updatenickname(UserInfo userInfo) {
		
		commentMapper.updatenickname(userInfo);
	}
	@Override
	public void writecomment(Comment comment) {
		
		commentMapper.writecomment(comment);
	}
	@Override
	public List<Mycomment> getmycomment(UserInfo userinfo) {
		
		return commentMapper.getmycomment(userinfo);
	}

}
