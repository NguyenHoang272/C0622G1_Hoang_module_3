package service.impl;

import model.Contract;
import repository.IRepoContract;
import repository.impl.RepoContract;
import service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IRepoContract repoContract = new RepoContract();
    @Override
    public List<Contract> getListContract() {
        return repoContract.getListContract();
    }
}
