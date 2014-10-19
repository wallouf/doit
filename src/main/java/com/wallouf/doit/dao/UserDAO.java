package com.wallouf.doit.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.wallouf.doit.entities.User;

@Repository
public class UserDAO implements IUserDAO {
    private static final String JPQL_SELECT_PAR_EMAIL = "select c from User c where c.email=?1";
    private static final String PARAM_EMAIL           = "1";

    @PersistenceContext
    private EntityManager       entityManager;

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

    public User rechercherUser( String email ) {
        Query requete = entityManager.createQuery( JPQL_SELECT_PAR_EMAIL );
        requete.setParameter( PARAM_EMAIL, email );
        try {
            return (User) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }

}
