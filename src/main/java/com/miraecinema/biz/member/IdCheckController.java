package com.miraecinema.biz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class IdCheckController {

    @Autowired
    private MemberService memberService;

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
