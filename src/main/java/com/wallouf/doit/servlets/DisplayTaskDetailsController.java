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

import com.wallouf.doit.entities.Task;
import com.wallouf.doit.services.IServiceTask;

@Controller
public class DisplayTaskDetailsController {
    public static final String VIEW_SUCCESS            = "taskDetails";
    public static final String VIEW_ERROR              = "/";
    public static final String ATT_USER_SESSION        = "userSession";
    public static final String FORM_MESSAGE_ERROR_NAME = "sAlertMessageError";
    public static final String FORM_MESSAGE_ERROR      = "Task.search.NotFound";
    public static final String ATT_TaskDetails         = "oTask";

    @Autowired
    private IServiceTask       service;

    @RequestMapping( value = "/taskDetails", method = RequestMethod.GET )
    public String afficherBonjour( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response, @RequestParam( value = "taskId" ) final Integer pTaskId ) {
        HttpSession session = request.getSession();
        Task oTask = service.findTask( pTaskId, session.getAttribute( ATT_USER_SESSION ) );
        if ( oTask != null ) {
            request.setAttribute( ATT_TaskDetails, oTask );
            return VIEW_SUCCESS;
        } else {
            session.setAttribute( FORM_MESSAGE_ERROR_NAME, FORM_MESSAGE_ERROR );
            try {
                response.sendRedirect( request.getContextPath() + VIEW_ERROR );
            } catch ( IOException e ) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return VIEW_SUCCESS;
        }
    }
}
