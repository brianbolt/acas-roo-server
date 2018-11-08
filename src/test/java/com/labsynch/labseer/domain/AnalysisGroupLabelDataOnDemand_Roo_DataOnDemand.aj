// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupDataOnDemand;
import com.labsynch.labseer.domain.AnalysisGroupLabel;
import com.labsynch.labseer.domain.AnalysisGroupLabelDataOnDemand;
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

privileged aspect AnalysisGroupLabelDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AnalysisGroupLabelDataOnDemand: @Component;
    
    private Random AnalysisGroupLabelDataOnDemand.rnd = new SecureRandom();
    
    private List<AnalysisGroupLabel> AnalysisGroupLabelDataOnDemand.data;
    
    @Autowired
    AnalysisGroupDataOnDemand AnalysisGroupLabelDataOnDemand.analysisGroupDataOnDemand;
    
    public AnalysisGroupLabel AnalysisGroupLabelDataOnDemand.getNewTransientAnalysisGroupLabel(int index) {
        AnalysisGroupLabel obj = new AnalysisGroupLabel();
        setAnalysisGroup(obj, index);
        setDeleted(obj, index);
        setIgnored(obj, index);
        setImageFile(obj, index);
        setLabelText(obj, index);
        setLsKind(obj, index);
        setLsTransaction(obj, index);
        setLsType(obj, index);
        setLsTypeAndKind(obj, index);
        setModifiedDate(obj, index);
        setPhysicallyLabled(obj, index);
        setPreferred(obj, index);
        setRecordedBy(obj, index);
        setRecordedDate(obj, index);
        return obj;
    }
    
    public void AnalysisGroupLabelDataOnDemand.setAnalysisGroup(AnalysisGroupLabel obj, int index) {
        AnalysisGroup analysisGroup = analysisGroupDataOnDemand.getRandomAnalysisGroup();
        obj.setAnalysisGroup(analysisGroup);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setDeleted(AnalysisGroupLabel obj, int index) {
        Boolean deleted = true;
        obj.setDeleted(deleted);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setIgnored(AnalysisGroupLabel obj, int index) {
        Boolean ignored = true;
        obj.setIgnored(ignored);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setImageFile(AnalysisGroupLabel obj, int index) {
        String imageFile = "imageFile_" + index;
        if (imageFile.length() > 255) {
            imageFile = imageFile.substring(0, 255);
        }
        obj.setImageFile(imageFile);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setLabelText(AnalysisGroupLabel obj, int index) {
        String labelText = "labelText_" + index;
        if (labelText.length() > 255) {
            labelText = labelText.substring(0, 255);
        }
        obj.setLabelText(labelText);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setLsKind(AnalysisGroupLabel obj, int index) {
        String lsKind = "lsKind_" + index;
        if (lsKind.length() > 255) {
            lsKind = lsKind.substring(0, 255);
        }
        obj.setLsKind(lsKind);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setLsTransaction(AnalysisGroupLabel obj, int index) {
        Long lsTransaction = new Integer(index).longValue();
        obj.setLsTransaction(lsTransaction);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setLsType(AnalysisGroupLabel obj, int index) {
        String lsType = "lsType_" + index;
        if (lsType.length() > 64) {
            lsType = lsType.substring(0, 64);
        }
        obj.setLsType(lsType);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setLsTypeAndKind(AnalysisGroupLabel obj, int index) {
        String lsTypeAndKind = "lsTypeAndKind_" + index;
        if (lsTypeAndKind.length() > 255) {
            lsTypeAndKind = lsTypeAndKind.substring(0, 255);
        }
        obj.setLsTypeAndKind(lsTypeAndKind);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setModifiedDate(AnalysisGroupLabel obj, int index) {
        Date modifiedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setModifiedDate(modifiedDate);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setPhysicallyLabled(AnalysisGroupLabel obj, int index) {
        Boolean physicallyLabled = true;
        obj.setPhysicallyLabled(physicallyLabled);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setPreferred(AnalysisGroupLabel obj, int index) {
        Boolean preferred = true;
        obj.setPreferred(preferred);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setRecordedBy(AnalysisGroupLabel obj, int index) {
        String recordedBy = "recordedBy_" + index;
        if (recordedBy.length() > 255) {
            recordedBy = recordedBy.substring(0, 255);
        }
        obj.setRecordedBy(recordedBy);
    }
    
    public void AnalysisGroupLabelDataOnDemand.setRecordedDate(AnalysisGroupLabel obj, int index) {
        Date recordedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRecordedDate(recordedDate);
    }
    
    public AnalysisGroupLabel AnalysisGroupLabelDataOnDemand.getSpecificAnalysisGroupLabel(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AnalysisGroupLabel obj = data.get(index);
        Long id = obj.getId();
        return AnalysisGroupLabel.findAnalysisGroupLabel(id);
    }
    
    public AnalysisGroupLabel AnalysisGroupLabelDataOnDemand.getRandomAnalysisGroupLabel() {
        init();
        AnalysisGroupLabel obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return AnalysisGroupLabel.findAnalysisGroupLabel(id);
    }
    
    public boolean AnalysisGroupLabelDataOnDemand.modifyAnalysisGroupLabel(AnalysisGroupLabel obj) {
        return false;
    }
    
    public void AnalysisGroupLabelDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AnalysisGroupLabel.findAnalysisGroupLabelEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AnalysisGroupLabel' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AnalysisGroupLabel>();
        for (int i = 0; i < 10; i++) {
            AnalysisGroupLabel obj = getNewTransientAnalysisGroupLabel(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
