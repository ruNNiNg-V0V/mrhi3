package com.miraecinema.view.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PopupController {

    @RequestMapping(value = "/popup/{type}", method = RequestMethod.GET)
    public String getPopupContent(@PathVariable("type") String type) {
        // 팝업 종류에 따라 반환할 JSP를 설정
        switch (type) {
            case "privacy":
                return "popup/privacy"; // views/popup/privacy.jsp
            case "terms":
                return "popup/terms";   // views/popup/terms.jsp
            case "reject":
                return "popup/reject";   // views/popup/reject.jsp
            default:
                return "popup/notfound"; 
        }
    }
}