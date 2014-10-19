package com.wallouf.doit.services;

import java.util.List;

import com.wallouf.doit.entities.User;

public interface IServiceUser {
    List<User> rechercherUsers();

    User rechercherUser( final String email );

    void creerUser( final String pName, final String pPassword, final String pEmail );

    void supprimerUser( final Integer pIdUser );
}
