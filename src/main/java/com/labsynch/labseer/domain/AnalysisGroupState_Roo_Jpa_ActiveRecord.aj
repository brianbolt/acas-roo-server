// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AnalysisGroupState;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AnalysisGroupState_Roo_Jpa_ActiveRecord {
    
    public static long AnalysisGroupState.countAnalysisGroupStates() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AnalysisGroupState o", Long.class).getSingleResult();
    }
    
    public static List<AnalysisGroupState> AnalysisGroupState.findAllAnalysisGroupStates() {
        return entityManager().createQuery("SELECT o FROM AnalysisGroupState o", AnalysisGroupState.class).getResultList();
    }
    
    public static AnalysisGroupState AnalysisGroupState.findAnalysisGroupState(Long id) {
        if (id == null) return null;
        return entityManager().find(AnalysisGroupState.class, id);
    }
    
    public static List<AnalysisGroupState> AnalysisGroupState.findAnalysisGroupStateEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AnalysisGroupState o", AnalysisGroupState.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public AnalysisGroupState AnalysisGroupState.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AnalysisGroupState merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
