package com.wallouf.doit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wallouf.doit.dao.IUserDAO;
import com.wallouf.doit.entities.User;

@Service
public class ServiceUser implements IServiceUser {

    @Autowired
    private IUserDAO dao;

    @Transactional( readOnly = true )
    public List<User> rechercherUsers() {
        return dao.rechercherUsers();
    }

    @Transactional
    public void creerUser( String pName, String pPassword, String pEmail ) {
        final User lUser = new User();
        lUser.setName( pName );
        lUser.setPassword( pPassword );
        lUser.setEmail( pEmail );
        dao.creerUser( lUser );
    }

    @Transactional
    public void supprimerUser( Integer pIdUser ) {
        final User lUser = new User();
        lUser.setId( pIdUser );
        dao.supprimerUser( lUser );
    }

}
