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
public class commentDao {
	@Autowired
	SqlSessionFactory factory;
	
	// 댓글 추가
		public int comment(Map map){
			int r = 0;
			SqlSession session = factory.openSession();
			
			try{
				r = session.insert("rcomment.comment", map);
				if (r == 1)
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		
		// num = 매물 번호 / 해당 매물번호에 등록된 댓글 목록
		public int commentcount(int num){
			int r = 0;
			SqlSession session = factory.openSession();
			try{				
				r = session.selectOne("rcomment.commentcount", num);
				System.out.println("댓글 전체 갯수 ==> "+r);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return r;
		}
		
		// 페이징
	public List paging(int start, int end, int num) {
		Map map = new HashMap<String, Integer>();
		List list = new ArrayList<>();
		map.put("start", start);
		map.put("end", end);
		map.put("roomnumber", num);
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("page.Cpage", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}
	
	public int Delcomment(int num, String email){
		int r= 0;
		SqlSession session = factory.openSession();
		Map map = new HashMap();
		map.put("num", num);
		map.put("email", email);
		try{
			r = session.delete("rcomment.delcomment", map);
			if(r == 1)
			session.commit();
		}catch(Exception  e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return r;
	}
	
	public int Byecomment(Map map){
		int r = 0;
		SqlSession session = factory.openSession();
		try{
			r = session.delete("rcomment.byecomment", map);
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









		










		












