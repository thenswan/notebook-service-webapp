package com.notebookservice.dao;

import com.notebookservice.model.AbstractModels.Device;

import java.util.List;


public interface DeviceDao {

    public void addDevice(Device device);

    public List<Device> getAllDevices();

    public void deleteDevice(Long deviceId);

    public Device updateDevice(Device device);

    public Device getDevice(Long deviceId);

    public List<Device> getAllDevicesByUsers(String name);

}
