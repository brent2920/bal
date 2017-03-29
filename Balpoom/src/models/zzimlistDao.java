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
public class zzimlistDao {
	@Autowired
	SqlSessionFactory factory;
	
	// room �뿉 �엳�뒗 留ㅻЪ�젙蹂� 濡� �뜲�씠�꽣 遺덈윭�삤湲�
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
		// 李쒕━�뒪�듃 �벑濡�
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
		
		// 李쒕━�뒪�듃 �궘�젣
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
		
		
		// �깉濡� 怨좎묠 �썑 李� 踰꾪듉 �솢�꽦�솕
		
		public int zzimActivation(Map map){
			int r = 0;
			SqlSession session = factory.openSession();
			try{
				r = session.selectOne("zzim.activation", map);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		// 李� 由ъ뒪�듃
		public List zzimlist(String email){
			List list = new ArrayList();
			SqlSession session = factory.openSession();
			Map map = new HashMap();
			map.put("email", email);
			try{
				list = session.selectList("zzim.list", map);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return list;
		}
		
		// room 怨� zzimlist 瑜� 鍮꾧탳�빐�꽌 room �뿉 �뾾�뒗 �뜲�씠�꽣 �궘�젣 �븯湲�
		public int zzimlistdel(Map map){
			int r= 0;
			SqlSession session = factory.openSession();
			try{
				r = session.delete("zzim.zzimdel",map);
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















