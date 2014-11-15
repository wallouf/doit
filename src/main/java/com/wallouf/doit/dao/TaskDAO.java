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

import com.wallouf.doit.entities.Task;

@Repository
public class TaskDAO implements ITaskDAO {
    private static final String JPQL_SELECT_DONE     = "select c from Task c where c.state = 'Done' AND c.owner.id =?1";
    private static final String PARAM_USER_ID        = "1";
    private static final String JPQL_SELECT_NOT_DONE = "select c from Task c where c.state != 'Done' AND c.owner.id =?1";

    @PersistenceContext
    private EntityManager       entityManager;

    public List<Task> findTasks( final Integer pTaskUserId ) {
        final CriteriaBuilder lCriteriaBuilder = entityManager.getCriteriaBuilder();

        final CriteriaQuery<Task> lCriteriaQuery = lCriteriaBuilder.createQuery( Task.class );
        final Root<Task> lRoot = lCriteriaQuery.from( Task.class );
        lCriteriaQuery.select( lRoot );
        final TypedQuery<Task> lTypedQuery = entityManager.createQuery( lCriteriaQuery );

        return lTypedQuery.getResultList();
    }

    public List<Task> findDoneTasks( final Integer pTaskUserId ) {
        Query requete = entityManager.createQuery( JPQL_SELECT_DONE );
        requete.setParameter( PARAM_USER_ID, pTaskUserId );

        try {
            return (List<Task>) requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            return null;
        }
    }

    public List<Task> findNotDoneTasks( final Integer pTaskUserId ) {
        Query requete = entityManager.createQuery( JPQL_SELECT_NOT_DONE );
        requete.setParameter( PARAM_USER_ID, pTaskUserId );

        try {
            return (List<Task>) requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            return null;
        }
    }

    public Task findTask( Integer pTaskId, final Integer pTaskUserId ) {
        return entityManager.find( Task.class, pTaskId );
    }

    public void createTask( Task pTask ) {
        entityManager.persist( pTask );
    }

    public void removeTask( Task pTask ) {
        final Task lTask = entityManager.getReference( Task.class, pTask.getId() );
        entityManager.remove( lTask );

    }

    public void editTask( Task pTask ) {
        entityManager.merge( pTask );
    }

}
