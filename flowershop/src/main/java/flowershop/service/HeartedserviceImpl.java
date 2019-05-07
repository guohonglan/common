package flowershop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import flowershop.dao.HeartedMapper;
import flowershop.interfaces.Heartedservice;
import flowershop.pojo.Hearted;

@Service
public class HeartedserviceImpl implements Heartedservice{

	@Autowired
	private HeartedMapper heartedMapper;
	@Override
	public void addhearted(Hearted hearted) {
		
		heartedMapper.addhearted(hearted);
	}

	@Override
	public List<Hearted> getheartedlist(String NickName) {
		
		return heartedMapper.getheartedlist(NickName);
	}

	@Override
	public void deletehearted(String heartid) {
		// TODO Auto-generated method stub
		heartedMapper.deletehearted(heartid);
	}

}
