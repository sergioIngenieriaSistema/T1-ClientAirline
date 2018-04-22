/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.airline;

import java.io.Serializable;

/**
 *
 * @author sldia
 */
public class Flight implements Serializable{
    private String id;
    private Company company;
    private Route route;
    private String capacity;
    private String flightNumber;
    private String plainModel;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getPlainModel() {
        return plainModel;
    }

    public void setPlainModel(String plainModel) {
        this.plainModel = plainModel;
    }

    
}
