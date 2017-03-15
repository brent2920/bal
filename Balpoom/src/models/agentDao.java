package models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class agentDao {

	@Autowired
	SqlSessionFactory factory;

	/* ================================================================
	 * 방 정보 DB 저장
	 * insertAllRoom : 초기 데이터 세팅용
	 * insertOne : 방등록용
	 * ================================================================*/
	public int insertAllRoom(List<Map<String, Object>> rList) {
		SqlSession session = factory.openSession();
		System.out.println("DB Size : " + rList.size());
		int r = 0;

		try {
			for (int i = 0; i < rList.size(); i++) {
				r = session.insert("room.insertList", rList);
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
	}

	public int insertOneRoom(Map<String, Object> rInfo) {
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
	 * 방 정보 DB에서 가져오기
	 * getSelectedRoomInfo : 세부 방정보 화면 띄울 때
	 * insertOne : 방등록용
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
	
	
}