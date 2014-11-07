package com.wallouf.doit.forms;

public class UpdateUserForm {
    private String name;
    private String passwordOld;
    private String password;
    private String passwordBis;
    private String email;

    public String getName() {
        return name.trim();
    }

    public void setName( final String pName ) {
        name = pName;
    }

    public String getPasswordOld() {
        return passwordOld;
    }

    public void setPasswordOld( String passwordOld ) {
        this.passwordOld = passwordOld;
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
