// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.CronJob;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CronJob_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CronJob.entityManager;
    
    public static final List<String> CronJob.fieldNames4OrderClauseFilter = java.util.Arrays.asList("logger", "schedule", "scriptType", "scriptFile", "functionName", "scriptJSONData", "active", "ignored", "runUser", "codeName", "lastStartTime", "lastDuration", "lastResultJSON", "numberOfExecutions", "id", "version");
    
    public static final EntityManager CronJob.entityManager() {
        EntityManager em = new CronJob().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CronJob.countCronJobs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CronJob o", Long.class).getSingleResult();
    }
    
    public static List<CronJob> CronJob.findAllCronJobs() {
        return entityManager().createQuery("SELECT o FROM CronJob o", CronJob.class).getResultList();
    }
    
    public static List<CronJob> CronJob.findAllCronJobs(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM CronJob o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, CronJob.class).getResultList();
    }
    
    public static CronJob CronJob.findCronJob(Long id) {
        if (id == null) return null;
        return entityManager().find(CronJob.class, id);
    }
    
    public static List<CronJob> CronJob.findCronJobEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CronJob o", CronJob.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<CronJob> CronJob.findCronJobEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM CronJob o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, CronJob.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CronJob.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CronJob.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CronJob attached = CronJob.findCronJob(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CronJob.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CronJob.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CronJob CronJob.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CronJob merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
