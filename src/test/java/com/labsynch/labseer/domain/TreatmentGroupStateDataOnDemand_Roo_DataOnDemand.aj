// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.domain.TreatmentGroupDataOnDemand;
import com.labsynch.labseer.domain.TreatmentGroupState;
import com.labsynch.labseer.domain.TreatmentGroupStateDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TreatmentGroupStateDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TreatmentGroupStateDataOnDemand: @Component;
    
    private Random TreatmentGroupStateDataOnDemand.rnd = new SecureRandom();
    
    private List<TreatmentGroupState> TreatmentGroupStateDataOnDemand.data;
    
    @Autowired
    TreatmentGroupDataOnDemand TreatmentGroupStateDataOnDemand.treatmentGroupDataOnDemand;
    
    public TreatmentGroupState TreatmentGroupStateDataOnDemand.getNewTransientTreatmentGroupState(int index) {
        TreatmentGroupState obj = new TreatmentGroupState();
        setComments(obj, index);
        setIgnored(obj, index);
        setLsKind(obj, index);
        setLsTransaction(obj, index);
        setLsType(obj, index);
        setLsTypeAndKind(obj, index);
        setModifiedBy(obj, index);
        setModifiedDate(obj, index);
        setRecordedBy(obj, index);
        setRecordedDate(obj, index);
        setTreatmentGroup(obj, index);
        return obj;
    }
    
    public void TreatmentGroupStateDataOnDemand.setComments(TreatmentGroupState obj, int index) {
        String comments = "comments_" + index;
        if (comments.length() > 512) {
            comments = comments.substring(0, 512);
        }
        obj.setComments(comments);
    }
    
    public void TreatmentGroupStateDataOnDemand.setIgnored(TreatmentGroupState obj, int index) {
        Boolean ignored = true;
        obj.setIgnored(ignored);
    }
    
    public void TreatmentGroupStateDataOnDemand.setLsKind(TreatmentGroupState obj, int index) {
        String lsKind = "lsKind_" + index;
        if (lsKind.length() > 255) {
            lsKind = lsKind.substring(0, 255);
        }
        obj.setLsKind(lsKind);
    }
    
    public void TreatmentGroupStateDataOnDemand.setLsTransaction(TreatmentGroupState obj, int index) {
        Long lsTransaction = new Integer(index).longValue();
        obj.setLsTransaction(lsTransaction);
    }
    
    public void TreatmentGroupStateDataOnDemand.setLsType(TreatmentGroupState obj, int index) {
        String lsType = "lsType_" + index;
        if (lsType.length() > 64) {
            lsType = lsType.substring(0, 64);
        }
        obj.setLsType(lsType);
    }
    
    public void TreatmentGroupStateDataOnDemand.setLsTypeAndKind(TreatmentGroupState obj, int index) {
        String lsTypeAndKind = "lsTypeAndKind_" + index;
        if (lsTypeAndKind.length() > 255) {
            lsTypeAndKind = lsTypeAndKind.substring(0, 255);
        }
        obj.setLsTypeAndKind(lsTypeAndKind);
    }
    
    public void TreatmentGroupStateDataOnDemand.setModifiedBy(TreatmentGroupState obj, int index) {
        String modifiedBy = "modifiedBy_" + index;
        if (modifiedBy.length() > 255) {
            modifiedBy = modifiedBy.substring(0, 255);
        }
        obj.setModifiedBy(modifiedBy);
    }
    
    public void TreatmentGroupStateDataOnDemand.setModifiedDate(TreatmentGroupState obj, int index) {
        Date modifiedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setModifiedDate(modifiedDate);
    }
    
    public void TreatmentGroupStateDataOnDemand.setRecordedBy(TreatmentGroupState obj, int index) {
        String recordedBy = "recordedBy_" + index;
        if (recordedBy.length() > 255) {
            recordedBy = recordedBy.substring(0, 255);
        }
        obj.setRecordedBy(recordedBy);
    }
    
    public void TreatmentGroupStateDataOnDemand.setRecordedDate(TreatmentGroupState obj, int index) {
        Date recordedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRecordedDate(recordedDate);
    }
    
    public void TreatmentGroupStateDataOnDemand.setTreatmentGroup(TreatmentGroupState obj, int index) {
        TreatmentGroup treatmentGroup = treatmentGroupDataOnDemand.getRandomTreatmentGroup();
        obj.setTreatmentGroup(treatmentGroup);
    }
    
    public TreatmentGroupState TreatmentGroupStateDataOnDemand.getSpecificTreatmentGroupState(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TreatmentGroupState obj = data.get(index);
        Long id = obj.getId();
        return TreatmentGroupState.findTreatmentGroupState(id);
    }
    
    public TreatmentGroupState TreatmentGroupStateDataOnDemand.getRandomTreatmentGroupState() {
        init();
        TreatmentGroupState obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return TreatmentGroupState.findTreatmentGroupState(id);
    }
    
    public boolean TreatmentGroupStateDataOnDemand.modifyTreatmentGroupState(TreatmentGroupState obj) {
        return false;
    }
    
    public void TreatmentGroupStateDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TreatmentGroupState.findTreatmentGroupStateEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TreatmentGroupState' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TreatmentGroupState>();
        for (int i = 0; i < 10; i++) {
            TreatmentGroupState obj = getNewTransientTreatmentGroupState(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
