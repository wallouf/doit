package com.wallouf.doit.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class MessagesFilter
 */
public class MessagesFilter implements Filter {
    public static final String FORM_MESSAGE_SUCCESS_NAME = "sAlertMessageSuccess";
    public static final String FORM_MESSAGE_ERROR_NAME   = "sAlertMessageError";

    /**
     * Default constructor.
     */
    public MessagesFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter( ServletRequest req, ServletResponse res, FilterChain chain ) throws IOException,
            ServletException {
        // TODO Auto-generated method stub
        // place your code here
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if ( session.getAttribute( FORM_MESSAGE_SUCCESS_NAME ) != null ) {
            request.setAttribute( FORM_MESSAGE_SUCCESS_NAME, session.getAttribute( FORM_MESSAGE_SUCCESS_NAME ) );
            session.setAttribute( FORM_MESSAGE_SUCCESS_NAME, null );
        }
        if ( session.getAttribute( FORM_MESSAGE_ERROR_NAME ) != null ) {
            request.setAttribute( FORM_MESSAGE_ERROR_NAME, session.getAttribute( FORM_MESSAGE_ERROR_NAME ) );
            session.setAttribute( FORM_MESSAGE_ERROR_NAME, null );
        }
        // pass the request along the filter chain
        chain.doFilter( request, res );
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init( FilterConfig fConfig ) throws ServletException {
        // TODO Auto-generated method stub
    }

}
