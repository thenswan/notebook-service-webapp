package com.notebookservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.notebookservice.dao.IssueDao;
import com.notebookservice.model.Issue;


import java.util.List;

@Service
@Transactional
public class IssueServiceImpl implements IssueService{

    private IssueDao issueDao;

    @Autowired
    public IssueServiceImpl(IssueDao issueDao) {
        this.issueDao = issueDao;
    }

    @Override
    @Transactional
    public void addIssue(Issue issue) {
        issueDao.addIssue(issue);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public List<Issue> getAllIssues() {
        return issueDao.getAllIssues();
    }

    @Override
    @Transactional
    public void deleteIssue(Long issueId) {
        issueDao.deleteIssue(issueId);
    }

    public Issue getIssue(Long issueId) {
        return issueDao.getIssue(issueId);
    }

    @Transactional
    public List<Issue> getIssueByUser(String manufacturerName){
        return issueDao.getAllIssuesByManufacturer(manufacturerName);
    }

    @Override
    @Transactional
    public Issue updateIssue(Issue issue) {
        return issueDao.updateIssue(issue);
    }

    public void setIssueDAO(IssueDao IssueDAO) {
        this.issueDao = IssueDAO;
    }
}
