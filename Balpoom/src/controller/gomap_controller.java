package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import models.gomapDao;
import models.roomDao;
import utils.APIKeys;

@Controller
public class gomap_controller {
	@Autowired
	gomapDao gmap;
	@Autowired
	roomDao rd;
	@Autowired
	APIKeys apiKey;

	@RequestMapping(path = "/getnewarrlist", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String gomap_newarr_list(@RequestParam Map map) {
		List<Map> mlist = new ArrayList();
		String m = null;
		String info = (String) map.get("info");
		try {

			String[] strr = info.split(",");
			double lagbb = Double.parseDouble(strr[0].substring(2, strr[0].length()));
			double logbb = Double.parseDouble(strr[1].substring(0, strr[1].length() - 1));
			double lagff = Double.parseDouble(strr[2].substring(2, strr[2].length()));
			double logff = Double.parseDouble(strr[3].substring(1, strr[3].length() - 2));

			map.put("lagb", lagbb);
			map.put("lagf", lagff);
			map.put("logb", logbb);
			map.put("logf", logff);
			mlist = gmap.get_new_list(map);
			m = new ObjectMapper().writeValueAsString(mlist);
			//System.out.println("gomap_newarr_list=" + m);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return m;

	}

	// search paging ajax 처리
	@RequestMapping("/gomapin")
	@ResponseBody
	public String google_map_geo(
			@RequestParam(name="mKind") String mKind, 
			@RequestParam(name="rKind[]") List<String> rKind, 
			@RequestParam(name="deposit_from") String deposit_from, 
			@RequestParam(name="deposit_to") String deposit_to, 
			@RequestParam(name="mpay_from") String mpay_from, 
			@RequestParam(name="mpay_to") String mpay_to, 
			@RequestParam(name="parking", required=false, defaultValue="all") String parking, 
			@RequestParam(name="pet", required=false, defaultValue="all") String pet, 
			@RequestParam(name="lhok", required=false, defaultValue="all") String lhok, 
			@RequestParam(name="area[]" , required=false, defaultValue="all") List<String> area, 
			@RequestParam(name="floor[]", required=false, defaultValue="all") List<String> floor,
			@RequestParam(name="east") String east,
			@RequestParam(name="west") String west,
			@RequestParam(name="south") String south,
			@RequestParam(name="north") String north
			) throws JsonProcessingException {
		//System.out.println("MPAY_TO ============> " + mpay_to);
		// 보증금 세팅 - 문자제거
		String[] d_from = deposit_from.split("\\s");
		String[] d_to = deposit_to.split("\\s");
		
		// 월세 세팅 - 문자제거
		String[] m_from = mpay_from.split("\\s");
		String[] m_to = mpay_to.split("\\s");
		//System.out.println("M_TO ============> " + m_to[0]);
		
		
		// 평수 세팅
		// 0 : 전체 / 1 : 5평 이하 / 2 : 5~10평 / 3 : 10평 이상 
		int areaFlag = 0;
		for(String m : area) {
			if(m.equals("lt_5"))
				areaFlag = 1;
			else if(m.equals("bt_5_10"))
				areaFlag = 2;
			else if(m.equals("gt_10"))
				areaFlag = 3;
		}
		
		// 방종류 처리
		String one_open="";
		String one_seperate="";
		String one_dfloor="";
		String two_room="";
		String gt_three="";
		String m_return="";
		
		for(String m : rKind) {
			if(m.equals("one_open"))
				one_open = m;
			
			else if(m.equals("one_seperate"))
				one_seperate = m;
			
			else if(m.equals("one_dfloor"))
				one_dfloor = m;
			
			else if(m.equals("two_room"))
				two_room = m;			
			
			else if(m.equals("gt_three"))
				gt_three = m;
		}
			
		// 층수 처리
		String underground="";
		String low_floor="";
		String mid_floor="";
		String high_floor="";
		
		for(String m : floor) {
			if(m.equals("underground"))
				underground = m;
			
			else if(m.equals("low_floor"))
				low_floor = m;
			
			else if(m.equals("mid_floor"))
				mid_floor = m;
			
			else if(m.equals("high_floor"))
				high_floor = m;
		}
		
		@SuppressWarnings("rawtypes")
		Map searchConditions = new HashMap<>();
			searchConditions.put("mKind", mKind);
			searchConditions.put("one_open", one_open);
			searchConditions.put("one_seperate", one_seperate);
			searchConditions.put("one_dfloor", one_dfloor);
			searchConditions.put("two_room", two_room);
			searchConditions.put("gt_three", gt_three);
			searchConditions.put("deposit_from", d_from[0]);
			searchConditions.put("deposit_to", d_to[0]);
			searchConditions.put("mpay_from", m_from[0]);
			searchConditions.put("mpay_to", m_to[0]);
			searchConditions.put("parking", parking);
			searchConditions.put("pet", pet);
			searchConditions.put("lhok", lhok);
			searchConditions.put("area", areaFlag);
			searchConditions.put("underground", underground);
			searchConditions.put("low_floor", low_floor);
			searchConditions.put("mid_floor", mid_floor);
			searchConditions.put("high_floor", high_floor);
			searchConditions.put("east", east);
			searchConditions.put("west", west);
			searchConditions.put("south", south);
			searchConditions.put("north", north);
		//System.out.println(searchConditions);
		Iterator<String> keys = searchConditions.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			//System.out.printf("%s = %s \n", key, searchConditions.get(key));
		}
			
			List<Map> rList = rd.getRoomList(searchConditions);
			//System.out.println("rList ="+ rList.toString());
			List<Map> result = new ArrayList();
			for(Map map : rList){
				//System.out.println(map.get("SELL_NUM")+ " "+map.get("B_LONGITUDE") + " "+map.get("B_LATITUDE"));
				Map mapInfo = new HashMap<>();
				Map location = new HashMap<>();
				Map geo = new HashMap<>();
				Map geomet = new HashMap<>();
				List lists = new ArrayList<>();
				
				location.put("lat", map.get("B_LATITUDE"));
				location.put("lng", map.get("B_LONGITUDE"));
				
			
				geo.put("location", location);
				mapInfo.put("geometry", geo);
				mapInfo.put("id", "2e3dec069aed3a50278a0f8556d7520d84d3c4e6");
				mapInfo.put("place_id", "ChIJZ934S0KuEmsR_0lxV3PTR4M");
				mapInfo.put("reference",
						"CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg");
				mapInfo.put("html_attributions", lists);
				
				result.add(mapInfo);
				
				
				
			}
			String return_value = new ObjectMapper().writeValueAsString(result);
			return return_value;

	}

	@RequestMapping(path="/gsearchTest", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String roomListHandler(
			@RequestParam(name="mKind") String mKind, 
			@RequestParam(name="rKind[]") List<String> rKind, 
			@RequestParam(name="deposit_from") String deposit_from, 
			@RequestParam(name="deposit_to") String deposit_to, 
			@RequestParam(name="mpay_from") String mpay_from, 
			@RequestParam(name="mpay_to") String mpay_to, 
			@RequestParam(name="parking", required=false, defaultValue="all") String parking, 
			@RequestParam(name="pet", required=false, defaultValue="all") String pet, 
			@RequestParam(name="lhok", required=false, defaultValue="all") String lhok, 
			@RequestParam(name="area[]" , required=false, defaultValue="all") List<String> area, 
			@RequestParam(name="floor[]", required=false, defaultValue="all") List<String> floor,
			@RequestParam(name="east") String east,
			@RequestParam(name="west") String west,
			@RequestParam(name="south") String south,
			@RequestParam(name="north") String north
			) throws JsonProcessingException {
		
		//System.out.println("MPAY_TO ============> " + mpay_to);
		// 보증금 세팅 - 문자제거
		String[] d_from = deposit_from.split("\\s");
		String[] d_to = deposit_to.split("\\s");
		
		// 월세 세팅 - 문자제거
		String[] m_from = mpay_from.split("\\s");
		String[] m_to = mpay_to.split("\\s");
		//System.out.println("M_TO ============> " + m_to[0]);
		
		
		// 평수 세팅
		// 0 : 전체 / 1 : 5평 이하 / 2 : 5~10평 / 3 : 10평 이상 
		int areaFlag = 0;
		for(String m : area) {
			if(m.equals("lt_5"))
				areaFlag = 1;
			else if(m.equals("bt_5_10"))
				areaFlag = 2;
			else if(m.equals("gt_10"))
				areaFlag = 3;
		}
		
		// 방종류 처리
		String one_open="";
		String one_seperate="";
		String one_dfloor="";
		String two_room="";
		String gt_three="";
		String m_return="";
		
		for(String m : rKind) {
			if(m.equals("one_open"))
				one_open = m;
			
			else if(m.equals("one_seperate"))
				one_seperate = m;
			
			else if(m.equals("one_dfloor"))
				one_dfloor = m;
			
			else if(m.equals("two_room"))
				two_room = m;			
			
			else if(m.equals("gt_three"))
				gt_three = m;
		}
			
		// 층수 처리
		String underground="";
		String low_floor="";
		String mid_floor="";
		String high_floor="";
		
		for(String m : floor) {
			if(m.equals("underground"))
				underground = m;
			
			else if(m.equals("low_floor"))
				low_floor = m;
			
			else if(m.equals("mid_floor"))
				mid_floor = m;
			
			else if(m.equals("high_floor"))
				high_floor = m;
		}
		
		@SuppressWarnings("rawtypes")
		Map searchConditions = new HashMap<>();
			searchConditions.put("mKind", mKind);
			searchConditions.put("one_open", one_open);
			searchConditions.put("one_seperate", one_seperate);
			searchConditions.put("one_dfloor", one_dfloor);
			searchConditions.put("two_room", two_room);
			searchConditions.put("gt_three", gt_three);
			searchConditions.put("deposit_from", d_from[0]);
			searchConditions.put("deposit_to", d_to[0]);
			searchConditions.put("mpay_from", m_from[0]);
			searchConditions.put("mpay_to", m_to[0]);
			searchConditions.put("parking", parking);
			searchConditions.put("pet", pet);
			searchConditions.put("lhok", lhok);
			searchConditions.put("area", areaFlag);
			searchConditions.put("underground", underground);
			searchConditions.put("low_floor", low_floor);
			searchConditions.put("mid_floor", mid_floor);
			searchConditions.put("high_floor", high_floor);
			searchConditions.put("east", east);
			searchConditions.put("west", west);
			searchConditions.put("south", south);
			searchConditions.put("north", north);
		//System.out.println(searchConditions);
		Iterator<String> keys = searchConditions.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			//System.out.printf("%s = %s \n", key, searchConditions.get(key));
		}
			
			List<Map> rList = rd.getRoomList(searchConditions);
			//System.out.println("rList ="+ rList.toString());
			//System.out.println("Room List Size : " + rList.size());
			m_return = new ObjectMapper().writeValueAsString(rList);
			//System.out.println("M_return=" + m_return);
		
		//System.out.println("m_return:"+m_return);
		//System.out.println("==================/gsearchTest End==========");
		return m_return;
	}

	@RequestMapping("/gglocation")
	@ResponseBody
	public HashMap gglocation() {
		try {
			HashMap map = new HashMap();
			//System.out.println("gglocation");
			long lat = (long) 37.5326049;
			long log = (long) 126.8646878;
			String detail_request = "https://maps.googleapis.com/maps/api/place/nearbysearch/xml?"
					+ "location=-33.8670522,151.1957362" + " &radius=500&types=food&name=cruise"
					+ "&key=" + apiKey.getGOOGLE_MAP_KEY();
			//System.out.println(detail_request);
			Document doc = Jsoup.connect(detail_request).get();
			String id = doc.select("PlaceSearchResponse").select("result").select("id").get(0).text();
			//System.out.println(id.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
