package com.wallouf.doit.services;

import java.util.List;

import com.wallouf.doit.entities.Task;

public interface IServiceTask {

    List<Task> findTasks( final Object pUser );

    Task findTask( final Integer pTaskId, final Object pUser );

    void createTask( final String name, final String description, final String state, final String deadline,
            final Integer notification,
            final String color, final Integer position, final Object pUser );

    void editTask( final Integer pIdTask, final String name, final String description, final String state,
            final String deadline, final Integer notification, final String color, final Integer position,
            final Object pUser );

    void editTaskState( final Integer pIdTask, final Object pUser, final String state );

    void editTaskPosition( final Integer pIdTask, final Object pUser, final Integer position );

    void editTaskColor( final Integer pIdTask, final Object pUser, final String color );

    void editTaskDeadline( final Integer pIdTask, final Object pUser, final String deadline );

    void removeTask( final Integer pIdTask, final Object pUser );

    public List<String> getServiceErrors();

    public List<String> getFormErrors();

}
