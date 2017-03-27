package models;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class zzimlistDao {
	@Autowired
	SqlSessionFactory factory;
	
	// room 에 있는 매물정보 로 데이터 불러오기
		public Map zzimfind(int num){
			Map map = new HashMap();
			SqlSession session = factory.openSession();
			try{
				map =session.selectOne("zzim.find", num);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return map;
		}
		// 찜리스트 등록
		public int zzimadd(Map map){
			int r = 0;
			SqlSession session = factory.openSession();
			try{
				r = session.insert("zzim.add",map);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		// 찜리스트 삭제
		public int zzimdel(Map map){
			SqlSession session = factory.openSession();
			int r = 0;
			try{
				r = session.delete("zzim.del",map);
				if(r == 1)
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
}















