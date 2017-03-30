package models;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class imgDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List imageDelete(){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("image.list");
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}
	
}
