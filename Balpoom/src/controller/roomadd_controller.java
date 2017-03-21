package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/")
public class roomadd_controller {
		
	@RequestMapping("roomadd")
	public ModelAndView mav(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomadd");
		return mav;
	}
	
	@RequestMapping("/roomMap")
	@ResponseBody
	public Map mav(@RequestParam (name="map") String addMap) throws IOException{
		ModelAndView mav = new ModelAndView();
		addMap = addMap.replaceAll("\\s","");
		String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + addMap
				+ "&key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&language=ko";
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
	
}
