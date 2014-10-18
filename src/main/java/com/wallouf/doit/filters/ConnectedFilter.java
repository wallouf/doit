package com.wallouf.doit.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class RestrictionFilter
 */
public class ConnectedFilter implements Filter {

    public static final String ACCES_CONNEXION  = "/signin";
    public static final String ATT_USER_SESSION = "userSession";

    /**
     * Default constructor.
     */
    public ConnectedFilter() {
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
    public void doFilter( ServletRequest request, ServletResponse response, FilterChain chain ) throws IOException,
            ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        /**
         * Non filtrage des ressources statiques
         */
        String chemin = req.getRequestURI().substring( req.getContextPath().length() );
        if ( chemin.startsWith( "/resources" ) || chemin.startsWith( "/register" ) ) {
            chain.doFilter( request, response );
            return;
        }

        if ( session.getAttribute( ATT_USER_SESSION ) == null ) {
            req.getRequestDispatcher( ACCES_CONNEXION ).forward( req, res );
        } else {
            // pass the request along the filter chain
            chain.doFilter( request, response );
        }

    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init( FilterConfig fConfig ) throws ServletException {
        // TODO Auto-generated method stub
    }

}
