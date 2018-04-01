package com.notebookservice.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.notebookservice.model.Issue;

import java.util.List;

@Repository
public class IssueDaoImpl implements IssueDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public IssueDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addIssue(Issue Issue) {
        sessionFactory.getCurrentSession().save(Issue);
    }

    @SuppressWarnings({"JpaQlInspection", "unchecked"})
    @Override
    public List<Issue> getAllIssues() {
        return sessionFactory.getCurrentSession().createQuery("FROM Issue")
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
    public List<Issue> getAllIssuesByManufacturer(String name) {
        return null;
    }

}
