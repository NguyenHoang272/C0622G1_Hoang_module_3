package repository;

import model.facility.Facility;

import java.util.List;

public interface IRepoFacility {
    List<Facility> getListService();

    boolean deleteFacility(int id);

    List<Facility> findByName(String search);

    void addFacility(Facility newfacility);

    Facility selectFacility(int id);

    boolean editFacility(Facility newfacility);

    List<Facility> find(String search, int type);
}
