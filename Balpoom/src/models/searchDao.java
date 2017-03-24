package models;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class searchDao {

	// 메인화면에서 검색 키워드 입력시 해당 키워드의 좌표값 얻어오는 메서드
	public HashMap<String, Double> getLatLng(String keyword) throws Exception {
		HashMap<String, Double> latLng = new HashMap<>();
		
		URL url = new URL(
			"https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + keyword + "&key=AIzaSyCjJDAVTrB1J5P1OllkHC07cmjfJbb52vg"
		);

		
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(url.openStream()));
		} catch (IOException e) {
		}
		
		String result = "";
		
		while (true) {
			String str = br.readLine();
			if (str == null) {
				break;
			} else
				result += str;
		}
		br.close();
		
		
		JSONParser jp = new JSONParser();
		JSONObject json1 = (JSONObject) jp.parse(result);
		JSONArray json2 = (JSONArray) json1.get("results");
		JSONObject json3 = (JSONObject) json2.get(0);
		JSONObject geometry = (JSONObject) json3.get("geometry");
		JSONObject location = (JSONObject) geometry.get("location");
		
		
		Double lat = Double.parseDouble(location.get("lat").toString());
		Double lng = Double.parseDouble(location.get("lng").toString());
		
		latLng.put("lat", lat);
		latLng.put("lng", lng);
		
		return latLng;
	}
}
