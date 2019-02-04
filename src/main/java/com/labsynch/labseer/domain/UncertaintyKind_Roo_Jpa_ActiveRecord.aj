// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.UncertaintyKind;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UncertaintyKind_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager UncertaintyKind.entityManager;
    
    public static final List<String> UncertaintyKind.fieldNames4OrderClauseFilter = java.util.Arrays.asList("kindName");
    
    public static final EntityManager UncertaintyKind.entityManager() {
        EntityManager em = new UncertaintyKind().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UncertaintyKind.countUncertaintyKinds() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UncertaintyKind o", Long.class).getSingleResult();
    }
    
    public static List<UncertaintyKind> UncertaintyKind.findAllUncertaintyKinds() {
        return entityManager().createQuery("SELECT o FROM UncertaintyKind o", UncertaintyKind.class).getResultList();
    }
    
    public static List<UncertaintyKind> UncertaintyKind.findAllUncertaintyKinds(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM UncertaintyKind o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, UncertaintyKind.class).getResultList();
    }
    
    public static UncertaintyKind UncertaintyKind.findUncertaintyKind(Long id) {
        if (id == null) return null;
        return entityManager().find(UncertaintyKind.class, id);
    }
    
    public static List<UncertaintyKind> UncertaintyKind.findUncertaintyKindEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UncertaintyKind o", UncertaintyKind.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<UncertaintyKind> UncertaintyKind.findUncertaintyKindEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM UncertaintyKind o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, UncertaintyKind.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void UncertaintyKind.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UncertaintyKind.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UncertaintyKind attached = UncertaintyKind.findUncertaintyKind(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UncertaintyKind.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UncertaintyKind.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public UncertaintyKind UncertaintyKind.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UncertaintyKind merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
