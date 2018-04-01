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


    @Autowired
    private IssueDao issueDao;

    @Override
    @Transactional
    public void addIssue(Issue Issue) {
        issueDao.addIssue(Issue);
    }

    @Override
    @Transactional
    public List<Issue> getAllIssues() {
        return issueDao.getAllIssues();
    }

    @Override
    @Transactional
    public void deleteIssue(Long IssueId) {
        issueDao.deleteIssue(IssueId);
    }

    public Issue getIssue(Long empid) {
        return issueDao.getIssue(empid);
    }

    @Transactional
    public List<Issue> getIssueByUser(String name){
        return issueDao.getAllIssuesByManuf(name);
    }
    @Override
    @Transactional
    public Issue updateIssue(Issue Issue) {
        return issueDao.updateIssue(Issue);
    }

    public void setIssueDAO(IssueDao IssueDAO) {
        this.issueDao = IssueDAO;
    }
}
