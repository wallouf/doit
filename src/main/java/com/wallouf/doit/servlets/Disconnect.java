package com.wallouf.doit.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Disconnect {
    public static final String VIEW_VALID = "index";

    @RequestMapping( value = "/disconnect", method = RequestMethod.GET )
    public void displaySigninForm( final ModelMap pModel, HttpServletRequest request, HttpServletResponse response ) {
        HttpSession session = request.getSession();
        session.invalidate();

        try {
            response.sendRedirect( request.getContextPath() + "/" );
        } catch ( IOException e ) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
