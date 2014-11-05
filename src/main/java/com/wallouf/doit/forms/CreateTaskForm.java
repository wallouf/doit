package com.wallouf.doit.forms;

import org.joda.time.DateTime;

public class CreateTaskForm {
    private Integer  id;
    private String   name;
    private String   description;
    private DateTime deadline;
    private String   state;
    private Integer  notification;
    private String   color;
    private Integer  position;

    public Integer getId() {
        return id;
    }

    public void setId( Integer id ) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName( String name ) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription( String description ) {
        this.description = description;
    }

    public Integer getNotification() {
        return notification;
    }

    public void setNotification( Integer notification ) {
        this.notification = notification;
    }

    public String getState() {
        return state;
    }

    public void setState( String state ) {
        this.state = state;
    }

    public DateTime getDeadline() {
        return deadline;
    }

    public void setDeadline( DateTime deadline ) {
        this.deadline = deadline;
    }

    public String getColor() {
        return color;
    }

    public void setColor( String color ) {
        this.color = color;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition( Integer position ) {
        this.position = position;
    }

}
