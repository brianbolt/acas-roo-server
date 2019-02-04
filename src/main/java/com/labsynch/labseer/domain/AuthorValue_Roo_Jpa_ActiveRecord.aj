// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AuthorValue;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuthorValue_Roo_Jpa_ActiveRecord {
    
    public static final List<String> AuthorValue.fieldNames4OrderClauseFilter = java.util.Arrays.asList("logger", "lsState");
    
    public static List<AuthorValue> AuthorValue.findAllAuthorValues() {
        return entityManager().createQuery("SELECT o FROM AuthorValue o", AuthorValue.class).getResultList();
    }
    
    public static List<AuthorValue> AuthorValue.findAllAuthorValues(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM AuthorValue o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, AuthorValue.class).getResultList();
    }
    
    public static AuthorValue AuthorValue.findAuthorValue(Long id) {
        if (id == null) return null;
        return entityManager().find(AuthorValue.class, id);
    }
    
    public static List<AuthorValue> AuthorValue.findAuthorValueEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AuthorValue o", AuthorValue.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<AuthorValue> AuthorValue.findAuthorValueEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM AuthorValue o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, AuthorValue.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public AuthorValue AuthorValue.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AuthorValue merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
