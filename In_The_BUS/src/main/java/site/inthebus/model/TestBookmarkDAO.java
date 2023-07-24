package site.inthebus.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import site.inthebus.database.SqlSessionManager;

public class TestBookmarkDAO {
	
	private static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertBookmark(TestBookmarkDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("insertBookmark", dto);
		session.close();
		
		return row;		
	}
	
	public TestBookmarkDTO duplicationCheck(TestBookmarkDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		TestBookmarkDTO result = session.selectOne("duplicationCheck", dto);
		session.close();
		
		return result;
		
	}
	
	public int deleteBookmark(TestBookmarkDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deleteBookmark", dto);
		session.close();
		
		return row;
	}

}
