package com.notebookservice.service;

import com.notebookservice.model.Device;

import java.util.List;

public interface DeviceService {

    public void addDevice(Device device);

    public List<Device> getAllDevices();

    public void deleteDevice(Long deviceId);

    public Device getDevice(Long deviceId);

    public List<Device> getDeviceByUser(String name);

}
