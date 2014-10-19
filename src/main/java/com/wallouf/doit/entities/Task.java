package com.wallouf.doit.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table( name = "doit_task" )
public class Task {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "id" )
    private Integer  id;
    private String   name;
    private String   description;
    private String   state;
    @Column
    @Type( type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime" )
    @DateTimeFormat( style = "SS" )
    private DateTime created;
    @Column
    @Type( type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime" )
    @DateTimeFormat( style = "SS" )
    private DateTime deadline;
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

    public String getState() {
        return state;
    }

    public void setState( String state ) {
        this.state = state;
    }

    public DateTime getCreated() {
        return created;
    }

    public void setCreated( DateTime created ) {
        this.created = created;
    }

    public DateTime getDeadline() {
        return deadline;
    }

    public void setDeadline( DateTime deadline ) {
        this.deadline = deadline;
    }

    public Integer getNotification() {
        return notification;
    }

    public void setNotification( Integer notification ) {
        this.notification = notification;
    }

    public String getColor() {
        return color;
    }

    public void setColor( String color ) {
        this.color = color;
    }

}
