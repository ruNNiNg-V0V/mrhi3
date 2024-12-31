package com.miraecinema.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.miraecinema.biz.member.MemberService;
import com.miraecinema.biz.member.MemberVO;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegistrationForm() {
        return "register"; 
    }

    // 회원가입 처리 메서드 (POST 요청)
    @PostMapping("/register.do")
    public ModelAndView register(MemberVO member) {
        ModelAndView mav = new ModelAndView();
        try {
            memberService.register(member); 
            mav.setViewName("redirect:/login"); 
        } catch (Exception e) {
            mav.addObject("errorMessage", "회원가입 실패: " + e.getMessage());
            mav.setViewName("register"); 
        }
        return mav;
    }
    
 // 아이디 중복 확인 메서드 (GET 요청)
    @GetMapping("/checkId/{id}")
    public ResponseEntity<Boolean> checkId(@PathVariable String id) {
        try {
            boolean isAvailable = memberService.checkId(id) == 0; // 0이면 사용 가능
            return ResponseEntity.ok(isAvailable); // 200 OK 응답과 함께 결과 반환
        } catch (Exception e) {
            return ResponseEntity.status(500).body(false); // 서버 오류 발생 시 500 응답
        }
    }
}