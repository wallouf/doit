package com.wallouf.doit.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wallouf.doit.dao.ITaskDAO;
import com.wallouf.doit.entities.Task;
import com.wallouf.doit.entities.User;

@Service
public class ServiceTask implements IServiceTask {

    @Autowired
    private ITaskDAO            dao;
    private List<String>        serviceErrors                   = new ArrayList<String>();
    private List<String>        formErrors                      = new ArrayList<String>();

    private static final String DATE_PATTERN                    = "yyyy-MM-dd HH:mm:ss";

    final private List<String>  TASK_STATE                      = Arrays.asList( "To do", "Done", "Urgent", "None" );

    final private String        ERROR_MESSAGE_taskNotFound      = "Task.search.NotFound";
    final private String        ERROR_MESSAGE_userEmpty         = "Task.creation.user.NotEmpty";
    final private String        ERROR_MESSAGE_nameLength        = "Task.creation.name.Length";
    final private String        ERROR_MESSAGE_nameEmpty         = "Task.creation.name.NotEmpty";
    final private String        ERROR_MESSAGE_idNotFound        = "Task.edition.id.NotFound";
    final private String        ERROR_MESSAGE_deadlineFormat    = "Task.form.deadline.Format";
    final private String        ERROR_MESSAGE_notificationEmpty = "Task.creation.notification.NotEmpty";

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

    @Transactional( readOnly = true )
    public List<Task> findTasks( final Object pUser ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        checkUser( pUser );
        if ( getFormErrors().isEmpty() ) {
            return dao.findTasks( ( (User) pUser ).getId() );
        } else {
            return null;
        }
    }

    @Transactional( readOnly = true )
    public List<Task> findDoneTasks( final Object pUser ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        checkUser( pUser );
        if ( getFormErrors().isEmpty() ) {
            return dao.findDoneTasks( ( (User) pUser ).getId() );
        } else {
            return null;
        }
    }

    @Transactional( readOnly = true )
    public List<Task> findNotDoneTasks( final Object pUser ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        checkUser( pUser );
        if ( getFormErrors().isEmpty() ) {
            return dao.findNotDoneTasks( ( (User) pUser ).getId() );
        } else {
            return null;
        }
    }

    @Transactional( readOnly = true )
    public Task findTask( final Integer pTaskId, final Object pUser ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        return getTask( pTaskId, pUser );
    }

    @Transactional( readOnly = true )
    private Task getTask( final Integer pTaskId, final Object pUser ) {
        // TODO Auto-generated method stub
        checkUser( pUser );
        if ( getFormErrors().isEmpty() ) {
            Task oTaskTemp = dao.findTask( pTaskId, ( (User) pUser ).getId() );
            if ( oTaskTemp == null ) {
                setFormError( ERROR_MESSAGE_taskNotFound );
            }
            return oTaskTemp;
        } else {
            return null;
        }
    }

    @Transactional
    public void editTask( Integer pIdTask, String name, String description, String state, String deadline,
            Integer notification, String color, Integer position, final Object pUser ) {
        // TODO Auto-generated method stub
        // TODO Auto-generated method stub
        resetErrorsMaps();
        checkId( pIdTask );
        checkUser( pUser );
        checkName( name );
        checkDeadline( deadline );
        state = checkState( state );
        notification = checkNotification( notification );
        if ( getFormErrors().isEmpty() ) {
            Task oTaskTemp = getTask( pIdTask, pUser );
            if ( oTaskTemp != null ) {
                oTaskTemp.setName( name );
                oTaskTemp.setDescription( description );
                oTaskTemp.setNotification( notification );
                oTaskTemp.setState( state );
                oTaskTemp.setCreated( new DateTime() );
                oTaskTemp.setOwner( (User) pUser );
                if ( deadline != null && deadline.length() > 0 ) {
                    oTaskTemp.setDeadline( DateTime.parse( getFullDeadline( deadline ),
                            DateTimeFormat.forPattern( DATE_PATTERN ) ) );
                } else {
                    oTaskTemp.setDeadline( null );
                }
                dao.editTask( oTaskTemp );
            }
        }
    }

    @Transactional
    public void editTaskState( Integer pIdTask, final Object pUser, String state ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        Task oTaskTemp = getTask( pIdTask, pUser );
        if ( oTaskTemp != null ) {
            state = checkState( state );
            oTaskTemp.setState( state );
            oTaskTemp.setCreated( new DateTime() );
            dao.editTask( oTaskTemp );
        }
    }

    @Transactional
    public void editTaskPosition( Integer pIdTask, final Object pUser, Integer position ) {
        // TODO Auto-generated method stub

    }

    @Transactional
    public void editTaskColor( Integer pIdTask, final Object pUser, String color ) {
        // TODO Auto-generated method stub

    }

    @Transactional
    public void editTaskDeadline( Integer pIdTask, final Object pUser, String deadline ) {
        // TODO Auto-generated method stub

    }

    @Transactional
    public void removeTask( Integer pIdTask, final Object pUser ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        if ( getTask( pIdTask, pUser ) != null ) {
            final Task lTask = new Task();
            lTask.setId( pIdTask );
            dao.removeTask( lTask );
        }
    }

    private void resetErrorsMaps() {
        formErrors.clear();
        serviceErrors.clear();
    }

    @Transactional
    public void createTask( String name, String description, String state, String deadline, Integer notification,
            String color,
            Integer position, Object pUser ) {
        // TODO Auto-generated method stub
        resetErrorsMaps();
        checkUser( pUser );
        checkName( name );
        checkDeadline( deadline );
        state = checkState( state );
        notification = checkNotification( notification );
        if ( getFormErrors().isEmpty() ) {
            final Task lTask = new Task();
            lTask.setName( name );
            lTask.setDescription( description );
            lTask.setNotification( notification );
            lTask.setState( state );
            lTask.setCreated( new DateTime() );
            lTask.setOwner( (User) pUser );
            if ( deadline != null && deadline.length() > 0 ) {
                lTask.setDeadline( DateTime.parse( getFullDeadline( deadline ),
                        DateTimeFormat.forPattern( DATE_PATTERN ) ) );
            }
            dao.createTask( lTask );
        }
    }

    private void checkUser( Object pUser ) {
        if ( pUser == null || !pUser.getClass().equals( User.class ) ) {
            setFormError( ERROR_MESSAGE_userEmpty );
        }
    }

    private void checkId( Integer iTaskId ) {
        if ( iTaskId == null || iTaskId <= 0 ) {
            setFormError( ERROR_MESSAGE_idNotFound );
        }
    }

    private String getFullDeadline( String sDeadline ) {
        return sDeadline + ":00";
    }

    private void checkDeadline( String sDeadline ) {
        if ( sDeadline != null && sDeadline.length() > 0 ) {
            if ( !sDeadline.matches( "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}" ) ) {
                setFormError( ERROR_MESSAGE_deadlineFormat );
            }
        }
    }

    private void checkName( String pName ) {
        if ( pName == null || pName.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_nameEmpty );
        } else if ( pName.trim().length() > 50 ) {
            setFormError( ERROR_MESSAGE_nameLength );
        }
    }

    private String checkState( String sState ) {
        if ( !TASK_STATE.contains( sState ) ) {
            return "None";
        } else {
            return sState;
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
