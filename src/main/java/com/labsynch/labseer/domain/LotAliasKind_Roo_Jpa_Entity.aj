// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LotAliasKind;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect LotAliasKind_Roo_Jpa_Entity {
    
    declare @type: LotAliasKind: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long LotAliasKind.id;
    
    @Version
    @Column(name = "version")
    private Integer LotAliasKind.version;
    
    public Long LotAliasKind.getId() {
        return this.id;
    }
    
    public void LotAliasKind.setId(Long id) {
        this.id = id;
    }
    
    public Integer LotAliasKind.getVersion() {
        return this.version;
    }
    
    public void LotAliasKind.setVersion(Integer version) {
        this.version = version;
    }
    
}
