// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CodeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect CodeType_Roo_Jpa_Entity {
    
    declare @type: CodeType: @Entity;
    
    @Id
    @SequenceGenerator(name = "codeTypeGen", sequenceName = "CODE_TYPE_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "codeTypeGen")
    @Column(name = "id")
    private Long CodeType.id;
    
    @Version
    @Column(name = "version")
    private Integer CodeType.version;
    
    public Long CodeType.getId() {
        return this.id;
    }
    
    public void CodeType.setId(Long id) {
        this.id = id;
    }
    
    public Integer CodeType.getVersion() {
        return this.version;
    }
    
    public void CodeType.setVersion(Integer version) {
        this.version = version;
    }
    
}
