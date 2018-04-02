package com.notebookservice.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public abstract class Device {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long deviceId;

    private String manufacturer = "";

    private String model = "";

    private String type = "";

    private String code = "";

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userid")
    private User user;

    @ElementCollection(targetClass = Issue.class)
    @OneToMany(targetEntity = Issue.class, mappedBy = "device", fetch = FetchType.EAGER)
    private Set<Issue> issueHashSet = new HashSet<>();

    public Device() {
    }

    public Device(String manufacturer, String model, String type, String code, Set<Issue> issueHashSet) {
        this.manufacturer = manufacturer;
        this.model = model;
        this.type = type;
        this.code = code;
        this.issueHashSet = issueHashSet;

        for (Issue aIssue : this.issueHashSet) {
            aIssue.setDevice(this);
        }
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long id) {
        deviceId = id;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Set<Issue> getIssueHashSet() {
        return issueHashSet;
    }

    public void setIssueHashSet(Set<Issue> issueHashSet) {
        this.issueHashSet = issueHashSet;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
