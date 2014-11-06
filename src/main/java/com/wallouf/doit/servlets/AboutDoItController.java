package com.wallouf.doit.servlets;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AboutDoItController {
    public static final String VIEW = "aboutDoIt";

    @RequestMapping( value = "/about", method = RequestMethod.GET )
    public String displayAboutDoIt( final ModelMap pModel ) {
        return VIEW;
    }

}
