package kr.or.iei.tour.controller;

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

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.tour.model.service.TourService;
import kr.or.iei.tour.model.vo.ReviewData;
import kr.or.iei.tour.model.vo.TourVO;

@Controller
public class TourController {
	@Autowired
	@Qualifier("tourService")
	private TourService service;

	@RequestMapping(value = "/comTourList.do")
	public String comTourList(HttpSession session, Model model) {
		Member m = (Member) session.getAttribute("member");
		if (m != null && m.getMemberLevel() == 2) {
			String memberId = m.getMemberId();
			int totalCount = service.selectTotalCount(memberId);
			model.addAttribute("totalCount", totalCount);
			return "tour/comTourList";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/tourList.do")
	public String tourList(HttpSession session, Model model) {
		String memberId = null;
		int totalCount = service.selectTotalCount(memberId);
		model.addAttribute("totalCount", totalCount);
		return "tour/tourList";
	}

	@RequestMapping(value = "/tourView.do")
	public String selectOneTour(int itemNo, Model model) {
		TourVO tv = service.selectOneTour(itemNo);
		model.addAttribute("tv",tv);
		return "tour/tourView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/moreItem.do", produces = "application/json; charset=utf-8")
	public String selectTourList(int start, HttpSession session, String val) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		int memberLevel = 0;
		if(m!=null) {
			memberId = m.getMemberId();
			memberLevel = m.getMemberLevel();
		}
		ArrayList<TourVO> list = service.moreItemList(start, memberId,memberLevel,val);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/moreReview.do", produces = "application/json; charset=utf-8")
	public String selectMoreReview(int reqPage, int itemNo) {
		ReviewData rd = service.moreReviewList(reqPage,itemNo);
		return new Gson().toJson(rd);
	}

	@RequestMapping(value = "/createTourFrm.do")
	public String createTourFrm(HttpSession session, Model model) {
		Member m = (Member) session.getAttribute("member");
		if (m != null && m.getMemberLevel() == 2) {
			ArrayList<Region> rlist = service.selectRegionList();
			model.addAttribute("memberId", m.getMemberId());
			model.addAttribute("rlist",rlist);
			return "tour/createTourFrm";
		} else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCityList.do", produces = "application/json; charset=utf-8")
	public String selectCityList(String regionCountry) {
		ArrayList<Region> clist = service.selectRegionCity(regionCountry);
		return new Gson().toJson(clist);
	}
	
	@RequestMapping(value="/insertTour.do")
	public String insertTour(HttpServletRequest request, MultipartFile file,Model model, TourVO tv,String beginEnd) {
		Photo p = new Photo();
		String savePath = request.getSession().getServletContext().getRealPath("/upload/images/tour/thumnail");
		File folder = new File(savePath);

		// 해당 디렉토리 확인
		if (!folder.exists()) {
			try {
				folder.mkdirs(); // 폴더 생성
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		if(!file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();//업로드한 실제 파일명(ex>test.txt)
			String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf("."));//확장자를 제외한 파일 이름(ex>test)
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));//확장자 이름(ex>.txt)
			String filepath = onlyFilename+"_"+getCurrentTime()+extension;
			String fullpath = savePath+"/"+filepath;
			try {
				byte[] bytes = file.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
				p.setFilename(originalFilename);
				p.setFilepath(filepath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String beginDate = beginEnd.substring(0,10);
		String endDate = beginEnd.substring(11);
		tv.setBeginDate(beginDate);
		tv.setEndDate(endDate);
		int result = service.insertTour(tv,p);
		if(result>0) {
			model.addAttribute("msg","등록성공");
		}else {
			model.addAttribute("msg","등록실패");
		}
		model.addAttribute("loc","/comTourList.do");
		return "common/msg";
	}
	
	public long getCurrentTime() {
		Calendar today = Calendar.getInstance();
		return today.getTimeInMillis();
	}

	@RequestMapping(value = "/uploadImage.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
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
			String filepath = onlyFilename+"_"+getCurrentTime()+extension;
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = request.getSession().getServletContext().getRealPath("/upload/images/tour/content");// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
			String ckUploadPath = path + "/" + filepath;
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
			String fileUrl = "/ckImgSubmit.do?filepath=" + filepath; // 작성화면

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
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = request.getSession().getServletContext().getRealPath("/upload/images/tour/content");;

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
}
