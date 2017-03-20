package models;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class joinDao {
	@Autowired
	SqlSessionFactory factory;
	
	
	// 회원 가입
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
	
}















