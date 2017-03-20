package utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Urlpicture {
	
	public String get_main_url(String url) {
		Document doc;
		String jpgurl = null;
	try{
		
		jpgurl = "http://z1.zigbang.com/items/7697786/538ec7a16033f0c32eac29ac50deb04a1e6bf3ba.jpg?h=800&q=60";
		jpgurl = Jsoup.connect(url).get().select("img[src$=.jpg?h=800&q=60]").get(0).absUrl("src");	
	
	
	}catch(Exception e){
		//e.printStackTrace();
	
	}finally{
		
		return jpgurl;
	}

	
	
	
		
	}
	

}
