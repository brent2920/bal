package models;


import java.util.HashMap;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class latelyDao {
	
	@Autowired
	SqlSessionFactory factory;
	
	public Map getLatelyList(int regNum){
		
		Map<String, Object> map = new HashMap<>();
		SqlSession session = factory.openSession();
		try{
			map = session.selectOne("room.getRoomInfo",regNum);
						
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return map;
	}

}
