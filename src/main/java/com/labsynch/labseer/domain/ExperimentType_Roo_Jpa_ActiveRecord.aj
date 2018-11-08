// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ExperimentType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExperimentType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ExperimentType.entityManager;
    
    public static final List<String> ExperimentType.fieldNames4OrderClauseFilter = java.util.Arrays.asList("typeName");
    
    public static final EntityManager ExperimentType.entityManager() {
        EntityManager em = new ExperimentType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ExperimentType.countExperimentTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ExperimentType o", Long.class).getSingleResult();
    }
    
    public static List<ExperimentType> ExperimentType.findAllExperimentTypes() {
        return entityManager().createQuery("SELECT o FROM ExperimentType o", ExperimentType.class).getResultList();
    }
    
    public static List<ExperimentType> ExperimentType.findAllExperimentTypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExperimentType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExperimentType.class).getResultList();
    }
    
    public static ExperimentType ExperimentType.findExperimentType(Long id) {
        if (id == null) return null;
        return entityManager().find(ExperimentType.class, id);
    }
    
    public static List<ExperimentType> ExperimentType.findExperimentTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ExperimentType o", ExperimentType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ExperimentType> ExperimentType.findExperimentTypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExperimentType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExperimentType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ExperimentType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ExperimentType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ExperimentType attached = ExperimentType.findExperimentType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ExperimentType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ExperimentType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ExperimentType ExperimentType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ExperimentType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
