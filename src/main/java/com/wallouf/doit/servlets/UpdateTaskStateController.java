package com.wallouf.doit.servlets;

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
public class UpdateTaskStateController {
    public static final String VIEW_LIST_SUCCESS       = "ajaxTaskListState";
    public static final String VIEW_DETAILS_SUCCESS    = "ajaxTaskDetailsState";
    public static final String ATT_TASK_STATE          = "sTaskState";
    public static final String ATT_USER_SESSION        = "userSession";
    public static final String FORM_MESSAGE_ERROR_NAME = "sAlertMessageError";
    public static final String FORM_MESSAGE_ERROR      = "Task.search.NotFound";

    @Autowired
    private IServiceTask       service;

    @RequestMapping( value = "/updateTaskListState", method = RequestMethod.POST )
    public String updateTaskListState( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response, @RequestParam( value = "taskId" ) final Integer pTaskId,
            @RequestParam( value = "taskState" ) final String pTaskState ) {
        HttpSession session = request.getSession();
        service.editTaskState( pTaskId, session.getAttribute( ATT_USER_SESSION ), pTaskState );
        if ( !service.getServiceErrors().isEmpty() || !service.getFormErrors().isEmpty() ) {
            session.setAttribute( FORM_MESSAGE_ERROR_NAME, FORM_MESSAGE_ERROR );
        }
        request.setAttribute( ATT_TASK_STATE, pTaskState );
        return VIEW_LIST_SUCCESS;
    }

    @RequestMapping( value = "/updateTaskDetailsState", method = RequestMethod.POST )
    public String updateTaskDetailsState( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response, @RequestParam( value = "taskId" ) final Integer pTaskId,
            @RequestParam( value = "taskState" ) final String pTaskState ) {
        HttpSession session = request.getSession();
        service.editTaskState( pTaskId, session.getAttribute( ATT_USER_SESSION ), pTaskState );
        if ( !service.getServiceErrors().isEmpty() || !service.getFormErrors().isEmpty() ) {
            session.setAttribute( FORM_MESSAGE_ERROR_NAME, FORM_MESSAGE_ERROR );
        }
        request.setAttribute( ATT_TASK_STATE, pTaskState );
        return VIEW_DETAILS_SUCCESS;
    }

}
