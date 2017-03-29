package models;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class brokerpageDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List brokerlist(Map map){
		List list = new ArrayList();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("brokerpage.find",map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public int complate(Map map){
		int r = 0;
		SqlSession session = factory.openSession();
		try{
			r = session.delete("brokerpage.complate",map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}
	
}
