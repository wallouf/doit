package com.wallouf.doit.services;

import java.util.List;

import org.joda.time.DateTime;

import com.wallouf.doit.entities.Task;

public class ServiceTask implements IServiceTask {

    public List<Task> findTasks() {
        // TODO Auto-generated method stub
        return null;
    }

    public Task findTask( String name ) {
        // TODO Auto-generated method stub
        return null;
    }

    public void createTask( Task pTask ) {
        // TODO Auto-generated method stub

    }

    public void editTask( Integer pIdTask, String name, String description, String state, DateTime deadline,
            Integer notifications, String color, Integer position ) {
        // TODO Auto-generated method stub

    }

    public void editTaskState( Integer pIdTask, String state ) {
        // TODO Auto-generated method stub

    }

    public void editTaskPosition( Integer pIdTask, Integer position ) {
        // TODO Auto-generated method stub

    }

    public void editTaskColor( Integer pIdTask, String color ) {
        // TODO Auto-generated method stub

    }

    public void editTaskDeadline( Integer pIdTask, DateTime deadline ) {
        // TODO Auto-generated method stub

    }

    public void removeTask( Integer pIdTask ) {
        // TODO Auto-generated method stub

    }

}
