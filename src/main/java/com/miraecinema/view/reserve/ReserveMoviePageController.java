
package com.miraecinema.view.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.movie.MovieInfo;

@Controller
public class ReserveMoviePageController {
    
    @RequestMapping(value="/reserveMovie.do", method = RequestMethod.GET)
    public String reservePage(@ModelAttribute("movie") MovieInfo vo, Model model) {
        System.out.println("영화 예매하기 페이지 파라메터 세팅");
        System.out.println("상영관 : " + vo.getRnum());
        System.out.println("영화 제목 : " + vo.getMovieNm());

        // MovieInfo 객체를 모델에 추가
        model.addAttribute("movie", vo);
        
        // 상영 시간표 설정
        // ReserveTime 객체 생성 및 시간표 설정 부분
/*        ReserveTime reserveTime = new ReserveTime();
        String[] screenTimes = reserveTime.schedule.get(Integer.parseInt(vo.getRnum()) - 1);
        model.addAttribute("screenTimes", screenTimes);   */   

        return "reserveMovie.jsp";
    }
}
