package com.notebookservice.service;

import com.notebookservice.dao.DeviceDao;
import com.notebookservice.model.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DeviceServiceImpl implements DeviceService {

    private DeviceDao deviceDao;

    @Autowired
    public DeviceServiceImpl(DeviceDao DeviceDao) {
        this.deviceDao = DeviceDao;
    }

    @Override
    @Transactional
    public void addDevice(Device device) {
        deviceDao.addDevice(device);
    }

    @Override
    @Transactional
    public List<Device> getAllDevices() {
        return deviceDao.getAllDevices();
    }

    @Override
    @Transactional
    public void deleteDevice(Long deviceId) {
        deviceDao.deleteDevice(deviceId);
    }

    public Device getDevice(Long deviceId) {
        return deviceDao.getDevice(deviceId);
    }

    @Transactional
    public List<Device> getDeviceByUser(String name) {
        return deviceDao.getAllDevicesByUsers(name);
    }

    @Transactional
    public Device updateDevice(Device Device) {
        return deviceDao.updateDevice(Device);
    }

    public void setDeviceDAO(DeviceDao deviceDao) {
        this.deviceDao = deviceDao;
    }

}
