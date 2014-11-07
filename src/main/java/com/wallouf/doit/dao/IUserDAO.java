package com.wallouf.doit.dao;

import java.util.List;

import com.wallouf.doit.entities.User;

public interface IUserDAO {
    List<User> rechercherUsers();

    User rechercherUser( final String email );

    void creerUser( final User pUser );

    void updateUser( final User pUser );

    void supprimerUser( final User pUser );
}