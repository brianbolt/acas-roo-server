// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LabelType;
import com.labsynch.labseer.domain.LabelTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect LabelTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LabelTypeDataOnDemand: @Component;
    
    private Random LabelTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<LabelType> LabelTypeDataOnDemand.data;
    
    public LabelType LabelTypeDataOnDemand.getNewTransientLabelType(int index) {
        LabelType obj = new LabelType();
        setTypeName(obj, index);
        return obj;
    }
    
    public void LabelTypeDataOnDemand.setTypeName(LabelType obj, int index) {
        String typeName = "typeName_" + index;
        if (typeName.length() > 255) {
            typeName = new Random().nextInt(10) + typeName.substring(1, 255);
        }
        obj.setTypeName(typeName);
    }
    
    public LabelType LabelTypeDataOnDemand.getSpecificLabelType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LabelType obj = data.get(index);
        Long id = obj.getId();
        return LabelType.findLabelType(id);
    }
    
    public LabelType LabelTypeDataOnDemand.getRandomLabelType() {
        init();
        LabelType obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return LabelType.findLabelType(id);
    }
    
    public boolean LabelTypeDataOnDemand.modifyLabelType(LabelType obj) {
        return false;
    }
    
    public void LabelTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LabelType.findLabelTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LabelType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LabelType>();
        for (int i = 0; i < 10; i++) {
            LabelType obj = getNewTransientLabelType(i);
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
