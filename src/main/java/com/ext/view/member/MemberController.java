package com.ext.view.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ext.home.Pager;
import com.ext.model.member.Email;
import com.ext.model.member.MemberService;
import com.ext.model.member.MemberVO;
import com.ext.model.member.impl.EmailSender;
import com.ext.model.reservation.reservationVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired 
	private EmailSender emailSender;
	@Autowired
	private Email email;
	
	//관리자 view - 회원현황
	@RequestMapping(value = "/admin")
	   public String adminView(MemberVO vo,HttpSession session, Model model,
	  @RequestParam(defaultValue = "USER_ID") String searchOption, 
	  @RequestParam(defaultValue = "") String keyword,
	  @RequestParam(defaultValue = "") String search, 
	  @RequestParam(defaultValue = "1") int curPage) {
		
		int count = memberService.getCountMember(vo,searchOption, keyword);
		
		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		
		List<MemberVO> list = memberService.getMemberList(vo,searchOption, keyword, start, end);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		session.setAttribute("map", map);
		
		return "member/admin";
	   }
	//관리자 view - 예약현황
	@RequestMapping(value = "/admin2")
	public String adminview2(MemberVO vo,HttpSession session, Model model){
		
		
		int bgCount = memberService.Countbg(vo);
		int iteCount = memberService.Countite(vo);
		int ptCount = memberService.Countpt(vo);
		
		int payCount1 = memberService.payCount1(vo);
		int payCount2 = memberService.payCount2(vo);
		int payCount3 = memberService.payCount3(vo);
		
		HashMap<String, Object> countmap = new HashMap<String, Object>();
		countmap.put("bgCount", bgCount);
		countmap.put("iteCount", iteCount);
		countmap.put("ptCount", ptCount);	
		countmap.put("payCount1", payCount1);
		countmap.put("payCount2", payCount2);
		countmap.put("payCount3", payCount3);
		
		
		session.setAttribute("countmap", countmap);

		
		return "member/admin2";
	}
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(MemberVO vo) {
		return "member/login";
	}
	//약관
	@RequestMapping("/term")
	public String term(MemberVO vo) { return "member/term"; }
	//회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpView(MemberVO vo) { return "member/signup"; }
	
	// 아이디 중복검사
		@ResponseBody
		@RequestMapping(value = "/checkID")
		public int checkID(MemberVO vo) {
			int checkID = memberService.checkID(vo);
			return checkID;
		}
		
		// 회원가입
		@RequestMapping(value = "/join")
		public String signUp(MemberVO vo) {
			memberService.insertMember(vo);
			return "member/login";
		}
		
		@ResponseBody
		@RequestMapping(value = "/checkMember")
		public int checkMember(MemberVO vo) {
			int checkMember = memberService.checkMember(vo);
			return checkMember;
		}
		
		// 로그인
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(MemberVO vo, HttpSession session) {
			MemberVO member = memberService.login(vo);
			if (member != null) {
				session.setAttribute("member", member);
				return "main";
			} else {
				return "member/login";
			}
		}
		// 로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			return "member/login";
		}
		//비밀번호 찾기 
		@ResponseBody
		@RequestMapping(value="/forgotPWChkm")
		public int forgotPWChkm(MemberVO vo) {
			int forgotPWChkm = memberService.forgotPWChkMember(vo);
			return forgotPWChkm;	
		}
		//비밀번호 이메일 전송처리
		@ResponseBody
		@RequestMapping(value="/forgotPW", method = {RequestMethod.GET,RequestMethod.POST})
		public String forgotPW(@RequestParam Map<String,Object> paramMap, ModelMap model) throws Exception {
			 	
			 String id=(String) paramMap.get("user_id");
		     String e_mail=(String) paramMap.get("user_email");
		     String pw= memberService.forgotPW(paramMap);
		       
		        if(pw!=null) {
		            email.setContent(id+" 님의 비밀번호는 "+pw+" 입니다.");
		            email.setReceiver(e_mail);
		            email.setSubject("안녕하세요 "+id+" 님 MIRAE SURF 비밀번호 안내 메일입니다.");
		            emailSender.SendEmail(email);
		           
		            return "member/login";
		        }else {
		        	System.out.println("pw is null"+"id:"+id+"user_email:"+email);
		            return "member/login";
		        }
		}
		@ResponseBody
		@RequestMapping("/mypL")
		public String mypage1(MemberVO vo, HttpSession session,Model model) {
			int count = memberService.getCountOrder(vo);
			session.setAttribute("user_id", vo.getUser_id());
			List<reservationVO> list = memberService.getOrderList(vo);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mypL", list); // map에 자료 저장
			map.put("count", count);

			session.setAttribute("map", map);
			return "member/mypage";	
		}
		//회원 정보 view
		@RequestMapping(value = "/mypage", method = RequestMethod.GET)
		public String mypageView(MemberVO vo, HttpSession session,Model model) {
			int count = memberService.getCountOrder(vo);
			List<reservationVO> list = memberService.getOrderList(vo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mypL", list); // map에 자료 저장
			map.put("count", count);
			
			session.setAttribute("map", map);
			
			
			return "member/mypage";
		}
		//회원정보 수정 view
		@RequestMapping(value = "/changemember", method = RequestMethod.GET)
		public String changememberView(MemberVO vo) {
			return "member/changemember"; 
		}
		
		//회원정보 수정처리
		@RequestMapping(value = "/changuser")
		public String myinfoUp(MemberVO vo) {
			memberService.updateMember(vo);
			return "member/mypage";
		}
		
		//회원정보 탈퇴처리 -> 완료
		@RequestMapping(value = "/outuser")
		public String myoutUp(MemberVO vo) {
			memberService.deleteMember(vo);
			return "member/mypage";
		}
		//예약취소
		@RequestMapping(value = "/deleteReservation")
		public String deleteReservation(MemberVO vo) {
			memberService.deleteReservation(vo);
			return "member/mypage";
		}
}


