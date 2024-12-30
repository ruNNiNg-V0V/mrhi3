package com.miraecinema.biz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
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
     // 아이디 찾기 처리 메서드 (POST 요청)
        @PostMapping("/findId.do")
        public ModelAndView findId(@RequestParam("name") String name,
                                    @RequestParam("email") String email) {
            ModelAndView mav = new ModelAndView();
            
            try {
                String foundId = memberService.findIdByNameAndEmail(name, email);
                if (foundId != null) {
                    mav.addObject("foundId", foundId); 
                    mav.setViewName("idFound"); 
                } else {
                    mav.addObject("errorMessage", "입력한 정보와 일치하는 아이디가 없습니다.");
                    mav.setViewName("findId"); 
                }
            } catch (Exception e) {
                mav.addObject("errorMessage", "아이디 찾기 실패: " + e.getMessage());
                mav.setViewName("findId"); 
            }

            return mav;
        }
    }