package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.roomDao;
import models.searchDao;
import utils.APIKeys;
import utils.Urlpicture;

@Controller
public class search_controller {

	@Autowired
	searchDao sDao;

	@Autowired
	roomDao rDao;

	@Autowired
	Urlpicture urp;
	
	@Autowired
	APIKeys apiKey;

	@RequestMapping("/search")
	public ModelAndView searchHandler(@RequestParam(name = "keyword", defaultValue = "서울시청") String keyword)
			throws Exception {

		ModelAndView mav = new ModelAndView("t_search");
		System.out.println("Search Keyword : " + keyword);
		HashMap<String, Double> location = new HashMap<>();
	
		if(sDao.getLatLng(keyword) == null) {
			location.put("lat", 37.5662952);
			location.put("lng", 126.9779451);
		} else {
			location = sDao.getLatLng(keyword);
		}
			
		System.out.println("Location : " + location);
		
		// 검색키워드에 해당하는 값의 좌표값 addObject
		mav.addObject("location", location);

		List<HashMap<String, Object>> mlist = rDao.test_room();
		System.out.println("mlist.size=" + mlist.size());
		/*
		 * search 처리 코드
		 */
		List<Integer> numbers = new ArrayList<>();
		int defnum = 7612035;// 에러시 이번호도 처리가 안되는거라서 바꿔줘야함
		List<String> urlcol = new ArrayList<>();
		JSONArray urlcolj = null;
		JSONArray numbersj = null;

		JSONArray json_arr = new JSONArray();// Json 객체 로 만들기
		for (Map<String, Object> map : mlist) {
			JSONObject json_obj = new JSONObject();
			String url = null;
			String input = null;
			int num = defnum;
			num = Integer.parseInt(map.get("SELL_NUM") + "");
			input = "https://www.zigbang.com/items1/" + num;

			try {
				url = (urp.get_main_url(input));
				numbers.add(num);
			} catch (Exception e) {
				url = "http://z1.zigbang.com/items/" + defnum
						+ "/538ec7a16033f0c32eac29ac50deb04a1e6bf3ba.jpg?h=800&q=60";
			}
			urlcol.add(url);
			urlcolj = new JSONArray(urlcol);
			numbersj = new JSONArray(numbers);
			String temp = new ObjectMapper().writeValueAsString(urlcol);

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				try {
					json_obj.put(key, value);
				} catch (Exception e) {
				}
			}
			(json_arr).put(json_obj);

		}

		mav.addObject("dn", defnum);
		mav.addObject("nj", numbersj);
		mav.addObject("mpic", urlcolj);
		mav.addObject("mlist", json_arr.toString());
		mav.addObject("msize", mlist.size());
		mav.addObject("apiKey", apiKey.getGOOGLE_MAP_KEY());
		mav.setViewName("t_search");
		System.out.println("mlist size=>" + json_arr.length() + " msize = " + mlist.size());
		System.out.println("dn=" + defnum + "nj=" + numbersj);
		System.out.println("urlcolj= " + urlcolj);
		System.out.println("==================search end====================");

		return mav;
	}
	
	@RequestMapping("/search_chk")
	@ResponseBody
	public boolean searchCheckHandler(
			@RequestParam(name = "keyword", defaultValue = "서울시청") 
				String keyword) {
		try {
			return sDao.keywordCheck(keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@RequestMapping("/detail_search_chk")
	@ResponseBody
	public HashMap detailSearchCheckHandler(
			@RequestParam(name = "keyword", defaultValue = "서울시청") 
				String keyword) {
		try {
			return sDao.getLatLng(keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}