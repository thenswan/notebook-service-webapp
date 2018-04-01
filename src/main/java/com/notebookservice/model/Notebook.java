package com.notebookservice.model;

import javax.persistence.Entity;
import java.util.Set;

@Entity
public class Notebook extends Device {

    public Notebook() {
    }

    public Notebook(String manufacturer, String model, String type, String code, Set<Issue> issues) {
        super(manufacturer, model, type, code, issues);
    }

    @Override
    public Long getDeviceId() {
        return super.getDeviceId();
    }

    @Override
    public void setDeviceId(Long id) {
        super.setDeviceId(id);
    }

    public String getManufacturer() {
        return super.getManufacturer();
    }

    public void setManufacturer(String manufacturer) {
        super.setManufacturer(manufacturer);
    }

    @Override
    public String getModel() {
        return super.getModel();
    }

    @Override
    public void setModel(String model) {
        super.setModel(model);
    }

    @Override
    public String getType() {
        return super.getType();
    }

    @Override
    public void setType(String type) {
        super.setType(type);
    }

    @Override
    public String getCode() {
        return super.getCode();
    }

    @Override
    public void setCode(String code) {
        super.setCode(code);
    }

    @Override
    public Set<Issue> getIssueHashSet() {
        return super.getIssueHashSet();
    }

    @Override
    public void setIssueHashSet(Set<Issue> issueHashSet) {
        super.setIssueHashSet(issueHashSet);
    }
}
