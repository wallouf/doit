package com.wallouf.doit.dao;

import java.util.List;

import com.wallouf.doit.entities.User;

public interface IUserDAO {
    List<User> rechercherUsers();

    void creerUser( final User pUser );

    void supprimerUser( final User pUser );
}