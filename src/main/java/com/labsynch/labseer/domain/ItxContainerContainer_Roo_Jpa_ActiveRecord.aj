// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxContainerContainer;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ItxContainerContainer_Roo_Jpa_ActiveRecord {
    
    public static long ItxContainerContainer.countItxContainerContainers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ItxContainerContainer o", Long.class).getSingleResult();
    }
    
    public static List<ItxContainerContainer> ItxContainerContainer.findAllItxContainerContainers() {
        return entityManager().createQuery("SELECT o FROM ItxContainerContainer o", ItxContainerContainer.class).getResultList();
    }
    
    public static ItxContainerContainer ItxContainerContainer.findItxContainerContainer(Long id) {
        if (id == null) return null;
        return entityManager().find(ItxContainerContainer.class, id);
    }
    
    public static List<ItxContainerContainer> ItxContainerContainer.findItxContainerContainerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ItxContainerContainer o", ItxContainerContainer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ItxContainerContainer ItxContainerContainer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ItxContainerContainer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
