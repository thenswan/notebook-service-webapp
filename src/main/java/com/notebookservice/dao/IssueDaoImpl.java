package com.notebookservice.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.notebookservice.model.Issue;

import java.util.List;

@Repository
public class IssueDaoImpl implements IssueDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addIssue(Issue Issue) {
        sessionFactory.getCurrentSession().save(Issue);
    }

    @Override
    public List<Issue> getAllIssues() {
        return sessionFactory.getCurrentSession().createQuery("from Issue")
                .list();
    }

    @Override
    public void deleteIssue(Long IssueId) {
        Issue device = (Issue) sessionFactory.getCurrentSession().load(
                Issue.class, IssueId);
        if (null != device) {
            this.sessionFactory.getCurrentSession().delete(device);
        }
    }

    @Override
    public Issue updateIssue(Issue Issue) {
        sessionFactory.getCurrentSession().update(Issue);
        return Issue;
    }

    @Override
    public Issue getIssue(Long IssueId) {
        return (Issue) sessionFactory.getCurrentSession().get(
                Issue.class, IssueId);
    }

    @Override
    public List<Issue> getAllIssuesByManuf(String name) {
        return null;
    }



}
