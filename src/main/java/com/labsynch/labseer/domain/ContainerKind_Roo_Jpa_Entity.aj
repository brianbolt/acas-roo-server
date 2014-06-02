// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ContainerKind;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect ContainerKind_Roo_Jpa_Entity {
    
    declare @type: ContainerKind: @Entity;
    
    @Id
    @SequenceGenerator(name = "containerKindGen", sequenceName = "CONTAINER_KIND_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "containerKindGen")
    @Column(name = "id")
    private Long ContainerKind.id;
    
    @Version
    @Column(name = "version")
    private Integer ContainerKind.version;
    
    public Long ContainerKind.getId() {
        return this.id;
    }
    
    public void ContainerKind.setId(Long id) {
        this.id = id;
    }
    
    public Integer ContainerKind.getVersion() {
        return this.version;
    }
    
    public void ContainerKind.setVersion(Integer version) {
        this.version = version;
    }
    
}
