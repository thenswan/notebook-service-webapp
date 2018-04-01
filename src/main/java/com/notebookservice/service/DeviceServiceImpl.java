package com.notebookservice.service;

import com.notebookservice.dao.DeviceDao;
import com.notebookservice.model.AbstractModels.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DeviceServiceImpl implements DeviceService{

    @Autowired
    private com.notebookservice.dao.DeviceDao DeviceDao;

    @Override
    @Transactional
    public void addDevice(Device Device) {
        DeviceDao.addDevice(Device);
    }

    @Override
    @Transactional
    public List<Device> getAllDevices() {
        return DeviceDao.getAllDevices();
    }

    @Override
    @Transactional
    public void deleteDevice(Long DeviceId) {
        DeviceDao.deleteDevice(DeviceId);
    }

    public Device getDevice(Long empid) {
        return DeviceDao.getDevice(empid);
    }

    @Transactional
    public List<Device> getDeviceByUser(String name){
        return DeviceDao.getAllDevicesByUsers(name);
    }
    @Transactional
    public Device updateDevice(Device Device) {

        return DeviceDao.updateDevice(Device);
    }

    public void setDeviceDAO(DeviceDao DeviceDAO) {
        this.DeviceDao = DeviceDAO;
    }


}
