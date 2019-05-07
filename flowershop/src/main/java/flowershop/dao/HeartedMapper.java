package flowershop.dao;

import java.util.List;

import flowershop.pojo.Hearted;

public interface HeartedMapper {

	public void addhearted(Hearted hearted);
	public List<Hearted> getheartedlist(String NickName);
	public void deletehearted(String heartid);
}
