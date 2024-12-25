package com.miraecinema.view.movieInfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.movie.MovieInfo;

@Controller
public class MovieInfoPageController {
	// POST 방식으로 변경함
	// 사용자가 파라메터를 통해 접근할 수 있던 문제 해결
    @RequestMapping(value="/movieInfo.do", method = RequestMethod.POST)
    public String reviewPage(@ModelAttribute("movie") MovieInfo vo, Model model) {
        System.out.println("영화 상세 정보 페이지 파라메터 세팅");
        System.out.println("상영관 : " + vo.getRnum());
        System.out.println("영화 코드 : " + vo.getMovieCd());
        model.addAttribute("movie", vo);
        return "movieInfo.jsp";
    }
}
