package com.miraecinema.view.movieInfo;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.movie.MovieInfo;
import com.miraecinema.biz.review.ReviewVO;
import com.miraecinema.biz.review.impl.ReviewDAO;

@Controller
public class MovieInfoPageController {
	
    @RequestMapping(value = "/movieInfo.do", method = RequestMethod.GET)
    public String reviewPageGet(@ModelAttribute("movie") MovieInfo vo, Model model) {
        // Log movie info 
    	
        // 디코딩된 값으로 설정
        // 디코딩된 값으로 설정
    	try {
    		String decodedMovieName = URLDecoder.decode(vo.getMovieNm(), "UTF-8");
    		System.out.println("영화 상세 정보 페이지 파라메터 세팅");
            System.out.println("상영관 : " + vo.getRnum());
            System.out.println("영화 코드 : " + vo.getMovieCd());
            System.out.println("영화 이름 : " + vo.getMovieNm());
            System.out.println("영화 이름(디코드) : " + decodedMovieName);
            
            // Retrieve reviews 
            ReviewDAO reviewDAO = new ReviewDAO();
            List<ReviewVO> reviews = reviewDAO.getReviewsByMovie(decodedMovieName);

            // Log reviews 
            if (reviews != null) {
                for (ReviewVO review : reviews) {
                    System.out.println("(리뷰)영화 이름 : " + review.getRmvname());
                    System.out.println("(리뷰)댓글 : " + review.getComent());
                    System.out.println("(리뷰)댓글 시간 : " + review.getRtime());
                    System.out.println("(리뷰)이름 : " + review.getRname());
                    System.out.println("(리뷰)아이디 : " + review.getRid());
                }
            } else {
                System.out.println("No reviews found for the movie: " + decodedMovieName);
            }
            
            model.addAttribute("reviews", reviews);
            
		} catch (Exception e) {
			// TODO: handle exception
		}

        // Add movie information and reviews to the model
        model.addAttribute("movie", vo);
        
        return "movieInfo.jsp";
    }

    @RequestMapping(value = "/movieInfo.do", method = RequestMethod.POST)
    public String reviewPagePost(@ModelAttribute("movie") MovieInfo vo, Model model, HttpSession session) {
        return reviewPageGet(vo, model);
    }

    @RequestMapping(value = "/insertMovieInfo.do", method = RequestMethod.POST)
    public String insertReview(@ModelAttribute("review") ReviewVO review, @ModelAttribute("movie") MovieInfo movie, HttpSession session, Model model) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        if (member != null) {
        	try {
        		String decodedMovieName = URLDecoder.decode(review.getRmvname(), "UTF-8");
        		review.setRmvname(decodedMovieName);
			} catch (Exception e) {
				// 영화 인코딩 실패 오류
				System.out.println(e.getMessage());
			}
            review.setRid(member.getId());
            review.setRname(member.getName());
            ReviewDAO reviewDAO = new ReviewDAO();
            reviewDAO.insertReivew(review);
            
            return "redirect:movieInfo.do?movieNm="+ movie.getMovieNm() 
            	+ "&movieCd="+ movie.getMovieCd() + "&rnum=" + movie.getRnum();
            // GET 요청으로 리다이렉트
        } else {
            return "login.jsp";
        }
    }
}
