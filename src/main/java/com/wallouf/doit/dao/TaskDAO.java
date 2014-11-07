package com.wallouf.doit.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.wallouf.doit.entities.Task;

@Repository
public class TaskDAO implements ITaskDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Task> findTasks( final Integer pTaskUserId ) {
        final CriteriaBuilder lCriteriaBuilder = entityManager.getCriteriaBuilder();

        final CriteriaQuery<Task> lCriteriaQuery = lCriteriaBuilder.createQuery( Task.class );
        final Root<Task> lRoot = lCriteriaQuery.from( Task.class );
        lCriteriaQuery.select( lRoot );
        final TypedQuery<Task> lTypedQuery = entityManager.createQuery( lCriteriaQuery );

        return lTypedQuery.getResultList();
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
