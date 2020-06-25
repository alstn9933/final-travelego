package kr.or.iei.notice.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	public int totalcount() {
		return sqlsession.selectOne("notice.totalCount");
	}

	public List<Notice> noticeList(HashMap<String, Integer> map) {
		return sqlsession.selectList("notice.noticeList",map);
	}
	
}
