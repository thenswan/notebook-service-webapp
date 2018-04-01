package com.notebookservice.model;





import javax.persistence.*;

/**
 * Created by admin on 21.04.17.
 */
@Entity
@Table(name = "ships")
public class Ship {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "name")
    private String Name = new String();

    @Column(name = "type")
    private String Type = new String();

    @Column(name = "year")
    private Integer Year;

    @Column(name = "length")
    private Double Length;

    @Column(name = "width")
    private Double Width ;

    @Column(name = "eqpweight")
    private Integer EqpWeight;

    @Column(name = "maxseaguage")
    private Double MaxSeaguage;

    @Column(name = "maxcarrying")
    private Integer MaxCarrying;

    @Column(name = "flag")
    private String Flag = new String();

    public Ship(){}


    public Ship(String name, String type, Integer year, Double length, Double width, Integer eqpWeight, Double maxSeaguage, Integer maxCarrying, String flag) {
        Name = name;
        Type = type;
        Year = year;
        Length = length;
        Width = width;
        EqpWeight = eqpWeight;
        MaxSeaguage = maxSeaguage;
        MaxCarrying = maxCarrying;
        Flag = flag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public Integer getYear() {
        return Year;
    }

    public void setYear(Integer year) {
        Year = year;
    }

    public Double getLength() {
        return Length;
    }

    public void setLength(Double length) {
        Length = length;
    }

    public Double getWidth() {
        return Width;
    }

    public void setWidth(Double width) {
        Width = width;
    }

    public Integer getEqpWeight() {
        return EqpWeight;
    }

    public void setEqpWeight(Integer eqpWeight) {
        EqpWeight = eqpWeight;
    }

    public Double getMaxSeaguage() {
        return MaxSeaguage;
    }

    public void setMaxSeaguage(Double maxSeaguage) {
        MaxSeaguage = maxSeaguage;
    }

    public Integer getMaxCarrying() {
        return MaxCarrying;
    }

    public void setMaxCarrying(Integer maxCarrying) {
        MaxCarrying = maxCarrying;
    }

    public String getFlag() {
        return Flag;
    }

    public void setFlag(String flag) {
        Flag = flag;
    }

    @Override
    public String toString() {
        return "Ship{" +
                "ShipId=" + id +
                ", Name=" + Name +
                ", Type=" + Type +
                ", Year=" + Year +
                ", Length=" + Length +
                ", Width=" + Width +
                ", EqpWeight=" + EqpWeight +
                ", MaxSeaguage=" + MaxSeaguage +
                ", MaxCarrying=" + MaxCarrying +
                ", Flag=" + Flag +
                '}';
    }
}
