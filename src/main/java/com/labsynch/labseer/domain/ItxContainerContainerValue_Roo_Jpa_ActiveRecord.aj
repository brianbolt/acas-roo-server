// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxContainerContainerValue;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ItxContainerContainerValue_Roo_Jpa_ActiveRecord {
    
    public static long ItxContainerContainerValue.countItxContainerContainerValues() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ItxContainerContainerValue o", Long.class).getSingleResult();
    }
    
    public static List<ItxContainerContainerValue> ItxContainerContainerValue.findAllItxContainerContainerValues() {
        return entityManager().createQuery("SELECT o FROM ItxContainerContainerValue o", ItxContainerContainerValue.class).getResultList();
    }
    
    public static ItxContainerContainerValue ItxContainerContainerValue.findItxContainerContainerValue(Long id) {
        if (id == null) return null;
        return entityManager().find(ItxContainerContainerValue.class, id);
    }
    
    public static List<ItxContainerContainerValue> ItxContainerContainerValue.findItxContainerContainerValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ItxContainerContainerValue o", ItxContainerContainerValue.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ItxContainerContainerValue ItxContainerContainerValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ItxContainerContainerValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
