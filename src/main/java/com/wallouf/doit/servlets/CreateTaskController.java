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

import com.wallouf.doit.forms.CreateTaskForm;
import com.wallouf.doit.services.IServiceTask;

@Controller
public class CreateTaskController {
    public static final String FORM_VIEW                 = "createTaskForm";
    public static final String FORM_MESSAGE_SUCCESS      = "Task.creation.success";
    public static final String FORM_MESSAGE_SUCCESS_NAME = "sAlertMessageSuccess";
    public static final String ATT_USER_SESSION          = "userSession";
    public static final String ATT_TASK_INFO             = "oTaskToEdit";

    @Autowired
    private IServiceTask       service;

    @RequestMapping( value = "/createTask", method = RequestMethod.GET )
    public String displayForm( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) {
        HttpSession session = request.getSession();
        session.setAttribute( ATT_TASK_INFO, null );
        return FORM_VIEW;
    }

    @RequestMapping( value = "/createTask", method = RequestMethod.POST )
    public String create( @Valid @ModelAttribute( value = "creation" ) final CreateTaskForm pCreation,
            final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) throws IOException {
        HttpSession session = request.getSession();
        service.createTask( pCreation.getName(), pCreation.getDescription(), pCreation.getState(),
                pCreation.getDeadline(),
                pCreation.getNotification(), pCreation.getColor(), pCreation.getPosition(),
                request.getSession().getAttribute( ATT_USER_SESSION ) );
        if ( service.getServiceErrors().isEmpty() && service.getFormErrors().isEmpty() ) {
            session.setAttribute( FORM_MESSAGE_SUCCESS_NAME, FORM_MESSAGE_SUCCESS );
            try {
                response.sendRedirect( request.getContextPath() + "/" );
            } catch ( IOException e ) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            request.setAttribute( "formErrors", service.getFormErrors() );
            request.setAttribute( "serviceErrors", service.getServiceErrors() );
            session.setAttribute( ATT_TASK_INFO, pCreation );
        }
        return FORM_VIEW;
    }
}
