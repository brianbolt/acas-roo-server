// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AbstractLabel;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AbstractLabel_Roo_Jpa_ActiveRecord {
    
    public static final List<String> AbstractLabel.fieldNames4OrderClauseFilter = java.util.Arrays.asList("labelText", "recordedBy", "recordedDate", "modifiedDate", "physicallyLabled", "imageFile", "lsType", "lsKind", "lsTypeAndKind", "preferred", "ignored", "deleted", "lsTransaction", "id", "entityManager");
    
    public static long AbstractLabel.countAbstractLabels() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AbstractLabel o", Long.class).getSingleResult();
    }
    
    public static List<AbstractLabel> AbstractLabel.findAllAbstractLabels() {
        return entityManager().createQuery("SELECT o FROM AbstractLabel o", AbstractLabel.class).getResultList();
    }
    
    public static List<AbstractLabel> AbstractLabel.findAllAbstractLabels(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM AbstractLabel o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, AbstractLabel.class).getResultList();
    }
    
    public static AbstractLabel AbstractLabel.findAbstractLabel(Long id) {
        if (id == null) return null;
        return entityManager().find(AbstractLabel.class, id);
    }
    
    public static List<AbstractLabel> AbstractLabel.findAbstractLabelEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AbstractLabel o", AbstractLabel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<AbstractLabel> AbstractLabel.findAbstractLabelEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM AbstractLabel o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, AbstractLabel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void AbstractLabel.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AbstractLabel attached = AbstractLabel.findAbstractLabel(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AbstractLabel.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AbstractLabel.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
}
