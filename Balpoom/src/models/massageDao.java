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
public class massageDao {
	@Autowired
	SqlSessionFactory factory;
	
	public int massageadd(Map map){
		SqlSession session = factory.openSession();
		int r = 0;
		try{
			r =session.insert("massage.add",map);
			if(r == 1)
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
	}
	
	public List msgfind(Map map){
		List list = new ArrayList();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("massage.msgfind",map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
		
		}
	
		public int msadel(Map map){
			int r= 0;
			SqlSession session = factory.openSession();
			try{
				r = session.delete("massage.msgdel",map);
				if( r == 1)
					session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			
			return r;
		}
		
		public int msapaging(Map map){
			int r= 0;
			SqlSession session = factory.openSession();
			try{
				r = session.selectOne("massage.msgpaging",map);
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			
			return r;
		}
		
		
	}










