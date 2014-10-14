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
    @Column( name = "IDOBJET" )
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

}
