package com.wallouf.doit.dao;

import java.util.List;

import com.wallouf.doit.entities.Task;

public interface ITaskDAO {

    List<Task> findTasks( final Integer pTaskUserId );

    List<Task> findDoneTasks( final Integer pTaskUserId );

    List<Task> findNotDoneTasks( final Integer pTaskUserId );

    Task findTask( final Integer pTaskId, final Integer pTaskUserId );

    void createTask( final Task pTask );

    void editTask( final Task pTask );

    void removeTask( final Task pTask );
}
