
package models;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utils.APIKeys;

@Service
public class searchDao {
	
	@Autowired
	APIKeys apiKey;

	// 검색 키워드가 검색조건(지역명, 지하철역명)에 해당하는지 체크
	public boolean keywordCheck(String keyword) {
		
		boolean check = false;
		String result = "";
		String kwd = keyword.replaceAll("\\s", "");
		
		URL url;
		try {
			url = new URL(
				"https://maps.googleapis.com/maps/api/place/textsearch/json?query=" 
						+ kwd + "&key=" + apiKey.getGOOGLE_MAP_KEY()
			);
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
			return false;
		}

		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(url.openStream()));
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
			JSONArray types = (JSONArray) json3.get("types");
			
			for(int i=0; i<types.size(); i++) {
				String type = types.get(i).toString();
				System.out.println("Type : " + type);
				
				if(type.equals("subway_station")) {
					check = true;
					break;
				} else if(type.equals("transit_station")) {
					check = true;
					break;
				} else if(type.equals("sublocality_level_2")) {
					check = true;
					break;
				} else if(type.equals("sublocality")) {
					check = true;
					break;
				} else if(type.equals("political")) {
					check = true;
					break;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return check;
	}
	
	// 메인화면에서 검색 키워드 입력시 해당 키워드의 좌표값 얻어오는 메서드
	public HashMap<String, Double> getLatLng(String keyword) throws Exception {
		HashMap<String, Double> latLng = new HashMap<>();
		String result = "";
		String kwd = keyword.replaceAll("\\s", "");
		
		URL url = new URL(
			"https://maps.googleapis.com/maps/api/place/textsearch/json?query=" 
					+ kwd + "&key=" + apiKey.getGOOGLE_MAP_KEY()
		);

		
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			while (true) {
				String str = br.readLine();
				if (str == null) {
					break;
				} else
					result += str;
			}
			br.close();
			
			
			JSONParser jp = new JSONParser();
			System.out.println("JSONParser : " + jp.toString());
			System.out.println("is Null? " + (jp.toString().isEmpty()));
			JSONObject json1 = (JSONObject) jp.parse(result);
			System.out.println("result : " + result.toString());
			JSONArray json2 = (JSONArray) json1.get("results");
			JSONObject json3 = (JSONObject) json2.get(0);
			JSONObject geometry = (JSONObject) json3.get("geometry");
			JSONObject location = (JSONObject) geometry.get("location");
			
			
			Double lat = Double.parseDouble(location.get("lat").toString());
			Double lng = Double.parseDouble(location.get("lng").toString());
			
			
			latLng.put("lat", lat);
			latLng.put("lng", lng);
		} catch (IOException e) {
			return null;
		}
		
		return latLng;
	}
}

