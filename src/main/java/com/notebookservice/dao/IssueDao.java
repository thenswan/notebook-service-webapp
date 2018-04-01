package com.notebookservice.dao;

import com.notebookservice.model.Issue;

import java.util.List;

public interface IssueDao {

    public void addIssue(Issue Issue);

    public List<Issue> getAllIssues();

    public void deleteIssue(Long IssueId);

    public Issue updateIssue(Issue Issue);

    public Issue getIssue(Long IssueId);

    public List<Issue> getAllIssuesByManuf(String name);
}
