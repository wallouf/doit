package com.wallouf.doit.services;

import java.util.List;

import org.joda.time.DateTime;

import com.wallouf.doit.entities.Task;

public interface IServiceTask {

    List<Task> findTasks( final Integer pTaskUserId );

    Task findTask( final Integer pTaskId, final Integer pTaskUserId );

    void createTask( final String name, final String description, final String state, final DateTime deadline,
            final Integer notification,
            final String color, final Integer position, final Object pUser );

    void editTask( final Integer pIdTask, final String name, final String description, final String state,
            final DateTime deadline, final Integer notifications, final String color, final Integer position );

    void editTaskState( final Integer pIdTask, final String state );

    void editTaskPosition( final Integer pIdTask, final Integer position );

    void editTaskColor( final Integer pIdTask, final String color );

    void editTaskDeadline( final Integer pIdTask, final DateTime deadline );

    void removeTask( final Integer pIdTask );

    public List<String> getServiceErrors();

    public List<String> getFormErrors();

}
