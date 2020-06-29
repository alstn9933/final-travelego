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

	public Notice noticeView(Notice n) {
		return sqlsession.selectOne("notice.noticeView",n);
	}

	public int noticeInsert(Notice n) {
		return sqlsession.insert("notice.noticeInsert",n);
	}

	public Notice selectOne(Notice n) {
		return sqlsession.selectOne("notice.selectOne",n);
	}

	public int noticeModify(Notice n) {
		return sqlsession.update("notice.noticeModify",n);
	}

	public int updateCount(Notice n) {
		return sqlsession.update("notice.noticeCount",n);
	}


	
}
