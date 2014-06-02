// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ContainerState;
import com.labsynch.labseer.domain.ContainerStateDataOnDemand;
import com.labsynch.labseer.domain.ContainerValue;
import com.labsynch.labseer.domain.ContainerValueDataOnDemand;
import java.math.BigDecimal;
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

privileged aspect ContainerValueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContainerValueDataOnDemand: @Component;
    
    private Random ContainerValueDataOnDemand.rnd = new SecureRandom();
    
    private List<ContainerValue> ContainerValueDataOnDemand.data;
    
    @Autowired
    ContainerStateDataOnDemand ContainerValueDataOnDemand.containerStateDataOnDemand;
    
    public ContainerValue ContainerValueDataOnDemand.getNewTransientContainerValue(int index) {
        ContainerValue obj = new ContainerValue();
        setBlobValue(obj, index);
        setClobValue(obj, index);
        setCodeKind(obj, index);
        setCodeType(obj, index);
        setCodeTypeAndKind(obj, index);
        setCodeValue(obj, index);
        setComments(obj, index);
        setDateValue(obj, index);
        setFileValue(obj, index);
        setIgnored(obj, index);
        setLsKind(obj, index);
        setLsState(obj, index);
        setLsTransaction(obj, index);
        setLsType(obj, index);
        setLsTypeAndKind(obj, index);
        setModifiedBy(obj, index);
        setModifiedDate(obj, index);
        setNumberOfReplicates(obj, index);
        setNumericValue(obj, index);
        setOperatorKind(obj, index);
        setOperatorType(obj, index);
        setOperatorTypeAndKind(obj, index);
        setPublicData(obj, index);
        setRecordedBy(obj, index);
        setRecordedDate(obj, index);
        setSigFigs(obj, index);
        setStringValue(obj, index);
        setUncertainty(obj, index);
        setUncertaintyType(obj, index);
        setUnitKind(obj, index);
        setUnitType(obj, index);
        setUnitTypeAndKind(obj, index);
        setUrlValue(obj, index);
        return obj;
    }
    
    public void ContainerValueDataOnDemand.setBlobValue(ContainerValue obj, int index) {
        byte[] blobValue = String.valueOf(index).getBytes();
        obj.setBlobValue(blobValue);
    }
    
    public void ContainerValueDataOnDemand.setClobValue(ContainerValue obj, int index) {
        String clobValue = "clobValue_" + index;
        obj.setClobValue(clobValue);
    }
    
    public void ContainerValueDataOnDemand.setCodeKind(ContainerValue obj, int index) {
        String codeKind = "codeKind_" + index;
        if (codeKind.length() > 255) {
            codeKind = codeKind.substring(0, 255);
        }
        obj.setCodeKind(codeKind);
    }
    
    public void ContainerValueDataOnDemand.setCodeType(ContainerValue obj, int index) {
        String codeType = "codeType_" + index;
        if (codeType.length() > 64) {
            codeType = codeType.substring(0, 64);
        }
        obj.setCodeType(codeType);
    }
    
    public void ContainerValueDataOnDemand.setCodeTypeAndKind(ContainerValue obj, int index) {
        String codeTypeAndKind = "codeTypeAndKind_" + index;
        if (codeTypeAndKind.length() > 350) {
            codeTypeAndKind = codeTypeAndKind.substring(0, 350);
        }
        obj.setCodeTypeAndKind(codeTypeAndKind);
    }
    
    public void ContainerValueDataOnDemand.setCodeValue(ContainerValue obj, int index) {
        String codeValue = "codeValue_" + index;
        if (codeValue.length() > 255) {
            codeValue = codeValue.substring(0, 255);
        }
        obj.setCodeValue(codeValue);
    }
    
    public void ContainerValueDataOnDemand.setComments(ContainerValue obj, int index) {
        String comments = "comments_" + index;
        if (comments.length() > 512) {
            comments = comments.substring(0, 512);
        }
        obj.setComments(comments);
    }
    
    public void ContainerValueDataOnDemand.setDateValue(ContainerValue obj, int index) {
        Date dateValue = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateValue(dateValue);
    }
    
    public void ContainerValueDataOnDemand.setFileValue(ContainerValue obj, int index) {
        String fileValue = "fileValue_" + index;
        if (fileValue.length() > 512) {
            fileValue = fileValue.substring(0, 512);
        }
        obj.setFileValue(fileValue);
    }
    
    public void ContainerValueDataOnDemand.setIgnored(ContainerValue obj, int index) {
        Boolean ignored = true;
        obj.setIgnored(ignored);
    }
    
    public void ContainerValueDataOnDemand.setLsKind(ContainerValue obj, int index) {
        String lsKind = "lsKind_" + index;
        if (lsKind.length() > 255) {
            lsKind = lsKind.substring(0, 255);
        }
        obj.setLsKind(lsKind);
    }
    
    public void ContainerValueDataOnDemand.setLsState(ContainerValue obj, int index) {
        ContainerState lsState = containerStateDataOnDemand.getRandomContainerState();
        obj.setLsState(lsState);
    }
    
    public void ContainerValueDataOnDemand.setLsTransaction(ContainerValue obj, int index) {
        Long lsTransaction = new Integer(index).longValue();
        obj.setLsTransaction(lsTransaction);
    }
    
    public void ContainerValueDataOnDemand.setLsType(ContainerValue obj, int index) {
        String lsType = "lsType_" + index;
        if (lsType.length() > 64) {
            lsType = lsType.substring(0, 64);
        }
        obj.setLsType(lsType);
    }
    
    public void ContainerValueDataOnDemand.setLsTypeAndKind(ContainerValue obj, int index) {
        String lsTypeAndKind = "lsTypeAndKind_" + index;
        if (lsTypeAndKind.length() > 350) {
            lsTypeAndKind = lsTypeAndKind.substring(0, 350);
        }
        obj.setLsTypeAndKind(lsTypeAndKind);
    }
    
    public void ContainerValueDataOnDemand.setModifiedBy(ContainerValue obj, int index) {
        String modifiedBy = "modifiedBy_" + index;
        if (modifiedBy.length() > 255) {
            modifiedBy = modifiedBy.substring(0, 255);
        }
        obj.setModifiedBy(modifiedBy);
    }
    
    public void ContainerValueDataOnDemand.setModifiedDate(ContainerValue obj, int index) {
        Date modifiedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setModifiedDate(modifiedDate);
    }
    
    public void ContainerValueDataOnDemand.setNumberOfReplicates(ContainerValue obj, int index) {
        Integer numberOfReplicates = new Integer(index);
        obj.setNumberOfReplicates(numberOfReplicates);
    }
    
    public void ContainerValueDataOnDemand.setNumericValue(ContainerValue obj, int index) {
        BigDecimal numericValue = BigDecimal.valueOf(index);
        obj.setNumericValue(numericValue);
    }
    
    public void ContainerValueDataOnDemand.setOperatorKind(ContainerValue obj, int index) {
        String operatorKind = "operator_" + index;
        if (operatorKind.length() > 10) {
            operatorKind = operatorKind.substring(0, 10);
        }
        obj.setOperatorKind(operatorKind);
    }
    
    public void ContainerValueDataOnDemand.setOperatorType(ContainerValue obj, int index) {
        String operatorType = "operatorType_" + index;
        if (operatorType.length() > 25) {
            operatorType = operatorType.substring(0, 25);
        }
        obj.setOperatorType(operatorType);
    }
    
    public void ContainerValueDataOnDemand.setOperatorTypeAndKind(ContainerValue obj, int index) {
        String operatorTypeAndKind = "operatorTypeAndKind_" + index;
        if (operatorTypeAndKind.length() > 50) {
            operatorTypeAndKind = operatorTypeAndKind.substring(0, 50);
        }
        obj.setOperatorTypeAndKind(operatorTypeAndKind);
    }
    
    public void ContainerValueDataOnDemand.setPublicData(ContainerValue obj, int index) {
        Boolean publicData = true;
        obj.setPublicData(publicData);
    }
    
    public void ContainerValueDataOnDemand.setRecordedBy(ContainerValue obj, int index) {
        String recordedBy = "recordedBy_" + index;
        if (recordedBy.length() > 255) {
            recordedBy = recordedBy.substring(0, 255);
        }
        obj.setRecordedBy(recordedBy);
    }
    
    public void ContainerValueDataOnDemand.setRecordedDate(ContainerValue obj, int index) {
        Date recordedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRecordedDate(recordedDate);
    }
    
    public void ContainerValueDataOnDemand.setSigFigs(ContainerValue obj, int index) {
        Integer sigFigs = new Integer(index);
        obj.setSigFigs(sigFigs);
    }
    
    public void ContainerValueDataOnDemand.setStringValue(ContainerValue obj, int index) {
        String stringValue = "stringValue_" + index;
        if (stringValue.length() > 255) {
            stringValue = stringValue.substring(0, 255);
        }
        obj.setStringValue(stringValue);
    }
    
    public void ContainerValueDataOnDemand.setUncertainty(ContainerValue obj, int index) {
        BigDecimal uncertainty = BigDecimal.valueOf(index);
        obj.setUncertainty(uncertainty);
    }
    
    public void ContainerValueDataOnDemand.setUncertaintyType(ContainerValue obj, int index) {
        String uncertaintyType = "uncertaintyType_" + index;
        if (uncertaintyType.length() > 255) {
            uncertaintyType = uncertaintyType.substring(0, 255);
        }
        obj.setUncertaintyType(uncertaintyType);
    }
    
    public void ContainerValueDataOnDemand.setUnitKind(ContainerValue obj, int index) {
        String unitKind = "unitKind_" + index;
        if (unitKind.length() > 25) {
            unitKind = unitKind.substring(0, 25);
        }
        obj.setUnitKind(unitKind);
    }
    
    public void ContainerValueDataOnDemand.setUnitType(ContainerValue obj, int index) {
        String unitType = "unitType_" + index;
        if (unitType.length() > 25) {
            unitType = unitType.substring(0, 25);
        }
        obj.setUnitType(unitType);
    }
    
    public void ContainerValueDataOnDemand.setUnitTypeAndKind(ContainerValue obj, int index) {
        String unitTypeAndKind = "unitTypeAndKind_" + index;
        if (unitTypeAndKind.length() > 55) {
            unitTypeAndKind = unitTypeAndKind.substring(0, 55);
        }
        obj.setUnitTypeAndKind(unitTypeAndKind);
    }
    
    public void ContainerValueDataOnDemand.setUrlValue(ContainerValue obj, int index) {
        String urlValue = "urlValue_" + index;
        if (urlValue.length() > 2000) {
            urlValue = urlValue.substring(0, 2000);
        }
        obj.setUrlValue(urlValue);
    }
    
    public ContainerValue ContainerValueDataOnDemand.getSpecificContainerValue(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ContainerValue obj = data.get(index);
        Long id = obj.getId();
        return ContainerValue.findContainerValue(id);
    }
    
    public ContainerValue ContainerValueDataOnDemand.getRandomContainerValue() {
        init();
        ContainerValue obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ContainerValue.findContainerValue(id);
    }
    
    public boolean ContainerValueDataOnDemand.modifyContainerValue(ContainerValue obj) {
        return false;
    }
    
    public void ContainerValueDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ContainerValue.findContainerValueEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ContainerValue' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ContainerValue>();
        for (int i = 0; i < 10; i++) {
            ContainerValue obj = getNewTransientContainerValue(i);
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
