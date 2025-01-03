package com.miraecinema.view.movieInfo;

import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

    @RequestMapping(value = "/movieInfo.do", method = RequestMethod.POST)
    public String reviewPage(
            @ModelAttribute("movie") MovieInfo vo, 
            Model model, 
            HttpSession session) {
    	
        // Log movie info 
        System.out.println("영화 상세 정보 페이지 파라메터 세팅");
        System.out.println("상영관 : " + vo.getRnum());
        System.out.println("영화 코드 : " + vo.getMovieCd());
        System.out.println("영화 이름 : " + vo.getMovieNm());
        
        ReviewDAO reviewDAO = new ReviewDAO();

        // Retrieve reviews 
        String movieName = vo.getMovieNm();
        List<ReviewVO> reviews = reviewDAO.getReviewsByMovie(movieName);

        // Log reviews 
        if (reviews != null) {
        	reviews.sort(Comparator.comparing(ReviewVO::getCreatedDate).reversed());
        	
        	MemberVO member = (MemberVO) session.getAttribute("member");
            if (member != null) {
                String userId = member.getId();
                ReviewVO existingReview = reviewDAO.getReviewByUser(movieName, userId);
                if (existingReview != null) {
                    // If a review exists, show it in the textbox
                    model.addAttribute("existingReview", existingReview);
                    model.addAttribute("message", "이미 리뷰가 있습니다. 수정 하실까요?");
                }
            }

            /*for (ReviewVO review : reviews) {
                System.out.println("(리뷰)영화 이름 : " + review.getRmvname());
                System.out.println("(리뷰)댓글 : " + review.getComent());
                System.out.println("(리뷰)댓글 시간 : " + review.getRtime());
                System.out.println("(리뷰)이름 : " + review.getRname());
                System.out.println("(리뷰)아이디 : " + review.getRid());
            }*/
        } else {
            System.out.println("No reviews found for the movie: " + movieName);
        }

        // Add movie information and reviews to the model
        model.addAttribute("movie", vo);
        model.addAttribute("reviews", reviews);
        return "movieInfo.jsp";
    }
    
    @RequestMapping(value = "/insertMovieInfo.do", method = RequestMethod.POST)
    public String insertReview(
    		@ModelAttribute("review") ReviewVO review, 
    		@ModelAttribute("movie") MovieInfo movie,
    		HttpSession session,
    		Model model) {
        MemberVO member = (MemberVO) session.getAttribute("member");
          
    	if(member != null) {	
            ReviewDAO reviewDAO = new ReviewDAO();
    		String userId = member.getId();
            // Check if the user has already submitted a review for the movie
            ReviewVO existingReview = reviewDAO.getReviewByUser(movie.getMovieNm(), userId);
            if (existingReview != null) {
                // Prompt the user to modify their previous review
                model.addAttribute("existingReview", existingReview);
                model.addAttribute("message", "You have already submitted a review. Please modify it.");
                return reviewPage(movie, model, session);  // Show the review page again with the existing review
            }
    		review.setRid(member.getId());
        	review.setRname(member.getName());
        	reviewDAO.insertReivew(review);
        	
        	return reviewPage(movie, model, session);
    	} else {
    		return "login.jsp";
    	}    	
    }  
}