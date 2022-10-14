package service;

import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> getListService();

    boolean deleteFacility(int id);

    List<Facility> findByName(String search);

    void addFacility(Facility newfacility);

    Facility selectFacility(int id);

    boolean edit(Facility newfacility);

    List<Facility> find(String search, int type);
}
