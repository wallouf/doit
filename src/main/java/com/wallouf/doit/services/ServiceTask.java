package com.wallouf.doit.services;

import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wallouf.doit.dao.ITaskDAO;
import com.wallouf.doit.entities.Task;

@Service
public class ServiceTask implements IServiceTask {

    @Autowired
    private ITaskDAO     dao;
    private List<String> serviceErrors                   = new ArrayList<String>();
    private List<String> formErrors                      = new ArrayList<String>();

    final private String ERROR_MESSAGE_nameLength        = "Task.creation.name.Length";
    final private String ERROR_MESSAGE_nameEmpty         = "Task.creation.name.NotEmpty";
    final private String ERROR_MESSAGE_notificationEmpty = "Task.creation.notification.NotEmpty";

    public List<String> getServiceErrors() {
        return serviceErrors;
    }

    public List<String> getFormErrors() {
        return formErrors;
    }

    private void setServiceError( String message ) {
        serviceErrors.add( message );
    }

    private void setFormError( String message ) {
        formErrors.add( message );
    }

    public List<Task> findTasks() {
        // TODO Auto-generated method stub
        return dao.findTasks();
    }

    public Task findTask( final Integer pTaskId ) {
        // TODO Auto-generated method stub
        return dao.findTask( pTaskId );
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
        final Task lTask = new Task();
        lTask.setId( pIdTask );
        dao.removeTask( lTask );
    }

    private void resetErrorsMaps() {
        formErrors.clear();
        serviceErrors.clear();
    }

    public void createTask( String name, String description, String state, DateTime deadline, Integer notification,
            String color,
            Integer position ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        checkName( name );
        notification = checkNotification( notification );
        if ( getFormErrors().isEmpty() ) {
            final Task lTask = new Task();
            lTask.setName( name );
            lTask.setDescription( description );
            lTask.setNotification( notification );
            lTask.setState( "To do" );
            dao.createTask( lTask );
        }
    }

    private void checkName( String pName ) {
        if ( pName == null || pName.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_nameEmpty );
        } else if ( pName.trim().length() > 50 ) {
            setFormError( ERROR_MESSAGE_nameLength );
        }
    }

    private Integer checkNotification( Integer pNotification ) {
        if ( pNotification != null && pNotification != 1 ) {
            setFormError( ERROR_MESSAGE_notificationEmpty );
            return 0;
        } else if ( pNotification == null ) {
            return 0;
        } else {
            return pNotification;
        }
    }
}
