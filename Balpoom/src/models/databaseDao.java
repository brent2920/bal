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
		try {

			Map<String, Object> map = new HashMap<>();

			BufferedReader brr = new BufferedReader(new FileReader("D:\\numbers.txt"));

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

				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject) jp.parse(result);
				JSONArray ja = (JSONArray) jo.get("items");
				JSONObject joo = (JSONObject) ja.get(0);
				JSONObject jo1 = (JSONObject) joo.get("item");

				int sell_num = Integer.parseInt(jo1.get("id").toString());
				String b_title = joo.get("title").toString();
				int b_deposit = Integer.parseInt(jo1.get("deposit").toString());
				int b_mpay = Integer.parseInt(jo1.get("rent").toString());
				String b_rkind = jo1.get("room_type").toString();
				String b_floor = jo1.get("floor").toString() + "/" + jo1.get("floor_all").toString();
				String b_area = jo1.get("size_m2").toString() + "/" + jo1.get("size").toString();

				String b_gpay = jo1.get("manage_cost").toString();
				String b_glist = jo1.get("manage_cost_inc").toString();
				String b_eleve = jo1.get("elevator").toString();
				String b_parking = jo1.get("parking").toString();
				String b_rinfo = jo1.get("title").toString();
				String b_enterdate = jo1.get("movein_date").toString();
				String b_option = jo1.get("options").toString();
				String b_detail = jo1.get("description").toString();
				String b_location = jo1.get("address1").toString();
				String id = jo1.get("user_email").toString();
				String b_nstation = jo1.get("near_subways").toString();
				String b_petpossible = jo1.get("pets_text").toString();
				String[] str = jo1.get("random_location").toString().split(",");
				double b_latitude = Double.parseDouble(str[0]);
				double b_longitude = Double.parseDouble(str[1]);

				map.put("sell_num", sell_num);
				map.put("b_title", b_title);
				map.put("b_deposit", b_deposit);
				map.put("b_mpay", b_mpay);
				map.put("b_rkind", b_rkind);
				map.put("b_floor", b_floor);
				map.put("b_area", b_area);
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

				r = session.insert("room.insertList", map);
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

	public int Test02() throws Exception {
		int r =0;
		SqlSession session = factory.openSession();
		try {

			Map<String, Object> map = new HashMap<>();

			BufferedReader brr = new BufferedReader(new FileReader("d:\\numbers.txt"));

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

				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject) jp.parse(result);
				JSONArray ja = (JSONArray) jo.get("items");
				JSONObject joo = (JSONObject) ja.get(0);
				JSONObject jo1 = (JSONObject) joo.get("item");

				String bk_officename = jo1.get("agent_name").toString();
				String bk_num = jo1.get("bjd_code").toString();
				String bk_address = jo1.get("agent_address1").toString();
				String bk_agentnum = jo1.get("agent_phone").toString();
				String bk_regname = jo1.get("user_name").toString();
				String bk_contact = jo1.get("original_user_phone").toString();
				String bk_email = jo1.get("agent_email").toString();
				String bk_password = jo1.get("user_no").toString();
				String id = jo1.get("user_email").toString();

				map.put("bk_officename", bk_officename);
				map.put("bk_num", bk_num);
				map.put("bk_address", bk_address);
				map.put("bk_agentnum", bk_agentnum);
				map.put("bk_regname", bk_regname);
				map.put("bk_contact", bk_contact);
				map.put("bk_email", bk_email);
				map.put("bk_password", bk_password);
				map.put("id", id);

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
