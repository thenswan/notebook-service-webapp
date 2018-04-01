package com.notebookservice.service;


import com.notebookservice.model.Issue;

import java.util.List;

public interface IssueService {

    public void addIssue(Issue Issue);

    public List<Issue> getAllIssues();

    public void deleteIssue(Long IssueId);

    public Issue getIssue(Long IssueId);

    public List<Issue> getIssueByUser(String name);

    public Issue updateIssue(Issue issue);
}
