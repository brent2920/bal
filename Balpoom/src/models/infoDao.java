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
}











