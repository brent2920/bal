package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class informationDao {
	
	@Autowired
	MongoTemplate template;
	@Autowired
	SqlSessionFactory factory;
	
	public int insertInfomation(Map map){
		int r = 0;
		Map number = new HashMap<>();
		SqlSession session = factory.openSession();
		try{
			r= session.insert("information.insert",map);
			if(r==1){
				session.commit();
				
				number = session.selectOne("information.select");
			System.out.println(number.toString());
				int num = Integer.parseInt(number.get("NUM").toString());
			String detail = map.get("detail").toString();
				Map mongomap = new HashMap<>();
				mongomap.put("num", num);
				mongomap.put("detail", detail);
				template.insert(mongomap,"information");
			}
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return r;
	}
	public List getTitle(){
		List<HashMap> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("information.selectall");
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return list;
	}
	public List getDetailinfo(Map map){
		List list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("information.detail",map);
			
			int num = Integer.parseInt(map.get("num").toString());
			
			AggregationOperation a1 = Aggregation.match(Criteria.where("num").is(num));
			Aggregation aggr = Aggregation.newAggregation(a1);
			System.out.println(aggr.toString());
			
		AggregationResults<Map>  result=   template.aggregate(aggr,"information", Map.class);
			System.out.println(result.toString());
		list.add(result);
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return list;
	}
	
	public int deleteData(Map map){
		SqlSession session = factory.openSession();
		int r = 0;
		int num = Integer.parseInt(map.get("num").toString());
		try{
			r = session.delete("information.delete",map);
			if(r>1){
				session.commit();
				template.remove(new Query(Criteria.where("num").is(num)));
				
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return r;
	}
	
	
	
	
	
	
	
	
	
}
