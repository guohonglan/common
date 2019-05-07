package flowershop.pojo;

import java.util.Date;

import flowershop.common.CommonUtils;

public class Comment extends UserInfo{

	 private String CommentId;
	 private String fid;  
	 private String CommentContents;
     private Date CommentDate;
	public String getCommentId() {
		return CommentId;
	}
	public void setCommentId(String commentId) {
		CommentId = commentId;
	}
	
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getCommentContents() {
		return CommentContents;
	}
	public void setCommentContents(String commentContents) {
		CommentContents = commentContents;
	}	
    
	public String getCommentDate() {
		return CommonUtils.TransferDateToString(CommentDate,"yyyy-MM-dd HH:mm:ss");
	}
	public void setCommentDate(Date commentDate) {
		CommentDate = commentDate;
	}
	public Comment()
    {
    	super();
    	this.CommentId=CommonUtils.ReturnId(9);
    	this.CommentDate =new Date();    			
    }
}
