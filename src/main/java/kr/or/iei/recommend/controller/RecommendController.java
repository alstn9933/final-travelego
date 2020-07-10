package kr.or.iei.recommend.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kr.or.iei.common.model.vo.BoardComment;
import kr.or.iei.common.model.vo.Liked;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.Bookmark;
import kr.or.iei.recommend.model.service.RecommendService;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.recommend.model.vo.SelectItems;


@Controller
public class RecommendController {

	@Autowired
	@Qualifier("recommendService")
	private RecommendService service;
	
	@RequestMapping(value="/recommendList.do")
	public String regionList(Model model, HttpServletRequest req) {
		int reqPage = Integer.parseInt(req.getParameter("reqPage"));
		
		ArrayList<Region> country = service.selectAllRegion();
		HashMap<String, Object> map = service.selectAllRec(reqPage);
		
		ArrayList<Recommend> recList = (ArrayList<Recommend>) map.get("list");
	
		model.addAttribute("pageNavi",map.get("pageNavi"));
		model.addAttribute("country",country);
		model.addAttribute("recList",recList);
		return "recommend/recList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCity.do", produces="application/json;charset=utf-8")
	public String selectCity(String country) {
		ArrayList<Region> cities = service.selectCities(country);
		return new Gson().toJson(cities);
	}
	
	@RequestMapping(value="/sort.do")
	public String sort(HttpServletRequest request, Model model, HttpServletRequest req) {
		int reqPage = Integer.parseInt(req.getParameter("reqPage"));
		ArrayList<Region> countries = service.selectAllRegion();
		String country = request.getParameter("regionCountry");
		String city = request.getParameter("regionCity");
		int category = Integer.parseInt(request.getParameter("recCategory"));
		String search = request.getParameter("search");
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("country", country);
		map.put("city", city);
		map.put("category", category);
		map.put("search", search);
		map.put("reqPage", reqPage);
		
		HashMap<String, Object> map2 = service.selectRecList(map);
		ArrayList<Recommend> recList = (ArrayList<Recommend>) map2.get("list");
		model.addAttribute("pageNavi",map2.get("pageNavi"));
		model.addAttribute("recList",recList);
		model.addAttribute("country",countries);
		
		return "recommend/recList";
//		return "redirect:/recommendList.do?regionCountry="+country+"&regionCity="+city+"&recCategory="+category+"&search="+search;
	}
	
	@RequestMapping(value="/recWrite.do")
	public String recWrite(HttpSession session, Model model, Recommend rec, HttpServletRequest request) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		rec.setRecWriter(memberId);
		String p = request.getParameter("photo");
		int result = service.insertRec(rec,p);
		return "redirect:/recommendList.do?reqPage=1";
	}
	
	@RequestMapping(value="/recWriteFrm.do")
	public String recWriteFrm(Model model) {
		ArrayList<Region> country = service.selectAllRegion();
	//	ArrayList<Recommend> rec = service.selectAllRec();
		model.addAttribute("country",country);
	//	model.addAttribute("recList",rec);
		return "recommend/recWrite";
	}
	
	
	private long getCurrtTime() {
		Calendar today = Calendar.getInstance();
		return today.getTimeInMillis();
	}

	
	//이미지 서버 전송 시, 폴더에 저장
	@RequestMapping(value = "/uploadEditorImage.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = request.getRealPath("/upload/images/recommend");// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
			String ckUploadPath = path + "/" + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/imgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

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

	//이미지 등록 시, 에디터 화면에 노출
	@RequestMapping(value = "/imgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = request.getRealPath("/upload/images/recommend");;

		String sDirPath = path + "/" + uid + "_" + fileName;

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
		}
	}
	
	@RequestMapping(value="/recDetail.do")
	public String recDetail(int recNo, HttpServletRequest req, Model model, Recommend rec, BoardComment comment, HttpSession session) {
		int readCount = service.plusReadCount(recNo);
		rec = service.selectOneRec(recNo);
		int reqPage = Integer.parseInt(req.getParameter("reqPage"));
		int cntCom = service.selectCommentCount(recNo);
		HashMap<String, Object> map = service.selectComments(recNo,reqPage,cntCom);
		ArrayList<BoardComment> comments = (ArrayList<BoardComment>) map.get("list");
		String memberId = null;
		Liked checkLiked = null;
		Bookmark checkBookmark = null;
		if(session.getAttribute("member") != null) {
			memberId = ((Member)session.getAttribute("member")).getMemberId();
			checkBookmark  = service.bookmarkList(memberId, recNo);
			checkLiked = service.likedList(memberId,recNo);
		}
		String pageNavi = (String)map.get("pageNavi");
		model.addAttribute("rec",rec);
		model.addAttribute("comments",comments);
		model.addAttribute("bookmark",checkBookmark);
		model.addAttribute("liked",checkLiked);
		model.addAttribute("cntCom",cntCom);
		model.addAttribute("pageNavi",pageNavi);
		return "recommend/recDetail";
	}
	
	@RequestMapping(value="/insertComment.do")
	public String insertComment(BoardComment comment, HttpServletRequest req, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		int recNo = Integer.parseInt(req.getParameter("recNo"));
		comment.setCommentWriter(m.getMemberId());
		comment.setBoardNo(recNo);
		int result = service.insertComment(comment);
		return "redirect:/recDetail.do?reqPage=1&recNo="+recNo;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertBookmark.do", produces="application/json;charset=utf-8")
	public String insertBookmark(int recNo, HttpSession session) {
		String memberId = null;
		if(session.getAttribute("member") != null) {
			memberId = ((Member)session.getAttribute("member")).getMemberId();
		};	
		int result = service.insertBookmark(recNo, memberId);
		return "0";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteBookmark.do", produces="application/json;charset=utf-8")
	public String deleteBookmark(int recNo, HttpSession session) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		int result = service.deleteBookmark(recNo, memberId);
		return "0";
	}
	
	@ResponseBody
	@RequestMapping(value="/insertLike.do", produces="application/json;charset=utf-8")
	public int insertLike(int recNo, HttpSession session, Recommend rec) {
		String memberId = null;
		if(session.getAttribute("member") != null) {
			memberId = ((Member)session.getAttribute("member")).getMemberId();
		};	
		int result = service.insertLike(recNo, memberId);
		rec = service.selectOneRec(recNo);
		return rec.getCnt();
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteLike.do", produces="application/json;charset=utf-8")
	public int deleteLike(int recNo, HttpSession session, Recommend rec) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		int result = service.deleteLike(recNo, memberId);
		rec = service.selectOneRec(recNo);
		return rec.getCnt();
	}
	
	@RequestMapping(value="/deleteComment.do")
	public String deleteComment(int commentNo, int recNo) {
		int result = service.deleteComment(commentNo);
		return "redirect:/recDetail.do?reqPage=1&recNo="+recNo;
	}
	
	@RequestMapping(value="/updateRecFrm.do")
	public String updateRecFrm(Recommend rec, Model model) {
		rec = service.selectOneRec(rec.getRecNo());
		ArrayList<Region> country = service.selectAllRegion();
		model.addAttribute("country",country);
		model.addAttribute("rec",rec);
		return "recommend/recUpdate";
	}
	
	@RequestMapping(value="/recUpdate.do")
	public String updateRec(Recommend rec, HttpServletRequest req) {
		rec = service.selectOneRec(rec.getRecNo());
		String p = req.getParameter("photo");
		System.out.println(rec.getRecNo());
		int result = service.updateRec(rec,p);
		return "redirect:/recommendList.do?reqPage=1";
		
	}
	
	@RequestMapping(value="/deleteRec.do")
	public String deleteRec(int recNo) {
		int result = service.deleteRec(recNo);
		return "redirect:/recommendList.do";
	}
	
	@RequestMapping(value="/amendComment.do")
	public String updateComment(int commentNo, int recNo, BoardComment c, HttpServletRequest req) {
		String commentContent = req.getParameter("amendComment");
		c.setCommentNo(commentNo);
		c.setBoardNo(recNo);
		c.setCommentContent(commentContent);
		int result = service.updateComment(c);
		return "redirect:/recDetail.do?reqPage=1&recNo="+recNo;
	}
}
