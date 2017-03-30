package models;

import java.util.HashMap;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class joinDao {
	@Autowired
	SqlSessionFactory factory;
	
	
	// ȸ�� ����
		public int join(Map map){
			SqlSession session = factory.openSession();
			int r = 0;
			try{
				r = session.insert("join.add",map);
				if(r==1)
					session.commit();					
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
			
			
		}
		
		
//		public int idajax(String id){
//			SqlSession session = factory.openSession();
//			int r = 0;
//			try{
//				r = session.insert("join.idajax",id);
//				if(r==1)
//					session.commit();					
//			}catch(Exception e){
//				e.printStackTrace();
//			}finally{
//				session.close();
//			}
//			return r;
//		}
		
		
		public boolean emailajax(String email){
			SqlSession session = factory.openSession();
			boolean r = false;
			try{
				r = session.selectOne("join.emailajax",email);
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		//=============중개사ajax===============================================
		public int brokerajax(String email){
			Map map = new HashMap<>();
			map.put("id", email);
		
			SqlSession session = factory.openSession();
			int r = 0;
			try{
			r = session.selectOne("join.brokerjoinajax",map);
		
				System.out.println(map.toString());
				
				System.out.println(r);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
	
}















