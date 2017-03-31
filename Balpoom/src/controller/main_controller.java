package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import models.alterDao;
import models.informationDao;
import models.latelyDao;
import models.massageDao;
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
	@Autowired
	informationDao infoDao;
	@Autowired
	massageDao msgdao;

	@RequestMapping("/")
	public ModelAndView mainHandler(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView("t_main");
		List<Map> news = ndao.get_news();
		mav.addObject("news",news);
		
		
		
		// 메세지.=========================
				List list = new ArrayList();
				Map msgmap = new HashMap();
				String eemail ="";
				if(session.getAttribute("email") != null){
				eemail =(String)session.getAttribute("email");
				}
				msgmap.put("email", eemail);
				list = msgdao.msgfind(msgmap);
				if(list != null){
					System.out.println("잘들어갓냐?");
					mav.addObject("msglist",list);
				
				}else{
					System.out.println("잘안들어갔나?");
					
				}
				// 메세지.=========================
		
		
		
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
		System.out.println(latelylist.toString());
		List information = infoDao.getTitle();
		mav.addObject("infolist",information);
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

	// search paging ajax 泥섎━
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
		// 蹂댁쬆湲� �꽭�똿 - 臾몄옄�젣嫄�
		String[] d_from = deposit_from.split("\\s");
		String[] d_to = deposit_to.split("\\s");

		// �썡�꽭 �꽭�똿 - 臾몄옄�젣嫄�
		String[] m_from = mpay_from.split("\\s");
		String[] m_to = mpay_to.split("\\s");
		// System.out.println("M_TO ============> " + m_to[0]);

		// �룊�닔 �꽭�똿
		// 0 : �쟾泥� / 1 : 5�룊 �씠�븯 / 2 : 5~10�룊 / 3 : 10�룊 �씠�긽
		int areaFlag = 0;
		for (String m : area) {
			if (m.equals("lt_5"))
				areaFlag = 1;
			else if (m.equals("bt_5_10"))
				areaFlag = 2;
			else if (m.equals("gt_10"))
				areaFlag = 3;
		}

		// 諛⑹쥌瑜� 泥섎━
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

		// 痢듭닔 泥섎━
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
