package models;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class loginDao {
	@Autowired
	SqlSessionFactory factory;
	
		public Map login(Map map){
			Map id = new HashMap();
			SqlSession session =  factory.openSession();
			
			try{
				id = session.selectOne("login.find", map);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return id;
		}
	
}
