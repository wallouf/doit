package com.wallouf.doit.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.services.IServiceUser;

@Controller
public class DeleteUserController {
    public static final String ERROR_VIEW                = "accountDetails";
    public static final String ERROR_URL                 = "/accountDetails";
    public static final String SUCCESS_URL               = "/";
    public static final String FORM_MESSAGE_SUCCESS_NAME = "sAlertMessageSuccess";
    public static final String FORM_MESSAGE_ERROR_NAME   = "sAlertMessageError";
    public static final String FORM_MESSAGE_SUCCESS      = "User.remove.success";
    public static final String FORM_MESSAGE_ERROR        = "User.remove.error";
    public static final String ATT_USER_SESSION          = "userSession";

    @Autowired
    private IServiceUser       service;

    @RequestMapping( value = "/deleteAccount", method = RequestMethod.GET )
    public String deleteUser( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) {
        HttpSession session = request.getSession();
        service.removeUser( service.getActualUser( request ) );
        if ( service.getServiceErrors().isEmpty() && service.getFormErrors().isEmpty() ) {
            session.setAttribute( ATT_USER_SESSION, null );
            session.setAttribute( FORM_MESSAGE_SUCCESS_NAME, FORM_MESSAGE_SUCCESS );
            try {
                response.sendRedirect( request.getContextPath() + SUCCESS_URL );
            } catch ( IOException e ) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            session.setAttribute( FORM_MESSAGE_ERROR_NAME, FORM_MESSAGE_ERROR );
            try {
                response.sendRedirect( request.getContextPath() + ERROR_URL );
            } catch ( IOException e ) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return ERROR_VIEW;
    }

}
