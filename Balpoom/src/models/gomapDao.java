package models;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class gomapDao {
	@Autowired
	SqlSessionFactory factory;

	public List<Map> gomap(Map map) {
		SqlSession session = factory.openSession();
		List<Map>  hmap = new ArrayList();
		try {
			hmap =  session.selectList("gomap.locations",map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return hmap;

	}
}
