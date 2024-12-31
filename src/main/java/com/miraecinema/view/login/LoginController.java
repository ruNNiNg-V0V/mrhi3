package com.miraecinema.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.member.MemberService;
import com.miraecinema.biz.member.MemberVO;

@Controller
public class LoginController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login() {
        return "login.jsp";
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(MemberVO vo, HttpSession session) {
        MemberVO member = memberService.getMember(vo);
        if (member != null) {
            session.setAttribute("member", member);
            return "index.do";
        } else {
            return "login.jsp";
        }
    }
}
