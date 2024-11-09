package com.vulenguyen.financetracker.finance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vulenguyen.financetracker.finance.dao.TrackerDao;
// import com.vulenguyen.financetracker.finance.dto.AccountRequestDto;
// import com.vulenguyen.financetracker.finance.entity.TrackerAccount;
// import com.vulenguyen.financetracker.finance.exception.TrackerException;

@Service
public class TrackerService {

    private final TrackerDao trackerDao;

    @Autowired
    public TrackerService(TrackerDao trackerDao) {
        this.trackerDao = trackerDao;
    }

    // get the tracker information
    public String getTrackerAccount(int taId) {
        return trackerDao.findTrackerAccountById(taId);
    }

}
