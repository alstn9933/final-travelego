package kr.or.iei.tour.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.tour.model.service.TourService;
import kr.or.iei.tour.model.vo.TourVO;

@Controller
public class TourController {
	@Autowired
	@Qualifier("tourService")
	private TourService service;
	
	@RequestMapping(value="/tourList.do")
	public String selectTourList(Model model) {
		return "tour/tourList";
	}
	
	@RequestMapping(value="/comTourList.do")
	public String goTourList(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		if(m!=null && m.getMemberLevel()==2) {
			String memberId = m.getMemberId();
			int totalCount = service.selectTotalCount(memberId);
			model.addAttribute("totalCount",totalCount);
			return "tour/comTourList";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/tourView.do")
	public String selectOneTour(int itemNo) {
		return "tour/tourView";
	}
	
	@ResponseBody
	@RequestMapping(value="/moreItem.do", produces = "application/json; charset=utf-8")
	public String selectTourList(int start, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMemberId();
		ArrayList<TourVO> list = service.moreItemList(start,memberId);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/createTourFrm.do")
	public String createTourFrm(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		if(m!=null && m.getMemberLevel()==2) {
			model.addAttribute("memberId",m.getMemberId());
			return "tour/createTourFrm";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/insertTourItem.do")
	public String insertTour(HttpServletRequest request, HttpServletResponse response,MultipartFile upload, TourVO tv, String beginEnd) {
		System.out.println(tv.getFilepath());
		System.out.println(tv.getItemContent());
		System.out.println(tv.getItemPrice());
		System.out.println(tv.getItemTitle());
		System.out.println(tv.getMaxPerson());
		System.out.println(tv.getMemberId());
		System.out.println(tv.getRegionNo());
		System.out.println(tv.getTourTimes());
		System.out.println(beginEnd);
		return "tour/comTourList";
	}
	
	@RequestMapping(value="/insertEditorImg.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
        // 한글깨짐을 방지하기위해 문자셋 설정
        response.setCharacterEncoding("utf-8");
        // 마찬가지로 파라미터로 전달되는 response 객체의 한글 설정
        response.setContentType("text/html; charset=utf-8");
        // 업로드한 파일 이름
        String fileName = upload.getOriginalFilename();
        // 파일을 바이트 배열로 변환
        byte[] bytes = upload.getBytes();
        // 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
        String uploadPath = "/src/imgs/tour/content/";
        OutputStream out = new FileOutputStream(new File(uploadPath+fileName));
        // 서버로 업로드
        // write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
        // 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
        out.write(bytes);
        // 클라이언트에 결과 표시
        String callback = request.getParameter("CKEditorFuncNum");
        // 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter printWriter = response.getWriter();
        String fileUrl = "/src/imgs/tour/content/"+fileName;
        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
                + "','이미지가 업로드되었습니다.')" + "</script>");
        printWriter.flush();
    }
}
