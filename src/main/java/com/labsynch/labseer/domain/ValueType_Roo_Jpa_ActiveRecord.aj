// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ValueType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ValueType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ValueType.entityManager;
    
    public static final List<String> ValueType.fieldNames4OrderClauseFilter = java.util.Arrays.asList("logger", "typeName", "id", "version");
    
    public static final EntityManager ValueType.entityManager() {
        EntityManager em = new ValueType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ValueType.countValueTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ValueType o", Long.class).getSingleResult();
    }
    
    public static List<ValueType> ValueType.findAllValueTypes() {
        return entityManager().createQuery("SELECT o FROM ValueType o", ValueType.class).getResultList();
    }
    
    public static List<ValueType> ValueType.findAllValueTypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ValueType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ValueType.class).getResultList();
    }
    
    public static ValueType ValueType.findValueType(Long id) {
        if (id == null) return null;
        return entityManager().find(ValueType.class, id);
    }
    
    public static List<ValueType> ValueType.findValueTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ValueType o", ValueType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ValueType> ValueType.findValueTypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ValueType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ValueType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ValueType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ValueType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ValueType attached = ValueType.findValueType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ValueType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ValueType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ValueType ValueType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ValueType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
