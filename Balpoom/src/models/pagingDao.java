package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class pagingDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List paging(int start, int end){
		Map map = new HashMap<String, Integer>();
		List<Map> list = new ArrayList<>();
		map.put("start", start);
		map.put("end", end);
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("page.page",map);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}
}
