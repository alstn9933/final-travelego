package kr.or.iei.tripboard.model.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

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
import kr.or.iei.tripboard.model.dao.TripBoardDao;
import kr.or.iei.tripboard.model.vo.TripBoardMyTripVO;
import kr.or.iei.tripboard.model.vo.TripBoardVO;

@Service("tripBoardService")
public class TripBoardService {
	
	@Autowired
	@Qualifier("tripBoardDao")
	TripBoardDao dao;

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

	public ArrayList<TripBoardVO> selectBoardList(int reqPage) {
		
		
		
		return null;
	}
	
	
}
