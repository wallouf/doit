package com.wallouf.doit.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.forms.ConnectUserForm;
import com.wallouf.doit.services.IServiceUser;

/**
 * Servlet implementation class Connection
 */
@Controller
public class Connection {
    public static final String VIEW_SIGNIN      = "signin";
    public static final String VIEW_VALID       = "index";
    public static final String ATT_USER_SESSION = "userSession";

    @Autowired
    private IServiceUser       service;

    @RequestMapping( value = "/signin", method = RequestMethod.GET )
    public String displaySigninForm( final ModelMap pModel, HttpServletRequest request, HttpServletResponse response ) {
        return VIEW_SIGNIN;
    }

    @RequestMapping( value = "/signin", method = RequestMethod.POST )
    public String getSigninForm( @Valid @ModelAttribute( value = "connection" ) final ConnectUserForm pConnect,
            final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) {
        HttpSession session = request.getSession();

        session.setAttribute( ATT_USER_SESSION, service.connecterUser( pConnect.getEmail(), pConnect.getPassword() ) );
        if ( service.getServiceErrors().isEmpty() && service.getFormErrors().isEmpty() ) {
            try {
                response.sendRedirect( request.getContextPath() + "/" );
            } catch ( IOException e ) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            return VIEW_VALID;
        } else {
            request.setAttribute( "formErrors", service.getFormErrors() );
            request.setAttribute( "serviceErrors", service.getServiceErrors() );
            return VIEW_SIGNIN;
        }
    }

}
