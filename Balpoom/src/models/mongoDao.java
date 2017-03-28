package models;

import java.io.File;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

//이미지 경로를 몽고에 넣는 모델
@Service
public class mongoDao {
	
	@Autowired
	MongoTemplate template;
	
	public void insert(){

		Map map = new HashMap<>();
		List list = new ArrayList<>();
		
		
		File file = new File("d:/이현원/사진/");
		File[] files = file.listFiles();
		for(File f : files){
			if(f.isDirectory()){

				File file2 = new File("d:/이현원/사진/"+f.getName()+"/");
				File[] files2 = file2.listFiles();
				for(File ff : files2){
					list.add(ff);
	
				}
				map.put("num", f.getName());
				
				map.put("pictures", list);
				template.insert(map,"room");
				map.remove(f.getName());
				list.removeAll(list);
				
			}
		}

	}

	
	public List OneImage(String num){
		
		System.out.println(num);
		AggregationOperation a1 = Aggregation.match(Criteria.where("num").is(num));
		AggregationOperation a2 = Aggregation.match(Criteria.where("pictures").is(true));
		Aggregation aggr = Aggregation.newAggregation(a1,a2);
		
		System.out.println(aggr.toString());
		AggregationResults<Map> result = template.aggregate(aggr, "room", Map.class);
		List<Map> list = result.getMappedResults();
		System.out.println(list.toString());
		
		return list;
		
	}
	public void find(String num){
		Criteria c = Criteria.where("num").is(num);
		
		Query q = new Query(c);
		List<Map> list = template.find(q,Map.class,"room");
		System.out.println(q.toString());
		for(Map map: list){
			System.out.println(map.toString());
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

//	public int inserImg() throws IOException {
//		int r = 0;
//		Map<String, Object> map = new HashMap<>();
//
//		BufferedReader brr = new BufferedReader(new FileReader("d:\\numbers.txt"));
//
//		while (true) {
//			String str1 = brr.readLine();
//
//			try {
//				Document doc = Jsoup.connect("https://www.zigbang.com/items1/"+ str1).get();
//				Element image = doc.select(".bxslider").get(0);
//
//				String[] images = image.html().toString().split("\\n");
//
//				for (int i = 0; i < images.length; i++) {
//					String imtag = images[i].substring(images[i].indexOf("=") + 2, images[i].indexOf("data") - 2);
//					System.out.println(imtag);
//				}
//				System.out.println("=====================================");
//			} catch (Exception e) {
//				continue;
//			}
//			if (str1 == null)
//				break;
//		}
//		brr.close();
//
//		return r;
//	}
//
//	public int InsertImg(){
//		int r = 0;
//		
//		
//		return 0;
//	}


}
