package site.inthebus.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import site.inthebus.database.SqlSessionManager;

public class TestMemberDAO {
	
	private static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int testJoin(TestMemberDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("testJoin", dto);
		session.close();
		return row;
	}

}
