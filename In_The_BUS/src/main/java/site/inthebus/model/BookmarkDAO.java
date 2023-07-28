package site.inthebus.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import site.inthebus.database.SqlSessionManager;

public class BookmarkDAO {
	
	private static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertBookmark(BookmarkDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("insertBookmark", dto);
		session.close();
		
		return row;		
	}
	
	public BookmarkDTO duplicationCheck(BookmarkDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		BookmarkDTO result = session.selectOne("duplicationCheck", dto);
		session.close();
		
		return result;
		
	}
	
	public int deleteBookmark(BookmarkDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deleteBookmark", dto);
		session.close();
		
		return row;
	}

}
