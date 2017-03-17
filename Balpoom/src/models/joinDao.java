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
	
}
