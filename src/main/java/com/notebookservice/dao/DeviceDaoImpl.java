package com.notebookservice.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.notebookservice.model.AbstractModels.Device;


import java.util.List;

@Repository
public class DeviceDaoImpl implements DeviceDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addDevice(Device device) {
        sessionFactory.getCurrentSession().saveOrUpdate(device);

    }

    @SuppressWarnings("unchecked")
    public List<Device> getAllDevices() {


        for(Object o : sessionFactory.getCurrentSession().createQuery("from Device").list()){
            System.out.println(((Device)o).getModel());
        }
        return sessionFactory.getCurrentSession().createQuery("from Device")
                .list();
    }

    public List<Device> getAllDevicesByUsers(String name){


        System.out.println("/////////////////////////////////////////////");
        System.out.println("/////////////////////////////////////////////");
        System.out.println("/////////////////////////////////////////////");
        System.out.println("/////////////////////////////////////////////");
        //System.out.println(sessionFactory.getCurrentSession().createQuery("from User WHERE username like '"+ name + "'").list().toString());
        System.out.println("/////////////////////////////////////////////");
        System.out.println("/////////////////////////////////////////////");
        System.out.println("/////////////////////////////////////////////");
        System.out.println("/////////////////////////////////////////////");
      //  id = Integer.parseInt(sessionFactory.getCurrentSession().createQuery("User WHERE username like '"+name+"'").toString());
        //return sessionFactory.getCurrentSession().createQuery(" Device WHERE user =  '"+id+"'").list();
        return sessionFactory.getCurrentSession().createQuery("select d from Device d JOIN d.user u where u.username like '"+name+"'")
                .list();
    }
    @Override
    public void deleteDevice(Long deviceId) {
        Device device = (Device) sessionFactory.getCurrentSession().load(
                Device.class, deviceId);
        if (null != device) {
            this.sessionFactory.getCurrentSession().delete(device);
        }

    }

    public Device getDevice(Long empid) {
        return (Device) sessionFactory.getCurrentSession().get(
                Device.class, empid);
    }

    @Override
    public Device updateDevice(Device device) {
        sessionFactory.getCurrentSession().update(device);
        return device;
    }
}
