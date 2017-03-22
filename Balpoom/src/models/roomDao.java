package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class roomDao {

	@Autowired
	SqlSessionFactory factory;

	/* ================================================================
	 * DB서버에 데이터 등록
	 * setAllRoom : 초기 DB작업용 ==> databaseDao로 이동
	 * setOneRoom : 매물 등록용
	 * ================================================================*/

	public int setOneRoom(Map<String, Object> rInfo) {
		SqlSession session = factory.openSession();
		System.out.println("Room Info : " + rInfo.toString());
		int r = 0;

		try {
			r = session.insert("room.insertOne", rInfo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
	}
	
	
	/* ================================================================
	 * DB서버에서 데이터 가져오기
	 * getSelectedRoomInfo : 상세 매물정보 조회시 사용
	 * getRoomList : 방 검색화면에서 오른쪽 방 리스트 띄울 때
	 * ================================================================*/
	public HashMap<String, Object> getSelectedRoomInfo(int regNum) {
		SqlSession session = factory.openSession();
		System.out.println("Registration Number : " + regNum);
		
		HashMap<String, Object> rInfo = null;
		
		try {
			rInfo = new HashMap<>();
			rInfo = session.selectOne("room.getRoomInfo", regNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rInfo;
	}

	public List<HashMap<String, Object>> getRoomList(List<HashMap<String, Double>> viewport) {
		SqlSession session = factory.openSession();
		System.out.println("Viewport Values : " + viewport.toString());
		List<HashMap<String, Object>> rList = null;
		
		try {
			rList = new ArrayList<>();
			rList = session.selectList("room.getRoomList", viewport);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rList;
	}
	
	public List<HashMap<String,Object>> test_room(){  //테스트 용이니까 신경쓰지 말것 
		SqlSession session = factory.openSession();
		List<HashMap<String,Object>> rList = null;
		
		try {
			rList = new ArrayList<>();
			rList = session.selectList("room.room_deposit");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return rList;
		
	}
}