package com.miraecinema.view.movieInfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.movie.MovieInfo;

import java.net.URLDecoder;
import java.io.UnsupportedEncodingException;

@Controller
public class MovieInfoPageController {
    @RequestMapping(value = "/movieInfo.do", method = RequestMethod.POST)
    public String reviewPage(@ModelAttribute("movie") MovieInfo vo, Model model) throws UnsupportedEncodingException {
        // 인코딩된 영화 이름 디코딩
        String decodedMovieNm = URLDecoder.decode(vo.getMovieNm(), "UTF-8");
        vo.setMovieNm(decodedMovieNm);

        System.out.println("영화 상세 정보 페이지 파라메터 세팅");
        System.out.println("상영관 : " + vo.getRnum());
        System.out.println("영화 코드 : " + vo.getMovieCd());
        System.out.println("영화 이름 : " + decodedMovieNm);

        model.addAttribute("movie", vo);
        return "movieInfo.jsp";
    }
}
