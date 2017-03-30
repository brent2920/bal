package models;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

@Service
public class imgDao {
	@Autowired
	SqlSessionFactory factory;
	@Autowired
	MongoTemplate template;
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
	//방 삭제될때 마다 호출 해야하는 Dao
	public void imageDelete2(String realpath){
		List<Map> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			//delete from picture where sell_num not in (select sell_num from room);
			//room테이블에서는 삭제되었지만 picture에 남아있는 방 번호를 리스트로 뽑아낸다
			list = session.selectList("image.list");
			//리스트를 맵으로 뽑아낸다.
			for(Map map : list){
				String str = map.get("SELL_NUM").toString();
				System.out.println(str+"!!!!!!!!");
				//하나의 방 번호 폴더의 절대 경로를 설정
				File file = new File(realpath+"\\"+str);
				//폴더 안에 있는 파일을 배열형태로 받아준다
				File[] files = file.listFiles();
				System.out.println(file.getAbsolutePath());
				//폴더안에 있는 파일을 삭제한다.
				for(File f :  files){
					boolean b = f.delete();
					
				}
				//폴더를 삭제한다.
				boolean b = file.delete();
	
				
				//몽고에 있는 것도 삭제
				AggregationOperation a1 = Aggregation.match(Criteria.where("num").is(str));

				Aggregation aggr = Aggregation.newAggregation(a1);

				System.out.println(aggr.toString());
				template.remove(aggr, "room");
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		
	
	}
	//데이터베이스 picture테이블에 방번호 삽입
	public void insert(int num){
		SqlSession session = factory.openSession();
		int r = 0;
		Map map = new HashedMap();
		map.put("num", num);
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
