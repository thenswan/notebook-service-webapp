package com.notebookservice.dao;

import com.notebookservice.model.Ship;


import java.util.List;

public interface ShipDao {

    public void addShip(Ship Ship);

    public List<Ship> getAllShips();

    public void deleteShip(Integer ShipId);

    public Ship updateShip(Ship Ship);

    public Ship getShip(int Shipid);

}
