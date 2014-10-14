package com.wallouf.doit.servlets;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Servlet implementation class Connection
 */
@Controller
@RequestMapping( "/signin" )
public class Connection {
    private static final long serialVersionUID = 1L;

    @RequestMapping( method = RequestMethod.GET )
    public String afficherBonjour( final ModelMap pModel ) {
        return "signin";
    }

}
