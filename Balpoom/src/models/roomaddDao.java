package models;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class roomaddDao {
	@Autowired
	SqlSessionFactory factory;
	
		public int roomadd(Map map){
			SqlSession session = factory.openSession();
			int r = 0;
			try{
				r =session.insert("roomadd.insertList", map);
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
