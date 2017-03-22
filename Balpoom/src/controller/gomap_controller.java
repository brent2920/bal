package controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.gomapDao;
@Controller
public class gomap_controller {
	@Autowired
	gomapDao gmap;
	
	// search paging ajax 처리
		@RequestMapping("/gomapin")
		@ResponseBody
		public String google_map_geo(@RequestParam Map map, HttpServletRequest req, HttpServletResponse resp) {
			String info = null;
			List<Map> result = new ArrayList();
			List<String> result2 = new ArrayList();
			String m = null;
			String rt = "";

			try {
				info = (String) map.get("info");
				System.out.println("gomapin=>"+ info);
				
				String[] strr =  info.split(",");
			    String lagb = strr[0].substring(2, strr[0].length());
				String logb = strr[1].substring(0, strr[1].length()-1);
				String lagf = strr[2].substring(2,strr[2].length());
				String logf = strr[3].substring(1, strr[3].length()-2);
			    System.out.println("lat=> "+lagb +" lng=>"+ lagf);
			    System.out.println("latf=>"+ logb + " lngf=>"+ logf);
			    double lagbb = Double.parseDouble(lagb);
			    double logbb = Double.parseDouble(logb);
			    double lagff = Double.parseDouble(lagf);
			    double logff = Double.parseDouble(logf);
			    System.out.println("lagbb=>"+lagbb);
			    System.out.println("lagff=>"+lagff);
			    System.out.println("logbb=>"+logbb);
			    System.out.println("logff=>"+logff);
			    map.put("lagb",lagbb);
				map.put("lagf",lagff);
				map.put("logb",logbb );
				map.put("logf", logff);
				result = gmap.gomap(map);
				for(Map mm : result){
					//System.out.println(mm.get("SELL_NUM"));
					rt+= "{\"geometry\":  {\"location\" :{\"lat\":"+  mm.get("B_LATITUDE")+",\"lng\":"+mm.get("B_LONGITUDE")+"}},";
					rt+="\"id\": \"2e3dec069aed3a50278a0f8556d7520d84d3c4e6\",";
					rt+="\"place_id\":" + "\"ChIJZ934S0KuEmsR_0lxV3PTR4M\",";
					rt+="\"reference\": \"CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg\",";
					rt+="\"html_attributions\":[]}";
				
					result2.add(rt);
					rt = "";
				}
				//System.out.println("result2.size=>"+result2.size());
				
	
				//System.out.println(result2.toString());
				m = new ObjectMapper().writeValueAsString(result);
				m = new ObjectMapper().writeValueAsString(result2);
				System.out.println(m);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return m;
		
		}
		
		@RequestMapping("/gglocation")
		@ResponseBody
		public HashMap gglocation() {
			try {
				HashMap map = new HashMap();
				System.out.println("gglocation");
				long lat = (long) 37.5326049;
				long log = (long) 126.8646878;
				String detail_request = "https://maps.googleapis.com/maps/api/place/nearbysearch/xml?"
						+ "location=-33.8670522,151.1957362" + " &radius=500&types=food&name=cruise"
						+ "&key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap";
				System.out.println(detail_request);
				Document doc = Jsoup.connect(detail_request).get();
				String id = doc.select("PlaceSearchResponse").select("result").select("id").get(0).text();
				System.out.println(id.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}

			return null;

		}

}
