package kr.or.iei.notice.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.notice.model.dao.NoticeDao;
import kr.or.iei.notice.model.vo.Notice;
import kr.or.iei.notice.model.vo.NoticePageDate;

@Service("noticeService")
public class NoticeService {
	@Autowired
	@Qualifier("noticeDao")
	private NoticeDao dao;

	public NoticePageDate noticeList(int reqPage) {
		int totalCount = dao.totalcount();
		int numPerPage=10;
		int totalPage =0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer>map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end",end);
		List<Notice>list = dao.noticeList(map);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1; 
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageDate npd= new NoticePageDate(list,pageNavi);
		return npd;
		
	}

	public Notice noticeView(Notice n) {
		int viewCount = dao.updateCount(n);
		Notice notice = dao.noticeView(n);
		
		return notice; 
	}

	public int noticeInsert(Notice n) {
		return dao.noticeInsert(n);
	}

	public Notice selectOne(Notice n) {
		return dao.selectOne(n);
	}

	public int noticeModify(Notice n) {
		return dao.noticeModify(n);
	}
}
