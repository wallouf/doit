package com.wallouf.doit.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.forms.RegisterUserForm;
import com.wallouf.doit.services.IServiceUser;

/**
 * Servlet implementation class Connection
 */
@Controller
public class Registration {

    @Autowired
    private IServiceUser service;

    @RequestMapping( value = "/register", method = RequestMethod.GET )
    public String afficherBonjour( final ModelMap pModel ) {
        return "register";
    }

    @RequestMapping( value = "/register", method = RequestMethod.POST )
    public String creer( @Valid @ModelAttribute( value = "creation" ) final RegisterUserForm pCreation,
            final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) throws IOException {
        service.creerUser( pCreation.getName(), pCreation.getPassword(), pCreation.getPasswordBis(),
                pCreation.getEmail() );
        if ( service.getServiceErrors().isEmpty() && service.getFormErrors().isEmpty() ) {
            request.setAttribute( "creationResultMessage", "User.creation.success" );
        } else {
            request.setAttribute( "formErrors", service.getFormErrors() );
            request.setAttribute( "serviceErrors", service.getServiceErrors() );
        }
        return "register";
    }
}
