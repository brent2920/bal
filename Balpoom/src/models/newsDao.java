package models;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class newsDao {
	
	@Autowired
	SqlSessionFactory factory;
	int r =0;
	public int news_insert(Map map){
		SqlSession session = factory.openSession();
		try{
			r= session.insert("news.insert_news",map);
			if(r==1)
			session.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
			
		}
		return r;
		
	}
	public  List<Map> get_news(){
		SqlSession session = factory.openSession();
		List<Map> nlist =  null;
		
		try{
			nlist = new ArrayList<>();
			nlist  = session.selectList("news.get_news");
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return nlist;
	}
	

}
