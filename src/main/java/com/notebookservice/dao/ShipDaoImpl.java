package com.notebookservice.dao;

import com.notebookservice.model.Ship;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShipDaoImpl implements ShipDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addShip(Ship Ship) {
        sessionFactory.getCurrentSession().saveOrUpdate(Ship);

    }

    @SuppressWarnings("unchecked")
    public List<Ship> getAllShips() {


        for(Object o : sessionFactory.getCurrentSession().createQuery("from Ship").list()){
            System.out.println(((Ship)o).getName());
        }
        return sessionFactory.getCurrentSession().createQuery("from Ship")
                .list();
    }

    @Override
    public void deleteShip(Integer ShipId) {
        Ship Ship = (Ship) sessionFactory.getCurrentSession().load(
                Ship.class, ShipId);
        if (null != Ship) {
            this.sessionFactory.getCurrentSession().delete(Ship);
        }

    }

    public Ship getShip(int empid) {
        return (Ship) sessionFactory.getCurrentSession().get(
                Ship.class, empid);
    }

    @Override
    public Ship updateShip(Ship Ship) {
        sessionFactory.getCurrentSession().update(Ship);
        return Ship;
    }
}
