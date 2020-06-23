package kr.or.iei.tour.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
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
import com.google.gson.JsonObject;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.tour.model.service.TourService;
import kr.or.iei.tour.model.vo.TourVO;

@Controller
public class TourController {
	@Autowired
	@Qualifier("tourService")
	private TourService service;

	@RequestMapping(value = "/tourList.do")
	public String selectTourList(Model model) {
		return "tour/tourList";
	}

	@RequestMapping(value = "/comTourList.do")
	public String goTourList(HttpSession session, Model model) {
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

	@RequestMapping(value = "/tourView.do")
	public String selectOneTour(int itemNo) {
		return "tour/tourView";
	}

	@ResponseBody
	@RequestMapping(value = "/moreItem.do", produces = "application/json; charset=utf-8")
	public String selectTourList(int start, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String memberId = m.getMemberId();
		ArrayList<TourVO> list = service.moreItemList(start, memberId);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/createTourFrm.do")
	public String createTourFrm(HttpSession session, Model model) {
		Member m = (Member) session.getAttribute("member");
		if (m != null && m.getMemberLevel() == 2) {
			model.addAttribute("memberId", m.getMemberId());
			return "tour/createTourFrm";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/insertTourItem.do")
	public String insertTour(HttpServletRequest request, HttpServletResponse response, MultipartFile upload, TourVO tv,
			String beginEnd) {
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

//	@RequestMapping(value="/uploadImage.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
//		JsonObject json = new JsonObject();
//		PrintWriter printWriter = null;
//		OutputStream out = null;
//		MultipartFile file = multiFile.getFile("upload");
//		if(file != null) {
//			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
//				if(file.getContentType().toLowerCase().startsWith("image/")) {
//					try {
//						String fileName = file.getName();
//						System.out.println(fileName);
//						byte[] bytes = file.getBytes();
//						String uploadPath = req.getRealPath("/img");
//						File uploadFile = new File(uploadPath);
//						if(!uploadFile.exists()) {
//							uploadFile.mkdirs();
//						}
//						fileName = UUID.randomUUID().toString();
//						uploadPath = uploadPath+"/"+fileName;
//						System.out.println(fileName);
//						System.out.println(uploadPath);
//						out = new FileOutputStream(new File(uploadPath));
//						out.write(bytes);
//						
//						printWriter = resp.getWriter();
//						resp.setContentType("text/html");
//						String fileUrl = req.getContextPath()+"/img/"+fileName;
//						System.out.println(fileUrl);
//						
//						json.addProperty("uploaded", 1);
//						json.addProperty("fileName", fileName);
//						json.addProperty("url", fileUrl);
//						
//						printWriter.println(json);
//					}catch(IOException e) {
//						e.printStackTrace();
//					}finally {
//						if(out != null) {
//							out.close();
//						}
//						if(printWriter != null) {
//							printWriter.close();
//						}
//					}
//				}
//			}
//		}
//		
//		return null;
//	}

	@RequestMapping(value = "/uploadImage.do", method = RequestMethod.POST)
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
			String path = request.getRealPath("/img");// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
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
			String fileUrl = "/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

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

		return;
	}

	@RequestMapping(value = "/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = request.getRealPath("/img");

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
}
