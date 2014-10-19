package com.wallouf.doit.services;

import java.util.List;

import com.wallouf.doit.entities.User;

public interface IServiceUser {
    List<User> rechercherUsers();

    User rechercherUser( final String email );

    User connecterUser( final String email, final String password );

    void creerUser( final String pName, final String pPassword, String pPasswordBis, final String pEmail );

    void supprimerUser( final Integer pIdUser );

    public List<String> getServiceErrors();

    public List<String> getFormErrors();
}
