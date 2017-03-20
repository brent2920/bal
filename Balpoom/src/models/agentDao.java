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
	 * 중개인 정보 DB서버에 등록
	 * insertAllAgent : 초기 중개인 데이터 등록용 ==> databaseDao로 이동
	 * insertOne : 중개인 정보 DB서버에 저장
	 * ================================================================*/

	public int insertOneAgent(Map<String, Object> rInfo) {
		SqlSession session = factory.openSession();
		System.out.println("Agent Info : " + rInfo.toString());
		int r = 0;

		try {
			r = session.insert("agent.insertOneAgent", rInfo);
			if(r==1)
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return r;
	}
	
	
	/* ================================================================
	 * 중개인 정보 가져오기
	 * getSelectedRoomAgentInfo : 중개인 정보 가져오기
	 * ================================================================*/
	public HashMap<String, Object> getSelectedRoomAgentInfo(int agntNum) {
		SqlSession session = factory.openSession();
		System.out.println("Agent Number : " + agntNum);
		
		HashMap<String, Object> rInfo = null;
		
		try {
			rInfo = new HashMap<>();
			rInfo = session.selectOne("agent.getAgentInfo", agntNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rInfo;
	}
}