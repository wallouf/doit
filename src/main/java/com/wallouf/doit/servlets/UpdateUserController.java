package com.wallouf.doit.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.entities.User;
import com.wallouf.doit.forms.UpdateUserForm;
import com.wallouf.doit.services.IServiceUser;

@Controller
public class UpdateUserController {
    public static final String VIEW                      = "updateAccountForm";
    public static final String FORM_MESSAGE_SUCCESS_NAME = "sAlertMessageSuccess";
    public static final String SUCCESS_URL               = "/accountDetails";
    public static final String ERROR_URL                 = "/";
    public static final String FORM_MESSAGE_SUCCESS      = "User.edition.success";
    public static final String ATT_AccountDetails        = "oAccount";
    public static final String ATT_USER_SESSION          = "userSession";

    @Autowired
    private IServiceUser       service;

    @RequestMapping( value = "/updateAccount", method = RequestMethod.GET )
    public String displayUserUpdate( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) {
        HttpSession session = request.getSession();
        session.setAttribute( ATT_AccountDetails, service.getActualUser( request ) );
        return VIEW;
    }

    @RequestMapping( value = "/updateAccount", method = RequestMethod.POST )
    public String updateUser( @Valid @ModelAttribute( value = "edition" ) final UpdateUserForm pEdition,
            final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) throws IOException {
        HttpSession session = request.getSession();
        User oUpdatedUser = service.updateUser( pEdition.getName(), pEdition.getPasswordOld(), pEdition.getPassword(),
                pEdition.getPasswordBis(),
                pEdition.getEmail(), service.getActualUser( request ) );
        if ( service.getServiceErrors().isEmpty() && service.getFormErrors().isEmpty() ) {
            session.setAttribute( FORM_MESSAGE_SUCCESS_NAME, FORM_MESSAGE_SUCCESS );
            session.setAttribute( ATT_USER_SESSION, oUpdatedUser );
            try {
                response.sendRedirect( request.getContextPath() + SUCCESS_URL );
            } catch ( IOException e ) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            request.setAttribute( "formErrors", service.getFormErrors() );
            request.setAttribute( "serviceErrors", service.getServiceErrors() );
            session.setAttribute( ATT_AccountDetails, pEdition );
        }
        // update user saved in Session
        return VIEW;
    }
}
