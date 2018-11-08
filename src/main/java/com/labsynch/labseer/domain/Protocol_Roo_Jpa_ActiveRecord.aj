// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Protocol;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Protocol_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Protocol.fieldNames4OrderClauseFilter = java.util.Arrays.asList("logger", "shortDescription", "lsStates", "experiments", "lsLabels", "lsTags", "firstProtocols", "secondProtocols");
    
    public static long Protocol.countProtocols() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Protocol o", Long.class).getSingleResult();
    }
    
    public static List<Protocol> Protocol.findAllProtocols() {
        return entityManager().createQuery("SELECT o FROM Protocol o", Protocol.class).getResultList();
    }
    
    public static List<Protocol> Protocol.findAllProtocols(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Protocol o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Protocol.class).getResultList();
    }
    
    public static List<Protocol> Protocol.findProtocolEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Protocol o", Protocol.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Protocol> Protocol.findProtocolEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Protocol o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Protocol.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Protocol Protocol.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Protocol merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
