package com.wallouf.doit.forms;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class RegisterUserForm {

    @NotEmpty
    @Pattern( regexp = ".{0,49}" )
    private String name;
    @NotEmpty
    @Pattern( regexp = ".{0,46}" )
    private String password;
    @NotEmpty
    @Pattern( regexp = ".{0,46}" )
    private String passwordBis;
    @NotEmpty
    @Pattern( regexp = "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" )
    private String email;

    public boolean checkPassword() {
        if ( password.equals( passwordBis ) ) {
            return true;
        } else {
            return false;
        }
    }

    public String getName() {
        return name;
    }

    public void setName( final String pName ) {
        name = pName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword( final String pPassword ) {
        password = pPassword;
    }

    public String getPasswordBis() {
        return passwordBis;
    }

    public void setPasswordBis( final String pPasswordBis ) {
        passwordBis = pPasswordBis;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail( final String pEmail ) {
        email = pEmail;
    }
}
