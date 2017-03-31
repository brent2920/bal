package models;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class imgDao {
	@Autowired
	SqlSessionFactory factory;
	@Autowired
	MongoTemplate template;
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;
	//초기 이미지를 삭제하는 Dao 건드릴 필요가 없다.
	public List imageDelete(){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("image.list");
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}
	//
	
	//회원 탈퇴했을때 방 사진 삭제
	public void imageDelete2(String realpath,String id){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		Map mapid = new HashedMap();
		
		try{
			//delete from picture where sell_num not in (select sell_num from room);
			//room테이블에서는 삭제되었지만 picture에 남아있는 방 번호를 리스트로 뽑아낸다
			mapid.put("id", id);
			
			list = session.selectList("image.list2",mapid);
			
			//리스트를 맵으로 뽑아낸다.
			for(Map map : list){
				String str = map.get("SELL_NUM").toString();
				
				//하나의 방 번호 폴더의 절대 경로를 설정
				File file = new File(realpath+"/"+str);
				
				
				
				//폴더 안에 있는 파일을 배열형태로 받아준다
				File[] files = file.listFiles();
				
				//폴더안에 있는 파일을 삭제한다.
				for(File f :  files){
					boolean b = f.delete();
					
				}
				//폴더를 삭제한다.
				boolean b = file.delete();
			
				
				//몽고에 있는 것도 삭제
				
				int num = Integer.parseInt(str);
				mapid.put("num", num);
				session.delete("image.deleteall",mapid);
				template.remove(new Query(Criteria.where("num").is(str)), "room");
				Cookie[] cookie = req.getCookies();
				if(cookie.length>1){
					for(Cookie c : cookie){
						if(c.getName().equals(str)){
							c.setMaxAge(0);
							resp.addCookie(c);
						}
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
	
	}
	
	//방 하나씩 삭제 했을때
	public void imageDelete3(String realpath,String id,int num){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		Map mapid = new HashedMap();
	
		try{
			//delete from picture where sell_num not in (select sell_num from room);
			//room테이블에서는 삭제되었지만 picture에 남아있는 방 번호를 리스트로 뽑아낸다
			mapid.put("id", id);
			mapid.put("num", num);
			list = session.selectList("image.list",mapid);
			//리스트를 맵으로 뽑아낸다.
			for(Map map : list){
				String str = map.get("SELL_NUM").toString();
				
				//하나의 방 번호 폴더의 절대 경로를 설정
				File file = new File(realpath+"/"+str);
				
				
				
				//폴더 안에 있는 파일을 배열형태로 받아준다
				File[] files = file.listFiles();
				System.out.println(file.getAbsolutePath());
				//폴더안에 있는 파일을 삭제한다.
				for(File f :  files){
					boolean b = f.delete();
					
				}
				//폴더를 삭제한다.
				boolean b = file.delete();
				session.delete("image.delete",mapid);
				
				//몽고에 있는 것도 삭제
				System.out.println(str.getClass());
				System.out.println(str);
				template.remove(new Query(Criteria.where("num").is(str)), "room");
				Cookie[] cookie = req.getCookies();
				if(cookie.length>1){
					for(Cookie c : cookie){
						if(c.getName().equals(str)){
							c.setMaxAge(0);
							resp.addCookie(c);
						}
					}
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
	
	}
	
	//데이터베이스 picture테이블에 방번호 삽입
	public void insert(int num,String id){
	
		SqlSession session = factory.openSession();
		int r = 0;
		Map map = new HashedMap();
		map.put("num", num);
		map.put("id", id);
		try{
			r= session.insert("image.insert",map);
			if(r==1){
				session.commit();
			}
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
	}
	
}
