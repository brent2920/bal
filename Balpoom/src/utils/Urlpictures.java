package utils;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

@Service
public class Urlpictures {

	public List<String> get_picture_urls(String url) {
		Document doc;
		String jpgurl = null;
		List<String> arr = new ArrayList<>();
		String check = "defualt";
		int i = 0;
		while (check != null) {
			try {

				check = "http://z1.zigbang.com/items/7697786/538ec7a16033f0c32eac29ac50deb04a1e6bf3ba.jpg?h=800&q=60";
				check = Jsoup.connect(url).get().select("img[src$=.jpg?h=800&q=60]").get(i).absUrl("src");
				i++;
				arr.add(check);

			} catch (Exception e) {
				//e.printStackTrace();
				break;

			}

		}

		return arr;

	}

}