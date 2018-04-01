package com.notebookservice.model;


import com.notebookservice.model.AbstractModels.Device;

import javax.persistence.*;

/**
 * Created by admin on 11.12.2017.
 */
@Entity
public class Issue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long issueId;


    private String Name = new String();
    private String Discription = new String();
    private Boolean Fixed = new Boolean(false);

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="deviceId")
    private Device device;




    public Issue() {
    }

    public Issue(String name, String discription) {
        Name = name;
        Discription = discription;

    }

    public Long getIssueId() {
        return issueId;
    }

    public void setIssueId(Long id) {
        this.issueId = id;
    }


    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }



    public String getDiscription() {
        return Discription;
    }

    public void setDiscription(String discription) {
        this.Discription = discription;
    }



    public boolean isFixed() {
        return Fixed;
    }

    public void setFixed(boolean fixed) {
        this.Fixed = fixed;
    }


    public Device getDevice() {
        return device;
    }

    public void setDevice(Device device) {
        this.device = device;
    }

    //    public Tablet getTablet() {
//        return tablet;
//    }
//
//    public void setTablet(Tablet device) {
//        this.tablet = device;
//    }
}
