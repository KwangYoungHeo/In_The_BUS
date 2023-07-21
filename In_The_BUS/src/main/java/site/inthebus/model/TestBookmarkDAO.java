package site.inthebus.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import site.inthebus.database.SqlSessionManaver;

public class TestBookmarkDAO {
	
	private static SqlSessionFactory sqlSessionFactory = SqlSessionManaver.getSqlSession();
	
	public int insertBookmark(TestBookmarkDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("insertBookmark", dto);
		session.close();
		
		return row;		
	}

}
