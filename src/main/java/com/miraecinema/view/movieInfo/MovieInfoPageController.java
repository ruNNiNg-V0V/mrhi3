package com.miraecinema.view.movieInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.movie.MovieInfo;

@Controller
public class MovieInfoPageController {
    @RequestMapping(value="/movieInfo.do", method = RequestMethod.GET)
    public String reviewPage(@ModelAttribute("movie") MovieInfo vo) {
        System.out.println("영화 상세 정보 페이지 파라메터 세팅");
        System.out.println("상영관 : " + vo.getRnum());
        System.out.println("영화 코드 : " + vo.getMovieCd());
        return "movieInfo.jsp";
    }
}
