package com.wallouf.doit.dao;

import java.util.List;

import com.wallouf.doit.entities.Task;

public interface ITaskDAO {

    List<Task> findTasks();

    Task findTask( final Integer pTaskId );

    void createTask( final Task pTask );

    void editTask( final Task pTask );

    void removeTask( final Task pTask );
}
