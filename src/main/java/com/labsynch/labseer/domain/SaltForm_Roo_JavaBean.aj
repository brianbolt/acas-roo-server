// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.BulkLoadFile;
import com.labsynch.labseer.domain.IsoSalt;
import com.labsynch.labseer.domain.Lot;
import com.labsynch.labseer.domain.Parent;
import com.labsynch.labseer.domain.SaltForm;
import java.util.Date;
import java.util.Set;

privileged aspect SaltForm_Roo_JavaBean {
    
    public String SaltForm.getMolStructure() {
        return this.molStructure;
    }
    
    public void SaltForm.setMolStructure(String molStructure) {
        this.molStructure = molStructure;
    }
    
    public String SaltForm.getCorpName() {
        return this.corpName;
    }
    
    public void SaltForm.setCorpName(String corpName) {
        this.corpName = corpName;
    }
    
    public String SaltForm.getCasNumber() {
        return this.casNumber;
    }
    
    public void SaltForm.setCasNumber(String casNumber) {
        this.casNumber = casNumber;
    }
    
    public String SaltForm.getChemist() {
        return this.chemist;
    }
    
    public void SaltForm.setChemist(String chemist) {
        this.chemist = chemist;
    }
    
    public Date SaltForm.getRegistrationDate() {
        return this.registrationDate;
    }
    
    public void SaltForm.setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }
    
    public int SaltForm.getCdId() {
        return this.CdId;
    }
    
    public void SaltForm.setCdId(int CdId) {
        this.CdId = CdId;
    }
    
    public Boolean SaltForm.getIgnore() {
        return this.ignore;
    }
    
    public void SaltForm.setIgnore(Boolean ignore) {
        this.ignore = ignore;
    }
    
    public Double SaltForm.getSaltWeight() {
        return this.saltWeight;
    }
    
    public void SaltForm.setSaltWeight(Double saltWeight) {
        this.saltWeight = saltWeight;
    }
    
    public Parent SaltForm.getParent() {
        return this.parent;
    }
    
    public void SaltForm.setParent(Parent parent) {
        this.parent = parent;
    }
    
    public Set<Lot> SaltForm.getLots() {
        return this.lots;
    }
    
    public void SaltForm.setLots(Set<Lot> lots) {
        this.lots = lots;
    }
    
    public Set<IsoSalt> SaltForm.getIsoSalts() {
        return this.isoSalts;
    }
    
    public void SaltForm.setIsoSalts(Set<IsoSalt> isoSalts) {
        this.isoSalts = isoSalts;
    }
    
    public BulkLoadFile SaltForm.getBulkLoadFile() {
        return this.bulkLoadFile;
    }
    
    public void SaltForm.setBulkLoadFile(BulkLoadFile bulkLoadFile) {
        this.bulkLoadFile = bulkLoadFile;
    }
    
}
