package com.wallouf.doit.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wallouf.doit.dao.IUserDAO;
import com.wallouf.doit.entities.User;

@Service
public class ServiceUser implements IServiceUser {

    @Autowired
    private IUserDAO            dao;
    private List<String>        serviceErrors                      = new ArrayList<String>();
    private List<String>        formErrors                         = new ArrayList<String>();
    public static final String  ATT_USER_SESSION                   = "userSession";

    private static final String ALGO_CHIFFREMENT                   = "SHA-256";
    final private String        ERROR_MESSAGE_userDoesntExists     = "User.connection.search.doesntExists";
    final private String        ERROR_MESSAGE_passwordMatch        = "User.connection.password.match";

    final private String        ERROR_MESSAGE_alreadyExists        = "User.creation.alreadyExists";
    final private String        ERROR_MESSAGE_confirmationPassword = "User.creation.password.Confirmation";

    final private String        ERROR_MESSAGE_nameLength           = "User.creation.name.Length";
    final private String        ERROR_MESSAGE_nameEmpty            = "User.creation.name.NotEmpty";
    final private String        ERROR_MESSAGE_emailLength          = "User.creation.email.Length";
    final private String        ERROR_MESSAGE_emailEmpty           = "User.creation.email.NotEmpty";
    final private String        ERROR_MESSAGE_emailPattern         = "User.creation.email.Pattern";
    final private String        ERROR_MESSAGE_passwordOldLength    = "User.creation.passwordOld.Length";
    final private String        ERROR_MESSAGE_passwordOldEmpty     = "User.creation.passwordOld.NotEmpty";
    final private String        ERROR_MESSAGE_passwordLength       = "User.creation.password.Length";
    final private String        ERROR_MESSAGE_passwordEmpty        = "User.creation.password.NotEmpty";
    final private String        ERROR_MESSAGE_passwordBisLength    = "User.creation.passwordBis.Length";
    final private String        ERROR_MESSAGE_passwordBisEmpty     = "User.creation.passwordBis.NotEmpty";

    private void setServiceError( String message ) {
        serviceErrors.add( message );
    }

    private void setFormError( String message ) {
        formErrors.add( message );
    }

    public List<String> getServiceErrors() {
        return serviceErrors;
    }

    public List<String> getFormErrors() {
        return formErrors;
    }

    @Transactional( readOnly = true )
    public List<User> rechercherUsers() {
        return dao.rechercherUsers();
    }

    @Transactional
    public void creerUser( String pName, String pPassword, String pPasswordBis, String pEmail ) {
        resetErrorsMaps();

        checkName( pName );
        checkEmail( pEmail );
        checkPassword( pPassword );
        checkPasswordBis( pPasswordBis );
        if ( getFormErrors().isEmpty() ) {
            if ( this.rechercherUser( pEmail ) != null ) {
                setServiceError( ERROR_MESSAGE_alreadyExists );
            }
            if ( !pPassword.equals( pPasswordBis ) ) {
                setServiceError( ERROR_MESSAGE_confirmationPassword );
            }
            if ( getServiceErrors().isEmpty() ) {
                ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
                passwordEncryptor.setAlgorithm( ALGO_CHIFFREMENT );
                passwordEncryptor.setPlainDigest( false );
                String pPasswordEncrypt = passwordEncryptor.encryptPassword( pPassword );

                final User lUser = new User();
                lUser.setName( pName );
                lUser.setPassword( pPasswordEncrypt );
                lUser.setEmail( pEmail );
                dao.creerUser( lUser );
            }
        }
    }

    @Transactional
    public void removeUser( User pUser ) {
        resetErrorsMaps();
        if ( pUser == null ) {

        } else {
            dao.supprimerUser( pUser );
        }
    }

    @Transactional( readOnly = true )
    public User rechercherUser( String email ) {
        resetErrorsMaps();
        return dao.rechercherUser( email );
    }

    private void checkName( String pName ) {
        if ( pName == null || pName.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_nameEmpty );
        } else if ( pName.trim().length() > 50 ) {
            setFormError( ERROR_MESSAGE_nameLength );
        }
    }

    private void checkEmail( String pEmail ) {
        if ( pEmail == null || pEmail.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_emailEmpty );
        } else if ( pEmail.trim().length() > 50 ) {
            setFormError( ERROR_MESSAGE_emailLength );
        } else if ( !pEmail.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            setFormError( ERROR_MESSAGE_emailPattern );
        }
    }

    private void checkPasswordOld( String pPassword ) {
        if ( pPassword == null || pPassword.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_passwordOldEmpty );
        } else if ( pPassword.trim().length() > 46 ) {
            setFormError( ERROR_MESSAGE_passwordOldLength );
        }
    }

    private void checkPassword( String pPassword ) {
        if ( pPassword == null || pPassword.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_passwordEmpty );
        } else if ( pPassword.trim().length() > 46 ) {
            setFormError( ERROR_MESSAGE_passwordLength );
        }
    }

    private void checkPasswordBis( String pPasswordBis ) {
        if ( pPasswordBis == null || pPasswordBis.trim().length() == 0 ) {
            setFormError( ERROR_MESSAGE_passwordBisEmpty );
        } else if ( pPasswordBis.trim().length() > 46 ) {
            setFormError( ERROR_MESSAGE_passwordBisLength );
        }
    }

    private void comparePassword( String password, User user ) {
        ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        passwordEncryptor.setAlgorithm( ALGO_CHIFFREMENT );
        passwordEncryptor.setPlainDigest( false );
        if ( !passwordEncryptor.checkPassword( password, user.getPassword() ) ) {
            setServiceError( ERROR_MESSAGE_passwordMatch );
        }
    }

    private void resetErrorsMaps() {
        formErrors.clear();
        serviceErrors.clear();
    }

    public User connecterUser( String email, String password ) {
        this.resetErrorsMaps();
        checkEmail( email );
        checkPassword( password );
        if ( getFormErrors().isEmpty() ) {
            User userRequired = rechercherUser( email );
            if ( userRequired == null ) {
                setServiceError( ERROR_MESSAGE_userDoesntExists );
            }
            if ( getServiceErrors().isEmpty() ) {
                comparePassword( password, userRequired );
                if ( getServiceErrors().isEmpty() ) {
                    return userRequired;
                }
            }
        }
        return null;
    }

    public boolean checkUpdatePassword( String pPasswordOld, String pPassword, String pPasswordBis, User pUser ) {
        boolean bIsSet = false;
        if ( pPasswordOld.trim().length() > 0 || pPassword.trim().length() > 0 || pPasswordBis.trim().length() > 0 ) {
            bIsSet = true;
            checkPasswordOld( pPasswordOld );
            checkPassword( pPassword );
            checkPasswordBis( pPasswordBis );
            if ( getFormErrors().isEmpty() ) {
                comparePassword( pPasswordOld, pUser );
                if ( !pPassword.equals( pPasswordBis ) ) {
                    setServiceError( ERROR_MESSAGE_confirmationPassword );
                }
            }
        }
        return bIsSet;
    }

    @Transactional
    public User updateUser( String pName, String pPasswordOld, String pPassword, String pPasswordBis, String pEmail,
            User pUser ) {
        // TODO Auto-generated method stub
        this.resetErrorsMaps();
        checkName( pName );
        checkEmail( pEmail );
        boolean bIsSet = checkUpdatePassword( pPasswordOld, pPassword, pPasswordBis, pUser );
        User oTestUser = this.rechercherUser( pEmail );
        if ( oTestUser != null && oTestUser.getId() != pUser.getId() ) {
            setServiceError( ERROR_MESSAGE_alreadyExists );
        }
        if ( getFormErrors().isEmpty() && getServiceErrors().isEmpty() ) {
            pUser.setName( pName );
            pUser.setEmail( pEmail );
            if ( bIsSet ) {
                ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
                passwordEncryptor.setAlgorithm( ALGO_CHIFFREMENT );
                passwordEncryptor.setPlainDigest( false );
                String pPasswordEncrypt = passwordEncryptor.encryptPassword( pPassword );
                pUser.setPassword( pPasswordEncrypt );
            }
            dao.updateUser( pUser );
        }
        return pUser;
    }

    public User getActualUser( HttpServletRequest request ) {
        // TODO Auto-generated method stub
        try {
            return (User) request.getSession().getAttribute( ATT_USER_SESSION );
        } catch ( Exception e ) {
            e.printStackTrace();
            return null;
        }
    }
}
