package kr.or.iei.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	SqlSession sqlsession;
	
	
}
