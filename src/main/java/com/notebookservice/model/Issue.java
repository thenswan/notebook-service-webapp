package com.notebookservice.model;

import javax.persistence.*;

@Entity
public class Issue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long issueId;

    private String name = "";

    private String description = "";

    private Boolean fixed = Boolean.FALSE;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "deviceId")
    private Device device;

    public Issue() {
    }

    public Issue(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public Long getIssueId() {
        return issueId;
    }

    public void setIssueId(Long id) {
        this.issueId = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getFixed() {
        return fixed;
    }

    public void setFixed(boolean fixed) {
        this.fixed = fixed;
    }

    public Device getDevice() {
        return device;
    }

    public void setDevice(Device device) {
        this.device = device;
    }

}