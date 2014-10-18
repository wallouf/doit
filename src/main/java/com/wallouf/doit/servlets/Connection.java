package com.wallouf.doit.servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.entities.User;

/**
 * Servlet implementation class Connection
 */
@Controller
@RequestMapping( "/signin" )
public class Connection {
    public static final String VIEW_SIGNIN      = "signin";
    public static final String VIEW_VALID       = "index";
    public static final String ATT_USER_SESSION = "userSession";

    @RequestMapping( method = RequestMethod.GET )
    public String displaySigninForm( final ModelMap pModel, HttpServletRequest request, HttpServletResponse response ) {
        return VIEW_SIGNIN;
    }

    @RequestMapping( method = RequestMethod.POST )
    public String getSigninForm( final ModelMap pModel, HttpServletRequest request, HttpServletResponse response ) {
        User userTest = new User();
        HttpSession session = request.getSession();
        session.setAttribute( ATT_USER_SESSION, userTest );
        return VIEW_VALID;
    }

}
