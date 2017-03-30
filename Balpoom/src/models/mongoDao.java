package models;

import java.io.File;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
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

	public void insert_hospital_api() {
		try {
			Document doc = Jsoup
					.connect(
							"http://openapi.seoul.go.kr:8088/426365434474653035377067517368/xml/SdeGiGhospP2015WGS/1/1000/")
					.get();
			Elements rows = doc.getElementsByTag("row");
			System.out.println(rows.size());
			List<Map> mlist = new ArrayList();
			for (Element row : rows) {
				Map map = new HashMap<>();

				Element lat = row.getElementsByTag("LAT").get(0);
				Element lng = row.getElementsByTag("LNG").get(0);
				Element name = row.getElementsByTag("HOSP_NM").get(0);

				map.put("h_name", name.text());
				map.put("lat", lat.text());
				map.put("lng", lng.text());

				mlist.add(map);

				System.out.println("mlist size = " + mlist.size());
			}
			// System.out.println(mlist.toString());
			template.insert(mlist, "hospital");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void insert() {

		Map map = new HashMap<>();
		List list = new ArrayList<>();

		File file = new File("D:/이현원/사진/");

		File[] files = file.listFiles();
		for (File f : files) {
			if (f.isDirectory()) {

				File file2 = new File("d:/이현원/사진/" + f.getName() + "/");

				File[] files2 = file2.listFiles();

				for (File ff : files2) {
					list.add("/images/사진/" + f.getName() + "/" + ff.getName());

				}
				map.put("num", f.getName());
				
				map.put("pictures", list);
				template.insert(map, "room");
				map.remove(f.getName());
				list.removeAll(list);

			}

		}
	}

	public String OneImage(String num) {

		System.out.println(num);
		AggregationOperation a1 = Aggregation.match(Criteria.where("num").is(num));

		Aggregation aggr = Aggregation.newAggregation(a1);

		System.out.println(aggr.toString());
		AggregationResults<Map> result = template.aggregate(aggr, "room", Map.class);
		List<Map> list = result.getMappedResults();

		// class java.util.ArrayList

		String[] ar = list.iterator().next().get("pictures").toString().split(",");
		
		return ar[0].toString().substring(ar[0].toString().indexOf("[") + 1,ar[0].length()-1);

	}

	public void find(String num) {
		Criteria c = Criteria.where("num").is(num);

		Query q = new Query(c);
		List<Map> list = template.find(q, Map.class, "room");
		System.out.println(q.toString());
		for (Map map : list) {
			System.out.println(map.toString());
		}

	}

	public String AllImage(String num) {

		System.out.println(num);
		AggregationOperation a1 = Aggregation.match(Criteria.where("num").is(num));

		Aggregation aggr = Aggregation.newAggregation(a1);

		System.out.println(aggr.toString());
		AggregationResults<Map> result = template.aggregate(aggr, "room", Map.class);
		List<Map> list = result.getMappedResults();
		// class java.util.ArrayList
		Map map = new HashMap<>();
		String[] ar = new String[] {};
		String str = "";
		for (Map map1 : list) {
			str = map1.get("pictures").toString().substring(1, map1.get("pictures").toString().length() - 1);
		}
		
		return str;

	}

	public List<HashMap> getHospitalInfo(HashMap<String, Object> bounds) {
		
		String east = bounds.get("east").toString();
		String west = bounds.get("west").toString();
		String south = bounds.get("south").toString();
		String north = bounds.get("north").toString();
		
		Criteria latCondition = Criteria.where("lat").gt(south).lt(north);
		Criteria lngCondition = Criteria.where("lng").gt(west).lt(east);
		
		AggregationOperation condition_1 = Aggregation.match(latCondition);
		AggregationOperation condition_2 = Aggregation.match(lngCondition);
		
		Aggregation aggr = Aggregation.newAggregation(condition_1, condition_2);
		
		System.out.println(aggr.toString());	// 쿼리문 체크!
		
		AggregationResults<HashMap> result
			= template.aggregate(aggr, "hospital", HashMap.class);
		List<HashMap> rstList = result.getMappedResults();
		System.out.println("Hospital List Size : " + rstList.size());
		
		if(rstList.isEmpty()) {
			System.out.println("List is Empty!!");
			System.out.println(rstList);
		} else {
			System.out.println("list 내용체크 : " + rstList);
		}
		return rstList;
	}
	
	// public int inserImg() throws IOException {
	// int r = 0;
	// Map<String, Object> map = new HashMap<>();
	//
	// BufferedReader brr = new BufferedReader(new
	// FileReader("d:\\numbers.txt"));
	//
	// while (true) {
	// String str1 = brr.readLine();
	//
	// try {
	// Document doc = Jsoup.connect("https://www.zigbang.com/items1/"+
	// str1).get();
	// Element image = doc.select(".bxslider").get(0);
	//
	// String[] images = image.html().toString().split("\\n");
	//
	// for (int i = 0; i < images.length; i++) {
	// String imtag = images[i].substring(images[i].indexOf("=") + 2,
	// images[i].indexOf("data") - 2);
	// System.out.println(imtag);
	// }
	// System.out.println("=====================================");
	// } catch (Exception e) {
	// continue;
	// }
	// if (str1 == null)
	// break;
	// }
	// brr.close();
	//
	// return r;
	// }
	//
	// public int InsertImg(){
	// int r = 0;
	//
	//
	// return 0;
	// }

}
