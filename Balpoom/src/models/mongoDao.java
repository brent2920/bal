package models;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Service;

//이미지 경로를 몽고에 넣는 모델
@Service
public class mongoDao {
	public int inserImg() throws IOException {
		int r = 0;
		Map<String, Object> map = new HashMap<>();

		BufferedReader brr = new BufferedReader(new FileReader("d:\\numbers.txt"));

		while (true) {
			String str1 = brr.readLine();

			try {
				Document doc = Jsoup.connect("https://www.zigbang.com/items1/"+ str1).get();
				Element image = doc.select(".bxslider").get(0);

				String[] images = image.html().toString().split("\\n");

				for (int i = 0; i < images.length; i++) {
					String imtag = images[i].substring(images[i].indexOf("=") + 2, images[i].indexOf("data") - 2);
					System.out.println(imtag);
				}
				System.out.println("=====================================");
			} catch (Exception e) {
				continue;
			}
			if (str1 == null)
				break;
		}
		brr.close();

		return r;
	}
}
