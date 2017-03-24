package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.roomaddDao;

@Controller
@RequestMapping("/")
public class roomadd_controller {
	@Autowired
	roomaddDao rdao;
	
	
	@RequestMapping("roomadd")
	public ModelAndView mav() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomadd");
		return mav;
	}

	@RequestMapping("/roomMap")
	@ResponseBody
	public Map mav(@RequestParam(name = "map") String addMap) throws IOException {
		ModelAndView mav = new ModelAndView();
		addMap = addMap.replaceAll("\\s", "");
		String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + addMap
				+ "&key=AIzaSyCjJDAVTrB1J5P1OllkHC07cmjfJbb52vg&language=ko";
		URL url = new URL(target);
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
		String outstr = "";
		while (true) {
			String str = br.readLine();
			if (str == null)
				break;
			// out.println(str);
			outstr += str;
		}

		// out.println(outstr);
		Map map = new ObjectMapper().readValue(outstr, Map.class);
		return map;

	}
	
	
	
	
	
	
	

	@RequestMapping("/roominsert")
	public ModelAndView roominsert(@RequestParam Map map, HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map Rmap = new HashMap();

		String b_title = (String) map.get("b_title"); // 타이틀
		System.out.println("타이틀 : " + b_title);
		
		String b_local1 = "";
		String b_local2 = "";
		String b_local3 = "";
		if(!b_title.equals("")){
			String[] b_local =  b_title.split("\\s");
				for (int i = 0; i < 3; i++) {
					b_local1 = b_local[0];
					b_local2 = b_local[1];
					b_local3 = b_local[2];
			}		
		}
		System.out.println("1 : "+b_local1+", 2 : "+b_local2+", 3 : "+b_local3);
		
		String b_depositI = (String) map.get("b_deposit");
		System.out.println("보증금 : " + b_depositI);
		int b_deposit =0;
		if(!b_depositI.equals("")){
			 b_deposit = Integer.parseInt(b_depositI);		
		}
		
		String b_mpayI = (String) map.get("b_mpay");
		System.out.println("월세 : " + b_mpayI);
		int b_mpay = 0;
		if(!b_mpayI.equals("")){
			b_mpay = Integer.parseInt(b_mpayI);		
		}
		
		
		String b_rkind = (String) map.get("b_rkind");
		System.out.println("방 종류 : " + b_rkind);
		String b_floor = (String) map.get("b_floor");
		System.out.println("해당층 : " + b_floor);
		String b_floor_all = (String) map.get("b_floor_all");
		System.out.println("전체층 : " + b_floor_all);

		String b_size_mD = (String) map.get("b_size_m2"); // 더블로 변환 해야 됨
		double b_size_m2 = 0.0;
		if (!b_size_mD.isEmpty()) {
			b_size_m2 = Double.parseDouble(b_size_mD);
			System.out.println("면적 : " + b_size_m2);

		}

		String b_sizeD = (String) map.get("b_size"); // 더블로 변환 해야 됨
		double b_size =0.0;
		if (!b_sizeD.isEmpty()) {
			b_size = Double.parseDouble(b_sizeD);
			System.out.println("평수 : " + b_size);
		}

		String b_gpay = (String) map.get("b_gpay");
		System.out.println("관리비 : " + b_gpay);

		// String[] ar = req.getParameterValues("b_glist");
		// for(String aar : ar){
		// System.out.println("관리비 포함 항목 : "+aar);
		// map.put("b_glist", aar);
		// }

		String[] ar = req.getParameterValues("b_glist");
		String str="";
		if (ar != null) {		
			for (String aar : ar) {
				str += aar+",";
			
			}
		}
		System.out.println("관리 포함 항목 : "+str.toString());
		String[] arr = req.getParameterValues("b_option");
		String strr = "";
		if(arr != null){
			for(String arrr : arr){
				strr += arrr+",";
			}
		}
		System.out.println("옵션 : "+strr.toString());

		Set key = Rmap.keySet();
		Iterator list = key.iterator();
		while (list.hasNext()) {
			String kkey = (String) list.next();
			System.out.println("set 키값 : " + kkey);
			String vvalue = (String) Rmap.get(kkey);
			System.out.println("벨류 값 : " + vvalue);
		}

		String b_eleve = (String) map.get("b_eleve");
		System.out.println("엘리베이터  : " + b_eleve);
		String b_parking = (String) map.get("b_parking");
		System.out.println("주차가능 : " + b_parking);

		String b_rinfo = (String) map.get("b_rinfo");
		System.out.println("방 요약 정보 : " + b_rinfo);

		String b_enterdate = (String) map.get("b_enterdate");
		System.out.println("입주 가능일 : " + b_enterdate);

		String b_lhok = (String) map.get("b_lhok");
		System.out.println("LH 가능여부 : " + b_lhok);

		String b_detail = (String) map.get("b_detail");
		System.out.println("상세 설명 : " + b_detail);

		String b_nstation = (String) map.get("b_nstation");
		System.out.println("근처 지하철 역 정보 : " + b_nstation);

	
		String b_latitudeD = (String) map.get("b_latitude");
		System.out.println("위도 : " + b_latitudeD);
		double b_latitude = 0.0;
		if(!b_latitudeD.isEmpty()){
			b_latitude = Double.parseDouble(b_latitudeD);
			
		}

		String b_longitudeD = (String) map.get("b_longitude");
		System.out.println("경도 : " + b_longitudeD);
		double b_longitude = 0.0;
		if(!b_longitudeD.isEmpty()){
			 b_longitude = Double.parseDouble(b_longitudeD);
	
		}

		String b_petpossible = (String) map.get("b_petpossible");
		System.out.println("펫 가능 여부 : " + b_petpossible);

		String id = (String) session.getAttribute("email");
		System.out.println("가입자 이메일 : " + id);
		
		int rr = (int)(Math.random()* 99999);
		System.out.println("방번호 : "+rr);
		
		
		Rmap.put("id", id);
		Rmap.put("sell_num", rr);
		Rmap.put("b_title", b_title);
		Rmap.put("b_deposit", b_deposit);
		Rmap.put("b_mpay", b_mpay);
		Rmap.put("b_rkind", b_rkind);
		Rmap.put("b_floor", b_floor);
		Rmap.put("b_floor_all", b_floor_all);
		Rmap.put("b_size_m2", b_size_m2);
		Rmap.put("b_glist", str);				// 관리비 포함 항목
		Rmap.put("b_size", b_size);
		Rmap.put("b_gpay", b_gpay);
		Rmap.put("b_option", strr);    // 추가 옵션
		Rmap.put("b_eleve", b_eleve);
		Rmap.put("b_parking", b_parking);		
		Rmap.put("b_rinfo", b_rinfo);
		Rmap.put("b_enterdate", b_enterdate);
		Rmap.put("b_detail", b_detail);
		Rmap.put("b_location", b_title);
		Rmap.put("b_nstation", b_nstation);
		Rmap.put("b_latitude", b_latitude);		
		Rmap.put("b_longitude", b_longitude);
		Rmap.put("b_petpossible", b_petpossible);
		Rmap.put("b_lhok", b_lhok);
		Rmap.put("b_local1", b_local1);
		Rmap.put("b_local2", b_local2);
		Rmap.put("b_local3", b_local3);
		
		
		int r = rdao.roomadd(Rmap);
		if(r == 1){
			mav.setViewName("t_main");
			mav.addObject("addroom","방 등록이 완료 되었습니다!");
		}else{
			mav.setViewName("t_main");
		}
		return mav;

	}

}
