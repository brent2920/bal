package models;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class infoDao {
	@Autowired
	SqlSessionFactory factory;
	
	public Map info(String id){
		SqlSession session = factory.openSession();
		Map map = new HashMap();
		
		try{
			map = session.selectOne("info.find", id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return map;
	}
	
	
	public int infochange(Map map){
		SqlSession session = factory.openSession();
		int r = 0;
			
		try{
			r = session.update("info.change",map);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}
	
	public int passcheckAjax (Map map){
		SqlSession session = factory.openSession();
		int r = 0;
		try{
			r = session.selectOne("info.passcheckAjax",map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}
}











