package controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import models.roomDao;
import utils.Urlpicture;
@Controller
public class gomap_controller {
	
	// search paging ajax 처리
		@RequestMapping("/gomapin")
		@ResponseBody
		public String google_map_geo(@RequestParam Map n, HttpServletRequest req, HttpServletResponse resp) {
			String info = null;
			try {
				info = (String) n.get("info");
				System.out.println("gomapin=>"+ info);
				String[] strr =  info.split(",");
			    String lat = strr[0].substring(2, strr[0].length());
				String lng = strr[1].substring(0, strr[1].length()-1);
				String latf = strr[2].substring(2,strr[2].length());
				String lngf = strr[3].substring(1, strr[3].length());
			    System.out.println("lat=> "+lat +" lng=>"+ lng );
			    System.out.println("latf=>"+ latf + " lngf=>"+ lngf);
			    
			} catch (Exception e) {
				e.printStackTrace();
			}

			return info;

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
