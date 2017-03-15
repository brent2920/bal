package models;

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
	 * �� ���� DB ����
	 * insertAllRoom : �ʱ� ������ ���ÿ�
	 * insertOne : ���Ͽ�
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
	 * �� ���� DB���� ��������
	 * insertAllRoom : �ʱ� ������ ���ÿ�
	 * insertOne : ���Ͽ�
	 * ================================================================*/
}