package com.notebookservice.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.notebookservice.model.Device;


import java.util.List;

@Repository
public class DeviceDaoImpl implements DeviceDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public DeviceDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addDevice(Device device) {
        sessionFactory.getCurrentSession().saveOrUpdate(device);
    }

    public List<Device> getAllDevices() {
        //noinspection JpaQlInspection
        for (Object o : sessionFactory.getCurrentSession().createQuery("FROM Device").list()) {
            System.out.println(((Device) o).getModel());
        }
        //noinspection unchecked,JpaQlInspection
        return sessionFactory.getCurrentSession().createQuery("FROM Device")
                .list();
    }

    @SuppressWarnings({"unchecked", "JpaQlInspection"})
    public List<Device> getAllDevicesByUsers(String name) {
        return sessionFactory.getCurrentSession().createQuery("select d from Device d JOIN d.user u where u.username like '" + name + "'")
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

    public Device getDevice(Long deviceId) {
        return (Device) sessionFactory.getCurrentSession().get(
                Device.class, deviceId);
    }

    @Override
    public Device updateDevice(Device device) {
        sessionFactory.getCurrentSession().update(device);
        return device;
    }
}
