package models;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class alterDao {
	@Autowired
	SqlSessionFactory factory;
	
	public Map agentInfo(Map map){
		Map agentmap = new HashMap<>();
		SqlSession session = factory.openSession();
		
		try{
		agentmap = session.selectOne("alter.agent",map);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return agentmap;
	}
	public Map personInfo(Map map){
		SqlSession session = factory.openSession();
		Map personmap = new HashMap<>();
		
		try{
			personmap = session.selectOne("alter.person",map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return personmap;
	}
	
}
