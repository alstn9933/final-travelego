package kr.or.iei.tripboard.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.together.model.vo.TogetherCommentVO;
import kr.or.iei.tripboard.model.service.TripBoardService;
import kr.or.iei.tripboard.model.vo.TripBoardMyTripVO;
import kr.or.iei.tripboard.model.vo.TripBoardPageDTO;
import kr.or.iei.tripboard.model.vo.TripBoardVO;


@Controller
@RequestMapping("/tripboard")
public class TripBoardController {

	@Autowired
	@Qualifier("tripBoardService")
	TripBoardService service;
	
	@ResponseBody
	@RequestMapping(value = "/asyncBookmark.do", produces = "text/html;charset=utf-8")
	public String insertBookmark(HttpSession session, String boardNum) {

		Member member = (Member) session.getAttribute("member");
		int result = service.insertBookmark(member, boardNum);	
		
		return String.valueOf(result);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/asyncUnBookmark.do", produces = "text/html;charset=utf-8")
	public String deleteBookmark(HttpSession session, String boardNum) {

		Member member = (Member) session.getAttribute("member");
		int result = service.deleteBookmark(member, boardNum);	
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncLike.do", produces = "text/html;charset=utf-8")
	public String insertLike(HttpSession session, String boardNum) {
		Member member = (Member) session.getAttribute("member");
		int result = service.insertLike(member, boardNum);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncUnLike.do", produces = "text/html;charset=utf-8")
	public String deleteLike(HttpSession session, String boardNum) {
		Member member = (Member) session.getAttribute("member");
		int result = service.deleteLike(member, boardNum);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/search.do")
	public String searchBoard(int reqPage, String searchOption, String keyword, Model model) {
		
		TripBoardPageDTO pd = service.searchBoardList(reqPage, searchOption, keyword);
		
		model.addAttribute("list", pd.getBoardList());
		model.addAttribute("pageNavi", pd.getPageNavi());
		
		return "tripboard/main";
	}
	
	@RequestMapping(value = "/modComment.do")
	public String modifyComment(TogetherCommentVO comment, Model model) {
		
		int result = service.modifyComment(comment);
			
		if(result>0) {
			model.addAttribute("msg", "댓글을 수정했습니다.");
		} else {
			model.addAttribute("msg", "댓글을 수정에 실패했습니다.");
		}		
		model.addAttribute("loc","/tripboard/view.do?tripBoardNo="+comment.getBoardNo());
		return "common/msg";
	}
	
	@RequestMapping(value = "/deleteComment.do")
	public String deleteComment(int boardNo, int commentNo, Model model) {
		
		int result = service.deleteComment(commentNo);
		
		switch (result) {
		case -1:
			model.addAttribute("msg", "답글이 작성된 댓글은 삭제할 수 없습니다.");
			break;

		case 0:

			model.addAttribute("msg", "댓글 삭제에 실패했습니다.");
			break;
			
		case 1:

			model.addAttribute("msg", "댓글을 삭제했습니다.");
			break;
		}
		
		model.addAttribute("loc","/tripboard/view.do?tripBoardNo="+boardNo);
		return "common/msg";
	}
		
	@RequestMapping(value = "/writeComment.do")
	public String insertComment(TogetherCommentVO comment, Model model, HttpSession session) {
		int result = service.insertComment(session, comment); 
		
		if(result>0) {
			model.addAttribute("msg","댓글을 등록했습니다.");
		} else {
			model.addAttribute("msg","댓글 등록에 실패했습니다.");
		}
		model.addAttribute("loc","/tripboard/view.do?tripBoardNo="+comment.getBoardNo());
		return "common/msg";
	}
	
	@RequestMapping(value = "/view.do")
	public String selectOneBoard(HttpSession session, int tripBoardNo, Model model) {

		Member member = (Member) session.getAttribute("member");
		String memberId = null;
		
		if(member != null) {
			memberId = member.getMemberId();
		}
		
		TripBoardPageDTO pd = service.selectOneBoard(memberId, tripBoardNo);
		
		model.addAttribute("board", pd.getBoard());
		model.addAttribute("commentList", pd.getCommentList());
		return "tripboard/view";
	}                                        
	
	@RequestMapping(value = "/modifyFrm.do")
	public String modifyFrm(int boardNum, Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		ArrayList<TripBoardMyTripVO> list = service.selectTrip(member);
		TripBoardVO board = service.selectModifyBoard(boardNum);
		
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		return "tripboard/modify";
	}
	
	@RequestMapping(value = "/modify.do")
	public String modifyBoard(HttpSession session, MultipartFile file, TripBoardVO board, Model model) {
		
		int result = service.updateBoard(session, file, board);
		
		if(result>0) {
			model.addAttribute("msg", "게시글을 수정했습니다.");
			model.addAttribute("loc","/tripboard/main.do?reqPage=1");
			
		} else {
			model.addAttribute("msg", "게시글 수정에 실패했습니다.");
			model.addAttribute("loc","/tripboard/writeFrm.do");
		}
		
		return "common/msg";
	}
	
	@RequestMapping(value = "/delete.do")
	public String deleteBoard(int boardNum, Model model) {
		
		int result = service.deleteBoard(boardNum);
		
		if(result>0) {
			model.addAttribute("msg", "게시글을 삭제하였습니다.");
		} else {
			model.addAttribute("msg", "게시글 삭제에 실패했습니다.");
		}
		
		model.addAttribute("loc", "/tripboard/main.do?reqPage=1");
		return "common/msg";
	}

	@RequestMapping(value = "/write.do")
	public String insertTripBoard(HttpSession session, MultipartFile file, TripBoardVO board, Model model) {
		
		int result = service.insertBoard(session, file, board);
		
		if(result>0) {
			model.addAttribute("msg", "게시글을 등록했습니다.");
			model.addAttribute("loc","/tripboard/main.do?reqPage=1");
			
		} else {
			model.addAttribute("msg", "게시글 등록에 실패했습니다.");
			model.addAttribute("loc","/tripboard/writeFrm.do");
		}
		
		return "common/msg";
	}
	
	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload){
		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			String onlyFilename = fileName.substring(0,fileName.lastIndexOf("."));//확장자를 제외한 파일 이름(ex>test)
			String extension = fileName.substring(fileName.lastIndexOf("."));//확장자 이름(ex>.txt)
			String filepath = onlyFilename+"_"+Calendar.getInstance().getTimeInMillis()+extension;
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = request.getSession().getServletContext().getRealPath("/upload/images/tripboard/sub");
			String ckUploadPath = path + "/" + filepath;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			printWriter = response.getWriter(); 
			String fileUrl = "/tripboard/ckImgSubmit.do?filepath=" + filepath; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();					
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "filepath") String filepath,
			HttpServletRequest request, HttpServletResponse response){

		// 서버에 저장된 이미지 경로
		String path = request.getSession().getServletContext().getRealPath("/upload/images/tripboard/sub");

		String sDirPath = path + "/" + filepath;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();
				
				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}
				
				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if(fileInputStream != null) {
						fileInputStream.close();
						
					}
					if(outputStream != null) {
						outputStream.close();
					}
					if(out != null) {
						out.close();
					}				
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}			
		}
	}

	@ResponseBody
	@RequestMapping(value = "/asyncLoadTripRoute.do", produces = "application/json;charset=utf-8")
	public String loadTripRoute(int tripNo) {
		ArrayList<TripDetail> list = service.selectTripDetail(tripNo);
		return new Gson().toJson(list);
	}

	@RequestMapping("/writeFrm.do")
	public String writeFrm(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		ArrayList<TripBoardMyTripVO> list = service.selectTrip(member);
		model.addAttribute("list", list);
		return "tripboard/write";
	}

	@RequestMapping("/main.do")
	public String main(int reqPage, Model model) {
		if(reqPage == 0) {
			reqPage = 1;			
		}
		TripBoardPageDTO pd = service.selectBoardList(reqPage);
		model.addAttribute("list", pd.getBoardList());
		model.addAttribute("pageNavi", pd.getPageNavi());
		return "tripboard/main";
	}
}
