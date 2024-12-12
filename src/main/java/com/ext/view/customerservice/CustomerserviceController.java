package com.ext.view.customerservice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ext.home.Pager;
import com.ext.model.customerservice.customerserviceService;
import com.ext.model.customerservice.customerserviceVO;

@Controller
@SessionAttributes("board")
public class CustomerserviceController {
	
	@Autowired
	private customerserviceService customerserviceservice;
	
	//자주하시는 질문
	@RequestMapping("/question")
	public String question(customerserviceVO vo) { return "board/question"; }
	//공지사항
	@RequestMapping("/notice")
	public String notice(customerserviceVO vo) { return "board/notice"; }
	//공지사항 작성 view
	@RequestMapping("/registerNotice")
	public String registerNotice(customerserviceVO vo) { return "board/registerNotice"; }
	// 공지사항 등록
	@RequestMapping(value = "/doregisterNotice")
	public String doregisterNotice(customerserviceVO vo) throws Exception {
	customerserviceservice.doregisterNotice(vo);
	return "board/registerNotice";
 }
	// 공지사항 수정 VIEW
		@RequestMapping("/updateNotice")
		public String updateNotice(customerserviceVO vo) throws Exception {
			return "board/updateNotice";
		}
		// 공지사항 수정
		@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
		public String updateBoard(customerserviceVO vo) throws Exception {
			if (vo.getTitle() != null) {
				customerserviceservice.updateBoard(vo);
				return "board/view";
			} else {
				return "board/registerNotice";
			}
		}
		// 공지사항 삭제
		@RequestMapping("/delete")
		public String deleteNotice(int bno) throws Exception {
			customerserviceservice.deleteNotice(bno); // 삭제 처리
			return "redirect:/board"; // 목록으로 이동
		}
	// 공지사항 목록 + 검색 + 페이징
		@RequestMapping("/board")
		public String listAllNotice(Model model, HttpSession session,
				@RequestParam(defaultValue = "TITLE") String searchOption, 
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "") String search, 
				@RequestParam(defaultValue = "1") int curPage)
				throws Exception {

			// 공지사항 갯수 계산
			int count = customerserviceservice.getCountNotice(searchOption, keyword);

			session.setAttribute("searchOption", searchOption);
			session.setAttribute("keyword", keyword);
			session.setAttribute("search", search);
			session.setAttribute("curPage", curPage);

			// 페이지 관련 설정
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();

			List<customerserviceVO> list = customerserviceservice.listAllNotice(searchOption, keyword, start, end); // 게시글 목록

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list); // map에 자료 저장
			map.put("count", count);
			map.put("pager", pager); // 페이지 네버게이션을 위한 변수
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			map.put("search", search);
			model.addAttribute("map", map);

			return "board/notice";
		}
		//공지사항 상세보기
		@RequestMapping("/view")
		public String readNotice(@RequestParam("bno") int bno, 
								@RequestParam("show") String show, Model model, HttpSession session, 
								@RequestParam(defaultValue = "TITLE") String searchOption,
								@RequestParam(defaultValue = "") String keyword, 
								@RequestParam(defaultValue = "") String search,
								@RequestParam(defaultValue = "1") int curPage) throws Exception {
			
			// 공지사항 예외처리 
			// 삭제된 공지사항을 읽으려고 하는 경우
			int checkNotice= customerserviceservice.checkNotice(bno);

			if (checkNotice == 0 && show.equals("N")) {
				return "board/delpage";
			}

			// 존재하지 않는 게시글에 접근하려는 경우
			else if (checkNotice == 0 && show.equals("Y")) {
				return "board/nonepage";

			} else if (checkNotice == 1 && show.equals("N")) {
				return "board/nonepage";
			}

			customerserviceservice.viewCnt(bno, session); // 조회수
			model.addAttribute("board", customerserviceservice.readNotice(bno)); // 게시글 읽기

			// 세션 저장
			searchOption = (String) session.getAttribute("searchOption");
			session.setAttribute("searchOption", searchOption);

			keyword = (String) session.getAttribute("keyword");
			session.setAttribute("keyword", keyword);

			search = (String) session.getAttribute("search");
			session.setAttribute("search", search);

//			curPage = (int) session.getAttribute("curPage");
			curPage = (Integer) session.getAttribute("curPage");
			session.setAttribute("curPage", curPage);

			customerserviceVO plist = customerserviceservice.previousB(bno);
			customerserviceVO nlist = customerserviceservice.nextB(bno);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("previousB", plist);
			map.put("nextB", nlist);
			model.addAttribute("map", map);

			return "board/view";
		}
	
}
