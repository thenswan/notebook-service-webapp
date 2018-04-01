package com.notebookservice.model.AbstractModels;


import com.notebookservice.model.Issue;
import com.notebookservice.model.User;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by admin on 11.12.2017.
 */
@Entity
public abstract class Device {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long deviceId;

    private String Manufactuer = new String();
    private String Model = new String();
    private String Type = new String();
    private String Code = new String();

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="userid")
    private User user;

    @ElementCollection(targetClass=Issue.class)
    @OneToMany(targetEntity=Issue.class, mappedBy="device", fetch=FetchType.EAGER)
    private Set<Issue> Issues = new HashSet<Issue>();

    public Device() {
    }


    public Device(String manufactuer, String model, String type, String  code, Set<Issue> issues) {
        Manufactuer = manufactuer;
        Model = model;
        Type = type;
        Code = code;
        Issues = issues;
        for (Issue q:Issues) {
            q.setDevice(this);
        }
    }


    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long id) {
        deviceId = id;
    }

    public String getManufactuer() {
        return Manufactuer;
    }



    public void setManufactuer(String manufactuer) {
        this.Manufactuer = manufactuer;
    }

    public String getModel() {
        return Model;
    }



    public void setModel(String model) {
        this.Model = model;
    }

    public String getType() {
        return Type;
    }



    public void setType(String type) {
        this.Type = type;
    }

    public String getCode() {
        return Code;
    }



    public void setCode(String code) {
        this.Code = code;
    }



    public Set<Issue> getIssues() {
        return Issues;
    }

    public void setIssues(Set<Issue> issues) {
        Issues = issues;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
