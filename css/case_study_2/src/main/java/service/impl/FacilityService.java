package service.impl;

import model.facility.Facility;
import repository.IRepoFacility;
import repository.impl.RepoFacility;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IRepoFacility repoFacility = new RepoFacility();

    @Override
    public List<Facility> getListService() {
        return repoFacility.getListService();
    }

    @Override
    public boolean deleteFacility(int id) {
        return repoFacility.deleteFacility(id);
    }

    @Override
    public List<Facility> findByName(String search) {
        return repoFacility.findByName(search);
    }

    @Override
    public void addFacility(Facility newfacility) {
        repoFacility.addFacility(newfacility);
    }

    @Override
    public Facility selectFacility(int id) {
        return repoFacility.selectFacility(id);
    }

    @Override
    public boolean edit(Facility newfacility) {
        return repoFacility.editFacility(newfacility);
    }

    @Override
    public List<Facility> find(String search, int type) {
        return repoFacility.find(search,type);
    }


}
