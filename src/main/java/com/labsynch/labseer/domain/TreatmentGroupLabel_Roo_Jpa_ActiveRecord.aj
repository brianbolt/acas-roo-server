// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.TreatmentGroupLabel;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TreatmentGroupLabel_Roo_Jpa_ActiveRecord {
    
    public static final List<String> TreatmentGroupLabel.fieldNames4OrderClauseFilter = java.util.Arrays.asList("treatmentGroup");
    
    public static long TreatmentGroupLabel.countTreatmentGroupLabels() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TreatmentGroupLabel o", Long.class).getSingleResult();
    }
    
    public static List<TreatmentGroupLabel> TreatmentGroupLabel.findAllTreatmentGroupLabels() {
        return entityManager().createQuery("SELECT o FROM TreatmentGroupLabel o", TreatmentGroupLabel.class).getResultList();
    }
    
    public static List<TreatmentGroupLabel> TreatmentGroupLabel.findAllTreatmentGroupLabels(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM TreatmentGroupLabel o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, TreatmentGroupLabel.class).getResultList();
    }
    
    public static TreatmentGroupLabel TreatmentGroupLabel.findTreatmentGroupLabel(Long id) {
        if (id == null) return null;
        return entityManager().find(TreatmentGroupLabel.class, id);
    }
    
    public static List<TreatmentGroupLabel> TreatmentGroupLabel.findTreatmentGroupLabelEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TreatmentGroupLabel o", TreatmentGroupLabel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<TreatmentGroupLabel> TreatmentGroupLabel.findTreatmentGroupLabelEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM TreatmentGroupLabel o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, TreatmentGroupLabel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public TreatmentGroupLabel TreatmentGroupLabel.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TreatmentGroupLabel merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
