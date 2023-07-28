package site.inthebus.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import site.inthebus.model.BusDataDTO;

import site.inthebus.database.SqlSessionManager;

public class BusDataDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int inCount(BusDataDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int count = session.selectOne("inCount", dto);
		session.close();
		
		return count;
	}
	
	public int outCount(BusDataDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int count = session.selectOne("outCount", dto);
		session.close();
		
		return count;
	}

}
