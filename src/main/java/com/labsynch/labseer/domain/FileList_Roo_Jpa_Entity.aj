// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.FileList;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect FileList_Roo_Jpa_Entity {
    
    declare @type: FileList: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long FileList.id;
    
    @Version
    @Column(name = "version")
    private Integer FileList.version;
    
    public Long FileList.getId() {
        return this.id;
    }
    
    public void FileList.setId(Long id) {
        this.id = id;
    }
    
    public Integer FileList.getVersion() {
        return this.version;
    }
    
    public void FileList.setVersion(Integer version) {
        this.version = version;
    }
    
}
