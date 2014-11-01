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
import org.springframework.web.bind.annotation.RequestParam;

import com.wallouf.doit.services.IServiceTask;

@Controller
public class DeleteTaskController {
    public static final String FORM_VIEW                 = "index";
    public static final String FORM_MESSAGE_SUCCESS_NAME = "sAlertMessageSuccess";
    public static final String FORM_MESSAGE_ERROR_NAME   = "sAlertMessageError";
    public static final String FORM_MESSAGE_SUCCESS      = "Task.remove.success";
    public static final String FORM_MESSAGE_ERROR        = "Task.remove.error";
    public static final String ATT_USER_SESSION          = "userSession";

    @Autowired
    private IServiceTask       service;

    @RequestMapping( value = "/deleteTask", method = RequestMethod.GET )
    public String displayForm( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response, @RequestParam( value = "taskId" ) final Integer pTaskId ) {
        HttpSession session = request.getSession();
        service.removeTask( pTaskId, session.getAttribute( ATT_USER_SESSION ) );
        if ( service.getServiceErrors().isEmpty() && service.getFormErrors().isEmpty() ) {
            session.setAttribute( FORM_MESSAGE_SUCCESS_NAME, FORM_MESSAGE_SUCCESS );
        } else {
            session.setAttribute( FORM_MESSAGE_ERROR_NAME, FORM_MESSAGE_ERROR );
        }
        try {
            response.sendRedirect( request.getContextPath() + "/" );
        } catch ( IOException e ) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return FORM_VIEW;
    }

}
