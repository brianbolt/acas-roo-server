// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.InteractionType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect InteractionType_Roo_Jpa_Entity {
    
    declare @type: InteractionType: @Entity;
    
    @Id
    @SequenceGenerator(name = "interactionTypeGen", sequenceName = "INTERACTION_TYPE_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "interactionTypeGen")
    @Column(name = "id")
    private Long InteractionType.id;
    
    @Version
    @Column(name = "version")
    private Integer InteractionType.version;
    
    public Long InteractionType.getId() {
        return this.id;
    }
    
    public void InteractionType.setId(Long id) {
        this.id = id;
    }
    
    public Integer InteractionType.getVersion() {
        return this.version;
    }
    
    public void InteractionType.setVersion(Integer version) {
        this.version = version;
    }
    
}
