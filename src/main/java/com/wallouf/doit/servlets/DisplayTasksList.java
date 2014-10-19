package com.wallouf.doit.servlets;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Servlet implementation class Connection
 */
@Controller
@RequestMapping( "/" )
public class DisplayTasksList {

    @RequestMapping( method = RequestMethod.GET )
    public String afficherBonjour( final ModelMap pModel ) {
        return "index";
    }
}
