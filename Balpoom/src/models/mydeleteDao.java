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
}














