package kr.or.iei.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.iei.admin.model.service.AdminService;
import kr.or.iei.admin.model.vo.AdminPage;
import kr.or.iei.admin.model.vo.PageMarker;
import kr.or.iei.admin.model.vo.SearchAdmin;
import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.common.model.vo.Report;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.QNA;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;

	public AdminController() {
		super();
		System.out.println("AdminController생성완료");
	}

	@RequestMapping(value = "/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}

	@RequestMapping(value = "/spot_managenet.do")
	public String spot_managenet(Model model) {
		ArrayList<Region> rList = service.regionList();
		model.addAttribute("rList", rList);
		return "admin/spot_managenet";
	}

	@RequestMapping(value = "/qnaAdmin.do")
	public String admin_QNA(Model model) {
		ArrayList<QNA> qnaList = service.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "admin/qnaList";
	}

	@RequestMapping(value = "reportList.do")
	public String reportList(Model model) {
		ArrayList<Report> reList = service.reList();
		// 페이징 처리때문에 여기 바꿔줘야 함
		ArrayList<Member> mList = service.selectCustomerMember();
		model.addAttribute("reList", reList);
		model.addAttribute("mList", mList);
		return "admin/reportList";
	}

	@RequestMapping(value = "/QnAanswer.do")
	public String qnaView(QNA q, Model model) {
		QNA answer = service.qnaView(q);
		model.addAttribute("q", answer);
		return "admin/qnaAdminView";
	}

	@RequestMapping(value = "/question_answer.do")
	public String questionAnswer(QNA q, HttpSession session) {
		System.out.println(q.getAskDate());
		int result = service.qnaAnswer(q);
		if (result > 0) {
			session.setAttribute("q", q);
			return "admin/qnaAdminView";
		} else {
			session.setAttribute("msg", "답변 오류. 관리자와 상의하세요.");
			System.out.println("질문날짜 : " + q.getAskDate());
			session.setAttribute("loc", "/");
			return "common/msg";
		}

	}

	@RequestMapping(value = "/memberManagement.do")
	public String management(Model model,@ModelAttribute("scri") SearchAdmin searchM) {

		ArrayList<Company> cList = service.selectCompanyMember();
		PageMarker pgm = new PageMarker();
		pgm.setapg(searchM);
		pgm.setTotalCount(service.mListCount(searchM));
		System.out.println(searchM.getKeyword());
		ArrayList<Member> mList = service.selecMemberList(searchM);
		model.addAttribute("mList", mList);
		model.addAttribute("cList", cList);
		model.addAttribute("pgm", pgm);
		return "admin/memberManagement";

	}

	@ResponseBody
	@RequestMapping(value = "/deletePage.do", produces = "text/html; charset=utf-8")
	public String deletePage(Report rt) {
		System.out.println("보드 넘버 : " + rt.getBoardNo());
		System.out.println("보드클레스 : " + rt.getBoardClass());
		int resultP = service.deletePage(rt);
		int resultR = service.deleteReport(rt);
		int result = resultP + resultR;
		if (result == 2) {
			return String.valueOf(result);
		} else {

			return String.valueOf(result);
		}

	}

	/*
	 * MEMBER_LEVEL 1:일반회원 2:법인회원 3:관리자 COFIRM 0:승인전 1:승인후
	 */
	/*
	 * 법인 회원 승인
	 */

	@ResponseBody
	@RequestMapping(value = "/confirmUpdateMember.do", produces = "agpplication/json; charset=utf-8")
	public String confirmUpdateMember(Company cm) {
		System.out.println(cm.getCompanyId());
		int result = service.confirmUpdateMember(cm);
		System.out.println(cm.getJoinConfirm());
		if (result > 0) {
			System.out.println(cm.getJoinConfirm());
		}
		return new Gson().toJson(1);
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMemberLevel.do", produces = "text/html; charset=utf-8") // 굳이 json으로 보낼 필요가 없습니다.
	public String modifyMemberLevel(Member m) {
		System.out.println(m.getMemberId());
		int result = service.modifyMemberLevel(m);
		System.out.println("result : " + result);
		if (result > 0) {
			return String.valueOf(result);
		} else {
			return String.valueOf(result);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/memberDelete.do", produces = "text/html; charset=utf-8")
	public String memberDelete(Member m) {
		int result = service.memberDelete(m);
		if (result > 0) {
			return String.valueOf(result);
		} else {
			return String.valueOf(result);
		}

	}

	@ResponseBody
	@RequestMapping(value = "/updateAnswer.do", produces = "text/html; charset=utf-8")
	public String updateAnswer(QNA q) {
		int result = service.updateAnswer(q);
		System.out.println(q.getQnaAnswer());
		if (result > 0) {
			return String.valueOf(result);
		} else {
			return String.valueOf(result);
		}

	}

	@ResponseBody
	@RequestMapping(value = "/middleList.do", produces = "agpplication/json; charset=utf-8")
	public String middleList(Region rg) {
		List list = null;
		list = service.middleList(rg);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteReg.do", produces = "agpplication/json; charset=utf-8")
	public String deleteReg(Region rg, Photo pt, HttpServletRequest request) {
		int result = 0;
		int resultR = service.deleteReg(rg);
		int resultP = service.deletePhoto(pt);
		String FilePath = request.getSession().getServletContext()
				.getRealPath("/upload/images/region/" + pt.getFilename());

		File file = new File(FilePath);
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}

		result = resultR + resultP;

		return new Gson().toJson(result);
	}

	@RequestMapping(value = "/insertCity.do")
	public String insertCity(Region rg, Photo pt, HttpServletRequest request, MultipartFile file) throws IOException {
		try {

			if (!file.isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/upload/images/region/");
				// 업로드 파일의 실제 파일명 ex) test.txt
				UUID uuid = UUID.randomUUID();
				String originalFileName = uuid.toString() + file.getOriginalFilename();
				// 확장자를 제외한 파일명 ex) test
				String onlyFilename = originalFileName;
				// 확장자 -> .txt

				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
				String filepath = onlyFilename;
				String fullpath = savePath + filepath;
				byte[] bytes = file.getBytes();

				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
				System.out.println("파일 업로드 완료");

				System.out.println();

				pt.setFilename(originalFileName);
				pt.setFilepath("/upload/images/region/");
				rg.setFilename(originalFileName);
				System.out.println("!!!!!!!!!!!!!!!!!" + rg);
				System.out.println("!!!!!!!!!!!!!!!!!" + pt);
				int regionResult = service.insertRegion(rg);
				int photoResult = service.insertPhoto(pt);
				System.out.println("포토삽입" + photoResult);
				System.out.println("지역삽입" + regionResult);

			} else {
				System.out.println("!!!!!!!!!!!!!!!!!");
			}

		} catch (Exception e) {
			System.out.println("@@@@@@@@@@@" + e);
		}
		return "redirect:/spot_managenet.do";
	}

}
