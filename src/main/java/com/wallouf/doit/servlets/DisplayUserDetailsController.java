package com.wallouf.doit.servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.entities.User;
import com.wallouf.doit.services.IServiceUser;

@Controller
public class DisplayUserDetailsController {
    public static final String VIEW               = "accountDetails";
    public static final String ATT_AccountDetails = "oAccount";
    public static final String ATT_USER_SESSION   = "userSession";

    @Autowired
    private IServiceUser       service;

    @RequestMapping( value = "/accountDetails", method = RequestMethod.GET )
    public String displayUserDetails( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) {
        HttpSession session = request.getSession();
        if ( session.getAttribute( ATT_USER_SESSION ) != null ) {
            try {
                User oUserConnected = (User) session.getAttribute( ATT_USER_SESSION );
                session.setAttribute( ATT_AccountDetails, oUserConnected );
            } catch ( Exception e ) {
                e.printStackTrace();
            }
        }
        return VIEW;
    }
}
