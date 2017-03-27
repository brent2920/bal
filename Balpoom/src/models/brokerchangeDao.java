package models;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class brokerchangeDao {
	
	@Autowired
	SqlSessionFactory factory;
	
	public Map brokerList(String brokerid){
		
		
		Map map = new HashMap<>();
		map.put("brokerid", brokerid);
		SqlSession session = factory.openSession();
		try{
			map = session.selectOne("agent.list", map);
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			session.close();
		}
		return map;
	}
	
	
	public int brokerchange(Map map){
		int r = 0;
		SqlSession session = factory.openSession();
		System.out.println(map.toString());
		try{
		r= session.update("agent.update",map);
			if(r==1)
				session.commit();
		}catch(Exception e){
			session.rollback();
		}finally{
			session.close();
		}
		
		return r;
	}
	
}
