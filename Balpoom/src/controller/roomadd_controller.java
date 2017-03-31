package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.imgDao;
import models.latelyDao;
import models.mongoDao;
import models.newsDao;
import models.roomaddDao;
import utils.APIKeys;

@Controller
@RequestMapping("/")
public class roomadd_controller {
	@Autowired
	roomaddDao rdao;
	
	@Autowired
	APIKeys apiKey;
	
	@Autowired
	ApplicationContext application;
	
	@Autowired
	MongoTemplate template;
	
	@Autowired
	imgDao iDao;
	
	@Autowired
	mongoDao mDao;
	
	@Autowired
	latelyDao lDao;
	
	@Autowired
	newsDao nDao;
	
	
	@RequestMapping("/roomadd")
	public ModelAndView mav(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomadd");
		mav.addObject("apiKey", apiKey.getGOOGLE_MAP_KEY());
		
		
		
		
		
		return mav;
	}

	@RequestMapping("/roomMap")
	@ResponseBody
	public Map mav(@RequestParam(name = "map") String addMap) throws IOException {
		ModelAndView mav = new ModelAndView();
		addMap = addMap.replaceAll("\\s", "");
		String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + addMap
				+ "&key=" + apiKey.getGOOGLE_MAP_KEY();
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
	public ModelAndView roominsert(@RequestParam Map map, HttpServletRequest req, HttpSession session,
			 @RequestParam("file")MultipartFile[] file) throws IOException {
		ModelAndView mav = new ModelAndView();
		Map Rmap = new HashMap();

		String b_title = (String) map.get("b_title"); // ���씠��
		System.out.println("���씠�� : " + b_title);
		
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
		System.out.println("蹂댁쬆湲� : " + b_depositI);
		int b_deposit =0;
		if(!b_depositI.equals("")){
			 b_deposit = Integer.parseInt(b_depositI);		
		}
		
		String b_mpayI = (String) map.get("b_mpay");
		System.out.println("�썡�꽭 : " + b_mpayI);
		int b_mpay = 0;
		if(!b_mpayI.equals("")){
			b_mpay = Integer.parseInt(b_mpayI);		
		}
		
		
		String b_rkind = (String) map.get("b_rkind");
		System.out.println("諛� 醫낅쪟 : " + b_rkind);
		String b_floor = (String) map.get("b_floor");
		System.out.println("�빐�떦痢� : " + b_floor);
		String b_floor_all = (String) map.get("b_floor_all");
		System.out.println("�쟾泥댁링 : " + b_floor_all);

		String b_size_mD = (String) map.get("b_size_m2"); // �뜑釉붾줈 蹂��솚 �빐�빞 �맖
		double b_size_m2 = 0.0;
		if (!b_size_mD.isEmpty()) {
			b_size_m2 = Double.parseDouble(b_size_mD);
			System.out.println("硫댁쟻 : " + b_size_m2);

		}

		String b_sizeD = (String) map.get("b_size"); // �뜑釉붾줈 蹂��솚 �빐�빞 �맖
		double b_size =0.0;
		if (!b_sizeD.isEmpty()) {
			b_size = Double.parseDouble(b_sizeD);
			System.out.println("�룊�닔 : " + b_size);
		}

		String b_gpay = (String) map.get("b_gpay");
		System.out.println("愿�由щ퉬 : " + b_gpay);

		// String[] ar = req.getParameterValues("b_glist");
		// for(String aar : ar){
		// System.out.println("愿�由щ퉬 �룷�븿 �빆紐� : "+aar);
		// map.put("b_glist", aar);
		// }

		String[] ar = req.getParameterValues("b_glist");
		String str="";
		if (ar != null) {		
			for (String aar : ar) {
				str += aar+",";
			
			}
		}
		System.out.println("愿�由� �룷�븿 �빆紐� : "+str.toString());
		String[] arr = req.getParameterValues("b_option");
		String strr = "";
		if(arr != null){
			for(String arrr : arr){
				strr += arrr+",";
			}
		}
		System.out.println("�샃�뀡 : "+strr.toString());

		Set key = Rmap.keySet();
		Iterator list = key.iterator();
		while (list.hasNext()) {
			String kkey = (String) list.next();
			System.out.println("set �궎媛� : " + kkey);
			String vvalue = (String) Rmap.get(kkey);
			System.out.println("踰⑤쪟 媛� : " + vvalue);
		}

		String b_eleve = (String) map.get("b_eleve");
		System.out.println("�뿕由щ쿋�씠�꽣  : " + b_eleve);
		String b_parking = (String) map.get("b_parking");
		System.out.println("二쇱감媛��뒫 : " + b_parking);

		String b_rinfo = (String) map.get("b_rinfo");
		System.out.println("諛� �슂�빟 �젙蹂� : " + b_rinfo);

		String b_enterdate = (String) map.get("b_enterdate");
		System.out.println("�엯二� 媛��뒫�씪 : " + b_enterdate);

		String b_lhok = (String) map.get("b_lhok");
		System.out.println("LH 媛��뒫�뿬遺� : " + b_lhok);

		String b_detail = (String) map.get("b_detail");
		System.out.println("�긽�꽭 �꽕紐� : " + b_detail);

		String b_nstation = (String) map.get("b_nstation");
		System.out.println("洹쇱쿂 吏��븯泥� �뿭 �젙蹂� : " + b_nstation);

	
		String b_latitudeD = (String) map.get("b_latitude");
		System.out.println("�쐞�룄 : " + b_latitudeD);
		double b_latitude = 0.0;
		if(!b_latitudeD.isEmpty()){
			b_latitude = Double.parseDouble(b_latitudeD);
			
		}

		String b_longitudeD = (String) map.get("b_longitude");
		System.out.println("寃쎈룄 : " + b_longitudeD);
		double b_longitude = 0.0;
		if(!b_longitudeD.isEmpty()){
			 b_longitude = Double.parseDouble(b_longitudeD);
	
		}

		String b_petpossible = (String) map.get("b_petpossible");
		System.out.println("�렖 媛��뒫 �뿬遺� : " + b_petpossible);
		String id ="";
		if(session.getAttribute("email") !=null){
		 id = (String) session.getAttribute("email");
		}else{
			 id = (String)session.getAttribute("brokerid");
		}
		
		System.out.println("媛��엯�옄 �씠硫붿씪 : " + id);
		
		int rr = (int)(Math.random()* 99999);
		System.out.println("諛⑸쾲�샇 : "+rr);
		
		//몽고에 방번호 삽입
		File file1 = new File("/images/사진/" +rr);
		
		String filepath = file1.getPath();
		String realpath = (String)req.getRealPath(filepath);
		System.out.println("절대 경로는 과연 잘 나올가?  ===> "+realpath);
		File Dir = new File(realpath);
		System.out.println(Dir.getPath());
		
		while(true){
			Dir.mkdirs();
			iDao.insert(rr,id);
			if(Dir.exists()){
				break;
			}
		}
		
		Map mongomap = new HashMap<>();
		List mongolist = new ArrayList<>();
		String sell_num_string = String.valueOf(rr);
		mongomap.put("num", sell_num_string);
		
		
		
		for ( int i=0; i<file.length; i++) {
			if (file[i].getOriginalFilename().equals("")) {
				continue;
			} else {
				System.out.println("파일이 잘 넘어 왔나요?====> " + file[i].getOriginalFilename());
				String mdm = file[i].getOriginalFilename();
				System.out.println("파일 잘 들어갔나요? ---> "+mdm.toString());
				InputStream fis = file[i].getInputStream();
				FileOutputStream fos = new FileOutputStream(realpath+"/"+i+".jpg");
				//몽고 데이터 삽입
				mongolist.add("/images/사진/"+sell_num_string+"/"+i+".jpg");
				
				int size = 0;
					while((size = fis.read())!= -1){
							fos.write(size);
					}
					fos.flush();
					fos.close();
					fis.close();
			}
		}
		mongomap.put("pictures", mongolist);
		template.insert(mongomap,"room");
		
		Rmap.put("id", id);
		Rmap.put("sell_num", rr);
		Rmap.put("b_title", b_title);
		Rmap.put("b_deposit", b_deposit);
		Rmap.put("b_mpay", b_mpay);
		Rmap.put("b_rkind", b_rkind);
		Rmap.put("b_floor", b_floor);
		Rmap.put("b_floor_all", b_floor_all);
		Rmap.put("b_size_m2", b_size_m2);
		Rmap.put("b_glist", str);				// 愿�由щ퉬 �룷�븿 �빆紐�
		Rmap.put("b_size", b_size);
		Rmap.put("b_gpay", b_gpay);
		Rmap.put("b_option", strr);    // 異붽� �샃�뀡
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
			mav.addObject("addroom","방등록이 완료 되었습니다!!");
		
		}else{
			mav.setViewName("t_main");
		}
		Cookie[] cookies = req.getCookies();
		Map latelymap = new HashMap<>();
		List latelylist = new ArrayList<>();
		
		if (cookies != null) {
			int rr1 = cookies.length;
			System.out.println(rr1);
			if (rr1 > 1) {
				for (Cookie cc : cookies) {
					if (!(cc.getName().equals("JSESSIONID"))) {
						int regNum = Integer.parseInt(cc.getValue());
						latelymap = lDao.getLatelyList(regNum);
						if(latelymap==null)
							latelymap = new HashMap<>();
						System.out.println(cc.getValue());

						String ar1 = mDao.OneImage(String.valueOf(regNum));
						latelymap.put("url", ar1);
						System.out.println(ar1);
						latelylist.add(latelymap);
					}
				}
			}

		}
		List news = nDao.get_news();
		mav.addObject("news",news);
		mav.addObject("size", latelylist.size());
		mav.addObject("list", latelylist);
		return mav;

	}

}
