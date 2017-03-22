package javasource;

import java.io.BufferedReader;
import java.io.File;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

import java.io.OutputStream;
import java.net.URL;

import java.util.HashMap;
import java.util.Map;



import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class imageDown {
	
	public static void main(String[] args) throws IOException {
		Map<String, Object> map = new HashMap<>();

		BufferedReader brr = new BufferedReader(new FileReader("d:\\3.21.txt"));

		while (true) {
			String str1 = brr.readLine();

			try {
				Document doc = Jsoup.connect("https://www.zigbang.com/items1/"+ str1).get();
				Element image = doc.select(".bxslider").get(0);
				String[] images = image.html().toString().split("\\n");

				for (int i = 0; i < images.length; i++) {
					String imtag = images[i].substring(images[i].indexOf("=") + 2, images[i].indexOf("data") - 2);
					File file = new File("d:/이현원/사진/"+str1);
					
					if(!file.exists()){
						file.mkdirs();
						System.out.println(str1+"를 생성하였음");
					}
					System.out.println(imtag);
					//====================================================
					URL url = new URL(imtag);
					InputStream is = url.openStream();
					OutputStream fos = new FileOutputStream(file+ "/" + i + ".jpg");
					
					int bb;
					while((bb = is.read())!=-1){
						fos.write(bb);
					}
					
					is.close();
					fos.close();
					

				}
				System.out.println("=====================================");
			} catch (Exception e) {
				continue;
			}
			if (str1 == null)
				break;
		}
		brr.close();
	}
}
