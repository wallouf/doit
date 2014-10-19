package com.wallouf.doit.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.wallouf.doit.entities.User;

@Repository
public class UserDAO implements IUserDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public List<User> rechercherUsers() {
        final CriteriaBuilder lCriteriaBuilder = entityManager.getCriteriaBuilder();

        final CriteriaQuery<User> lCriteriaQuery = lCriteriaBuilder.createQuery( User.class );
        final Root<User> lRoot = lCriteriaQuery.from( User.class );
        lCriteriaQuery.select( lRoot );
        final TypedQuery<User> lTypedQuery = entityManager.createQuery( lCriteriaQuery );

        return lTypedQuery.getResultList();
    }

    public void creerUser( User pUser ) {
        entityManager.persist( pUser );

    }

    public void supprimerUser( User pUser ) {
        final User lUser = entityManager.getReference( User.class, pUser.getId() );
        entityManager.remove( lUser );
    }

}
