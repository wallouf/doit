package com.wallouf.doit.servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChangeLanguageController {
    public static final String VIEW          = "changeLanguage";
    public static final String ATT_LANG      = "language";
    public static final String VALUE_LANG_FR = "fr_FR";
    public static final String VALUE_LANG_EN = "en";

    @RequestMapping( value = "/changeLanguage", method = RequestMethod.POST )
    public String changeLanguage( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response, @RequestParam( value = "lang" ) final String pLang ) {
        HttpSession session = request.getSession();
        if ( pLang.equalsIgnoreCase( "FR" ) ) {
            session.setAttribute( ATT_LANG, VALUE_LANG_FR );
        } else {
            session.setAttribute( ATT_LANG, VALUE_LANG_EN );
        }
        return VIEW;
    }

}
