package models;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class databaseDao {
	@Autowired
	SqlSessionFactory factory;

	public int Test01() throws Exception {
		int r = 0;
		SqlSession session = factory.openSession();
		Map<String, Object> map = new HashMap<>();
		int cnt = 0;
		try {


			BufferedReader brr = new BufferedReader(new FileReader("D:\\3.21.txt"));

			while (true) {
			
				
				String str1 = brr.readLine();
				
				URL url = new URL("https://api.zigbang.com/v3/items?detail=true&item_ids=[" + str1 + "]");

				BufferedReader br = null;
				try {
					br = new BufferedReader(new InputStreamReader(url.openStream()));
				} catch (IOException e) {

//					e.printStackTrace();
					continue;
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

				JSONParser jp = new JSONParser(); //JSON-SIMPLE이라는 라이브러리에서 JSON을 파싱하기 위해 사용된 객체
				JSONObject jo = (JSONObject) jp.parse(result); //String을 JSONObject로 캐스팅해서 JSON형태로 변경
				JSONArray ja = (JSONArray) jo.get("items"); //JSON 형태에서 배열[]로 표시된 배열명을 추출
				JSONObject joo = (JSONObject) ja.get(0);//위에 배열명의 0번째 index를 가져옴
				JSONObject jo1 = (JSONObject) joo.get("item");//0번째 배열의 item이라는 컬럼명을 가져옴

				int sell_num = Integer.parseInt(jo1.get("id").toString()); //item 안에 있는 id의 value를 가져옴 아래로 같은 형태로 진행
				//id ===> room 테이블에서 sell_num으로 사용
				String b_title = joo.get("title").toString();
				//title ===> room 테이블에서 b_title로 사용
				int b_deposit = Integer.parseInt(jo1.get("deposit").toString());
				//deposit ===> room 테이블에서 b_deposit로 사용
				int b_mpay = Integer.parseInt(jo1.get("rent").toString());
				//rent ===> room 테이블에서 b_mpay로 사용
				String b_rkind = jo1.get("room_type").toString();
				//room_type ===> room 테이블에서 b_rkind로 사용
				String floor = jo1.get("floor").toString();
				
				String[] ar = new String[]{}; 
				String b_floor ="";
				
				if(!(floor.isEmpty())){
					
					if(floor.contains("/")){
						ar = floor.split("/");
						b_floor = ar[1].toString();
					}else{
						b_floor = floor;
					}
				}

				String b_floor_all = jo1.get("floor_all").toString();
				//floor_all ===> room 테이블에서 b_floor_all로 사용
				
				double b_size_m2 = Double.parseDouble(jo1.get("size_m2").toString());
				//size_m2 ===> room 테이블에서 b_size_m2로 사용
				double b_size = Double.parseDouble( jo1.get("size").toString());
				//size ===> room 테이블에서 b_size로 사용
				
				String b_gpay = jo1.get("manage_cost").toString();
				String b_glist = jo1.get("manage_cost_inc").toString();
				String b_eleve = jo1.get("elevator").toString();
				String b_parking = jo1.get("parking").toString();
				String b_rinfo = jo1.get("title").toString();
				String b_enterdate = jo1.get("movein_date").toString();
				String b_option = jo1.get("options").toString();
				String b_detail = jo1.get("description").toString().trim();
				String b_location = jo1.get("address1").toString();
				String id = jo1.get("user_email").toString();
				String b_nstation = jo1.get("near_subways").toString();
				String b_petpossible = jo1.get("pets_text").toString();
				String[] str = jo1.get("random_location").toString().split(",");
				double b_latitude = Double.parseDouble(str[0]);
				double b_longitude = Double.parseDouble(str[1]);
				String b_local1 = jo1.get("local1").toString();
				String b_local2 = jo1.get("local2").toString();
				String b_local3 = jo1.get("local3").toString();
				
				
				map.put("b_size_m2",b_size_m2);
				map.put("b_floor_all",b_floor_all);
				map.put("sell_num", sell_num);
				map.put("b_title", b_title);
				map.put("b_deposit", b_deposit);
				map.put("b_mpay", b_mpay);
				map.put("b_rkind", b_rkind);
				map.put("b_floor", b_floor);
				map.put("b_size", b_size);
				map.put("b_gpay", b_gpay);
				map.put("b_glist", b_glist);
				map.put("b_eleve", b_eleve);
				map.put("b_parking", b_parking);
				map.put("b_rinfo", b_rinfo);
				map.put("b_enterdate", b_enterdate);
				map.put("b_option", b_option);
				map.put("b_detail", b_detail);
				map.put("b_location", b_location);
				map.put("b_nstation", b_nstation);
				map.put("b_petpossible", b_petpossible);
				map.put("b_latitude", b_latitude);
				map.put("b_longitude", b_longitude);
				map.put("id", id);
				map.put("b_local1", b_local1);
				map.put("b_local2", b_local2);
				map.put("b_local3", b_local3);
				
				
				r = session.insert("room.insertList", map);
				if (r == 1) {
					cnt++;
					session.commit();
				}

				if (str1 == null)
					break;
			}
			brr.close();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
			
		}
		System.out.println(cnt);
		return r;
	}

	public int Test02() throws Exception {
		int r =0;
		SqlSession session = factory.openSession();
		try {

			Map<String, Object> map = new HashMap<>();

			BufferedReader brr = new BufferedReader(new FileReader("d:\\3.21.txt"));

			while (true) {

				String str1 = brr.readLine();

				URL url = new URL("https://api.zigbang.com/v3/items?detail=true&item_ids=[" + str1 + "]");

				BufferedReader br = null;
				try {
					br = new BufferedReader(new InputStreamReader(url.openStream()));
				} catch (IOException e) {

					e.printStackTrace();
					continue;
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

				JSONParser jp = new JSONParser(); //JSON-simple 라이브러리에서 JSONPaser라는 객체를 소환
				JSONObject jo = (JSONObject) jp.parse(result);//String 값을 JSONObject로 캐스팅
				JSONArray ja = (JSONArray) jo.get("items"); //items라는 배열로 된 JSON를 JSONArray로 캐스팅해서 index로 값을 뽑기 위해 준비
				JSONObject joo = (JSONObject) ja.get(0); //0번째 index를 추출해서 JSONObject로 캐스팅
				JSONObject jo1 = (JSONObject) joo.get("item"); // 0번째 index로 추출한 json형태에서 item을 추출
				
				

				String bk_officename = jo1.get("agent_name").toString();
				//agent_name ==> agent테이블명에서 bk_officename로 사용
				String bk_num = jo1.get("bjd_code").toString();
				//bjd_code ==> agent테이블명에서 bk_num로 사용
				String bk_address = jo1.get("agent_address1").toString();
				//agent_address1 ==> agent테이블명에서 bk_address로 사용
				String bk_agentnum = jo1.get("agent_phone").toString();
				//agent_phone ==> agent테이블명에서 bk_agentnum로 사용
				String bk_regname = jo1.get("user_name").toString();
				//user_name ==> agent테이블명에서 bk_regname로 사용
				String bk_contact = jo1.get("original_user_phone").toString();
				//original_user_phone ==> agent테이블명에서 bk_contact로 사용
				String bk_email = jo1.get("agent_email").toString();
				//agent_email ==> agent테이블명에서 bk_email로 사용
				String bk_password = jo1.get("user_no").toString();
				//user_no ==> agent테이블명에서 bk_password로 사용
				String id = jo1.get("user_email").toString();
				//user_email ==> agent테이블명에서 id로 사용
				
				
				int sell_num = Integer.parseInt(jo1.get("id").toString());

				map.put("bk_officename", bk_officename);
				map.put("bk_num", bk_num);
				map.put("bk_address", bk_address);
				map.put("bk_agentnum", bk_agentnum);
				map.put("bk_regname", bk_regname);
				map.put("bk_contact", bk_contact);
				map.put("bk_email", bk_email);
				map.put("bk_password", bk_password);
				map.put("id", id);
				map.put("sell_num", sell_num);
				
				 r = session.insert("agent.insertAgentList", map);
				if (r == 1) {
					session.commit();
				}

				if (str1 == null)
					break;
			}
			brr.close();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();

		}
		return r;
	}

	
}
