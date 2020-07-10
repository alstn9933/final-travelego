package kr.or.iei.tripboard.model.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.together.model.vo.TogetherCommentVO;
import kr.or.iei.tripboard.model.dao.TripBoardDao;
import kr.or.iei.tripboard.model.vo.TripBoardMyTripVO;
import kr.or.iei.tripboard.model.vo.TripBoardPageDTO;
import kr.or.iei.tripboard.model.vo.TripBoardVO;

@Service("tripBoardService")
public class TripBoardService {
	
	@Autowired
	@Qualifier("tripBoardDao")
	TripBoardDao dao;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. MM. dd.");

	public ArrayList<TripBoardMyTripVO> selectTrip(Member member) {
		return (ArrayList<TripBoardMyTripVO>)dao.selectTrip(member.getMemberId());
	}

	public ArrayList<TripDetail> selectTripDetail(int tripNo) {
		return (ArrayList<TripDetail>)dao.selectTripDetail(tripNo);
	}

	@Transactional
	public int insertBoard(HttpSession session, MultipartFile file, TripBoardVO board) {
		

		int result = dao.insertBoard(board);
		
		
		if(!file.isEmpty() && result>0) {
			// 저장 경로
			String savePath = session.getServletContext().getRealPath("/upload/images/tripboard/main/");
			
			// 업로드한 파일의 실제 파일명
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			
			String fileName = String.valueOf(board.getTripBoardNo());
			
			String fullpath = savePath+fileName+extension;
			
			try {
				byte[] bytes = file.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
				
				Photo photo = new Photo();
				
				photo.setBoardClass(3);
				photo.setBoardNo(board.getTripBoardNo());
				photo.setFilename(fileName+extension);
				photo.setFilepath("/upload/images/tripboard/main/"+fileName+extension);
				
				result = dao.insertPhoto(photo);				
			} catch (IOException e) {
				e.printStackTrace();
			} 		
		}
		
		return result;
	}

	public TripBoardPageDTO selectBoardList(int reqPage) {
		int totalCount = dao.countBoard();
		
		int numPerPage = 12;
		
		int totalPage = 0;
		
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage; 
		} else {
			totalPage = totalCount/numPerPage +1;
		}
		
		int start = (reqPage - 1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		List list = dao.selectBoardList(map); 
		
		StringBuffer pageNavi = new StringBuffer();
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		pageNavi.append("<ul class='pagination'>");
		
		if(pageNo != 1) {
			pageNavi.append("<li class='page-item'>");
			pageNavi.append("<a class='page-link' href='/tripboard/main.do?reqPage="+(pageNo-1)+"' aria-labe='Previous'><span aria-hidden='true'>&laquo;</span></a>");
			pageNavi.append("</li>");
		}
		
		for(int i=0; i<pageNaviSize; i++) {
			pageNavi.append("<li class='page-item'>");
			if(reqPage==pageNo) {
				pageNavi.append("<a class='page-link current-page' href='javascript:void(0)'>"+pageNo+"</a>");
			} else {
				pageNavi.append("<a class='page-link' href='/tripboard/main.do?reqPage="+pageNo+"'>"+pageNo+"</a>");
			}
			pageNavi.append("</li>");
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}			
		}
		
		if(pageNo <= totalPage) {
			pageNavi.append("<li class='page-item'>");
			pageNavi.append("<a class='page-link' href='/tripboard/main.do?reqPage="+pageNo+"' aria-label='Next'>");
			pageNavi.append("<span aria-hidden='true'>&raquo;</span>");
			pageNavi.append("</a></li>");			
		}
		
		pageNavi.append("</ul>");
		
		TripBoardPageDTO pd = new TripBoardPageDTO();
		pd.setBoardList((ArrayList<TripBoardVO>)list);
		pd.setPageNavi(pageNavi.toString());
		return pd;
	}

	public TripBoardPageDTO selectOneBoard(int tripBoardNo) {
		
		TripBoardPageDTO pd = new TripBoardPageDTO();		
		TripBoardVO vo = dao.selectOneBoard(tripBoardNo);
		ArrayList<TogetherCommentVO> commentList = (ArrayList<TogetherCommentVO>) dao.selectCommentList(tripBoardNo);
		String today = dateFormat.format(Calendar.getInstance().getTime());
		for(TogetherCommentVO comment : commentList) {
			if(comment.getCommentDate().equals(today)) {
				comment.setCommentDate(comment.getCommentTime());
			}
		}
		vo.setCommentCount(commentList.size());
		pd.setBoard(vo);
		pd.setCommentList(commentList);
		return pd;
	}

	public int deleteBoard(int boardNum) {
		return dao.deleteBoard(boardNum);
	}

	public int updateBoard(HttpSession session, MultipartFile file, TripBoardVO board) {

		int result = dao.updateBoard(board);
		
		
		if(result > 0 && !file.isEmpty()) {
			// 저장 경로
			String savePath = session.getServletContext().getRealPath("/upload/images/tripboard/main/");
			
			// 업로드한 파일의 실제 파일명
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			
			String fileName = String.valueOf(board.getTripBoardNo());
			
			String fullpath = savePath+fileName+extension;
			
			File f = new File(fullpath);
			
			if(f.exists() && f.delete()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
					bos.write(bytes);
					bos.close();									
				} catch (IOException e) {
					e.printStackTrace();
				} 		
			} else {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
					bos.write(bytes);
					bos.close();
					
					Photo photo = new Photo();
					
					photo.setBoardClass(3);
					photo.setBoardNo(board.getTripBoardNo());
					photo.setFilename(fileName+extension);
					photo.setFilepath("/upload/images/tripboard/main/"+fileName+extension);
					
					result = dao.insertPhoto(photo);				
				} catch (IOException e) {
					e.printStackTrace();
				} 		
			}
		}
		
		return result;
	}

	public TripBoardVO selectModifyBoard(int boardNum) {
		return dao.selectOneBoard(boardNum);
	}

	public int insertComment(HttpSession session, TogetherCommentVO comment) {
		Member member = (Member) session.getAttribute("member");
		comment.setCommentWriter(member.getMemberId());
		System.out.println(comment.getRefComment());
		return dao.insertComment(comment);
	}

	public int deleteComment(int commentNo) {
		
		int result = dao.checkRef(commentNo);
		
		if(result>0) {
			result = -1;
		} else {
			result = dao.deleteComment(commentNo);
		}
		
		return result;
	}

	public int modifyComment(TogetherCommentVO comment) {
		return dao.updateComment(comment);
	}
	
	
}
