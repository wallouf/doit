package com.wallouf.doit.servlets;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wallouf.doit.entities.Task;
import com.wallouf.doit.services.IServiceTask;

/**
 * Servlet implementation class Connection
 */
@Controller
@RequestMapping( "/" )
public class DisplayTasksListController {
    public static final String ATT_USER_SESSION = "userSession";
    public static final String ATT_TaskList     = "aTaskList";

    @Autowired
    private IServiceTask       service;

    @RequestMapping( method = RequestMethod.GET )
    public String displayTaskList( final ModelMap pModel, HttpServletRequest request,
            HttpServletResponse response ) {
        HttpSession session = request.getSession();
        List<Task> aTaskList = service.findTasks( session.getAttribute( ATT_USER_SESSION ) );
        request.setAttribute( ATT_TaskList, aTaskList );
        return "index";
    }
}
