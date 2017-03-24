package models;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CLOBDao {
	@Autowired
	SqlSessionFactory factory;
	
	public Map test(Map map){
		Map map1 = new HashMap<>();
		SqlSession session = factory.openSession();
		try{
			map1 = session.selectOne("clob.test01", map);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return map1;
		
	}
}
