package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.alterDao;
import models.latelyDao;
import models.mongoDao;
import models.newsDao;
import models.roomDao;
import utils.Urlpicture;

@Controller
public class main_controller {

	@Autowired
	roomDao rd;
	@Autowired
	Urlpicture urp;
	@Autowired
	alterDao aDao;
	@Autowired
	newsDao ndao;
	@Autowired
	mongoDao mDao;
	@Autowired
	latelyDao lDao;

	@RequestMapping("/")
	public ModelAndView mainHandler(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("t_main");
		List<Map> news = ndao.get_news();
		mav.addObject("news",news);
		
		
		
		Cookie[] cookies = req.getCookies();
		Map latelymap = new HashMap<>();
		List latelylist = new ArrayList<>();
		
		if (cookies != null) {
			int rr = cookies.length;
			System.out.println(rr);
			if (rr > 1) {
				for (Cookie cc : cookies) {
					if (!(cc.getName().equals("JSESSIONID"))) {
						int regNum = Integer.parseInt(cc.getValue());
						latelymap = lDao.getLatelyList(regNum);
						if(latelymap==null)
							latelymap = new HashMap<>();
						System.out.println(cc.getValue());

						String ar = mDao.OneImage(String.valueOf(regNum));
						latelymap.put("url", ar);
						System.out.println(ar);
						latelylist.add(latelymap);
					}
				}
			}

		}
		mav.addObject("news",news);
		mav.addObject("size", latelylist.size());
		mav.addObject("list", latelylist);
		
		
		return mav;
	}

	@RequestMapping("/searchlist")
	public ModelAndView slHandler() {
		ModelAndView mav = new ModelAndView("searchlist");
		return mav;
	}

	private void setViewName(String string) {
		// TODO Auto-generated method stub

	}

	// search paging ajax 처리
	@RequestMapping(path = "/testing", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap testing(@RequestParam Map n) {
		// System.out.println("============HashMao=============");
		ModelAndView mav = new ModelAndView();
		int cur = Integer.parseInt((String) n.get("curr"));
		String list = (String) n.get("list");
		// System.out.println("list = "+ list.toString());

		String[] arr = list.split(",");
		System.out.println("arr_string=" + arr.toString());
		System.out.println("arr.size = " + arr.length);
		String input = null;

		List<String> ur = new ArrayList<>();
		HashMap map = new HashMap();

		for (int i = 0; i < arr.length; i++) {

			input = "https://www.zigbang.com/items1/" + arr[i];
			map.put(i, (urp.get_main_url(input)));

		}
		// System.out.println("==========end Hashmap");
		return map;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/searchTest")
	@ResponseBody
	public List<Map> roomListHandler(@RequestParam(name = "mKind") String mKind,
			@RequestParam(name = "rKind[]") List<String> rKind,
			@RequestParam(name = "deposit_from") String deposit_from,
			@RequestParam(name = "deposit_to") String deposit_to, @RequestParam(name = "mpay_from") String mpay_from,
			@RequestParam(name = "mpay_to") String mpay_to,
			@RequestParam(name = "parking", required = false, defaultValue = "all") String parking,
			@RequestParam(name = "pet", required = false, defaultValue = "all") String pet,
			@RequestParam(name = "lhok", required = false, defaultValue = "all") String lhok,
			@RequestParam(name = "area[]", required = false, defaultValue = "all") List<String> area,
			@RequestParam(name = "floor[]", required = false, defaultValue = "all") List<String> floor,
			@RequestParam(name = "east") String east, @RequestParam(name = "west") String west,
			@RequestParam(name = "south") String south, @RequestParam(name = "north") String north) {

		// System.out.println("MPAY_TO ============> " + mpay_to);
		// 보증금 세팅 - 문자제거
		String[] d_from = deposit_from.split("\\s");
		String[] d_to = deposit_to.split("\\s");

		// 월세 세팅 - 문자제거
		String[] m_from = mpay_from.split("\\s");
		String[] m_to = mpay_to.split("\\s");
		// System.out.println("M_TO ============> " + m_to[0]);

		// 평수 세팅
		// 0 : 전체 / 1 : 5평 이하 / 2 : 5~10평 / 3 : 10평 이상
		int areaFlag = 0;
		for (String m : area) {
			if (m.equals("lt_5"))
				areaFlag = 1;
			else if (m.equals("bt_5_10"))
				areaFlag = 2;
			else if (m.equals("gt_10"))
				areaFlag = 3;
		}

		// 방종류 처리
		String one_open = "";
		String one_seperate = "";
		String one_dfloor = "";
		String two_room = "";
		String gt_three = "";

		for (String m : rKind) {
			if (m.equals("one_open"))
				one_open = m;

			else if (m.equals("one_seperate"))
				one_seperate = m;

			else if (m.equals("one_dfloor"))
				one_dfloor = m;

			else if (m.equals("two_room"))
				two_room = m;

			else if (m.equals("gt_three"))
				gt_three = m;
		}

		// 층수 처리
		String underground = "";
		String low_floor = "";
		String mid_floor = "";
		String high_floor = "";

		for (String m : floor) {
			if (m.equals("underground"))
				underground = m;

			else if (m.equals("low_floor"))
				low_floor = m;

			else if (m.equals("mid_floor"))
				mid_floor = m;

			else if (m.equals("high_floor"))
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

		Iterator<String> keys = searchConditions.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			// System.out.printf("%s = %s \n", key, searchConditions.get(key));
		}

		List<Map> rList = rd.getRoomList(searchConditions);
		System.out.println("Room List Size : " + rList.size());
		return rList;
	}

}
