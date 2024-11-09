package com.vulenguyen.financetracker.finance.controllerImplementation;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PutMapping;
// import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// import com.vulenguyen.financetracker.finance.dto.AccountRequestDto;
// import com.vulenguyen.financetracker.finance.exception.TrackerException;
import com.vulenguyen.financetracker.finance.service.TrackerService;

@RestController
@RequestMapping("/api/trackers")
public class TrackerController {

    private final TrackerService trackerService;

    @Autowired
    public TrackerController(TrackerService trackerService) {
        this.trackerService = trackerService;
    }

    @GetMapping
    public String getTrackerAccounts(int taId) {
        return trackerService.getTrackerAccount(taId);
    }
}
