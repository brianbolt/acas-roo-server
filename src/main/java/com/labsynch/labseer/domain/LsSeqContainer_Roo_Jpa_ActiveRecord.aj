// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsSeqContainer;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LsSeqContainer_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager LsSeqContainer.entityManager;
    
    public static final List<String> LsSeqContainer.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager LsSeqContainer.entityManager() {
        EntityManager em = new LsSeqContainer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long LsSeqContainer.countLsSeqContainers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LsSeqContainer o", Long.class).getSingleResult();
    }
    
    public static List<LsSeqContainer> LsSeqContainer.findAllLsSeqContainers() {
        return entityManager().createQuery("SELECT o FROM LsSeqContainer o", LsSeqContainer.class).getResultList();
    }
    
    public static List<LsSeqContainer> LsSeqContainer.findAllLsSeqContainers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LsSeqContainer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LsSeqContainer.class).getResultList();
    }
    
    public static LsSeqContainer LsSeqContainer.findLsSeqContainer(Long id) {
        if (id == null) return null;
        return entityManager().find(LsSeqContainer.class, id);
    }
    
    public static List<LsSeqContainer> LsSeqContainer.findLsSeqContainerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LsSeqContainer o", LsSeqContainer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<LsSeqContainer> LsSeqContainer.findLsSeqContainerEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LsSeqContainer o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LsSeqContainer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void LsSeqContainer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void LsSeqContainer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            LsSeqContainer attached = LsSeqContainer.findLsSeqContainer(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void LsSeqContainer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void LsSeqContainer.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public LsSeqContainer LsSeqContainer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LsSeqContainer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
