package models;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class mydeleteDao {
	
		@Autowired
		SqlSessionFactory factory;
		
		public int deletepassfind(Map map){
			int r = 0;
			SqlSession session = factory.openSession();
			try{
				r = session.selectOne("delete.passfind", map);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		public int mydelete(Map map){
			int r = 0;
			SqlSession session = factory.openSession();
			try{
				r = session.delete("delete.mydelete", map);
				if(r == 1){
					session.commit();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		public int mydeleteRoom(String Eemail){
			int r = 0;
			SqlSession session = factory.openSession();
			try{
				r = session.delete("delete.roomdelete", Eemail);
				if(r==1){
					session.commit();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
}














