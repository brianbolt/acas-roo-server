// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.RoleType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RoleType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager RoleType.entityManager;
    
    public static final List<String> RoleType.fieldNames4OrderClauseFilter = java.util.Arrays.asList("typeName");
    
    public static final EntityManager RoleType.entityManager() {
        EntityManager em = new RoleType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long RoleType.countRoleTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM RoleType o", Long.class).getSingleResult();
    }
    
    public static List<RoleType> RoleType.findAllRoleTypes() {
        return entityManager().createQuery("SELECT o FROM RoleType o", RoleType.class).getResultList();
    }
    
    public static List<RoleType> RoleType.findAllRoleTypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM RoleType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, RoleType.class).getResultList();
    }
    
    public static RoleType RoleType.findRoleType(Long id) {
        if (id == null) return null;
        return entityManager().find(RoleType.class, id);
    }
    
    public static List<RoleType> RoleType.findRoleTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM RoleType o", RoleType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<RoleType> RoleType.findRoleTypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM RoleType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, RoleType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void RoleType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void RoleType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            RoleType attached = RoleType.findRoleType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void RoleType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void RoleType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public RoleType RoleType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        RoleType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
