// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.BulkLoadFile;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect BulkLoadFile_Roo_Finder {
    
    public static Long BulkLoadFile.countFindBulkLoadFilesByFileNameEquals(String fileName) {
        if (fileName == null || fileName.length() == 0) throw new IllegalArgumentException("The fileName argument is required");
        EntityManager em = BulkLoadFile.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM BulkLoadFile AS o WHERE o.fileName = :fileName", Long.class);
        q.setParameter("fileName", fileName);
        return ((Long) q.getSingleResult());
    }
    
    public static Long BulkLoadFile.countFindBulkLoadFilesByRecordedByEquals(String recordedBy) {
        if (recordedBy == null || recordedBy.length() == 0) throw new IllegalArgumentException("The recordedBy argument is required");
        EntityManager em = BulkLoadFile.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM BulkLoadFile AS o WHERE o.recordedBy = :recordedBy", Long.class);
        q.setParameter("recordedBy", recordedBy);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<BulkLoadFile> BulkLoadFile.findBulkLoadFilesByFileNameEquals(String fileName) {
        if (fileName == null || fileName.length() == 0) throw new IllegalArgumentException("The fileName argument is required");
        EntityManager em = BulkLoadFile.entityManager();
        TypedQuery<BulkLoadFile> q = em.createQuery("SELECT o FROM BulkLoadFile AS o WHERE o.fileName = :fileName", BulkLoadFile.class);
        q.setParameter("fileName", fileName);
        return q;
    }
    
    public static TypedQuery<BulkLoadFile> BulkLoadFile.findBulkLoadFilesByFileNameEquals(String fileName, String sortFieldName, String sortOrder) {
        if (fileName == null || fileName.length() == 0) throw new IllegalArgumentException("The fileName argument is required");
        EntityManager em = BulkLoadFile.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM BulkLoadFile AS o WHERE o.fileName = :fileName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<BulkLoadFile> q = em.createQuery(queryBuilder.toString(), BulkLoadFile.class);
        q.setParameter("fileName", fileName);
        return q;
    }
    
    public static TypedQuery<BulkLoadFile> BulkLoadFile.findBulkLoadFilesByRecordedByEquals(String recordedBy) {
        if (recordedBy == null || recordedBy.length() == 0) throw new IllegalArgumentException("The recordedBy argument is required");
        EntityManager em = BulkLoadFile.entityManager();
        TypedQuery<BulkLoadFile> q = em.createQuery("SELECT o FROM BulkLoadFile AS o WHERE o.recordedBy = :recordedBy", BulkLoadFile.class);
        q.setParameter("recordedBy", recordedBy);
        return q;
    }
    
    public static TypedQuery<BulkLoadFile> BulkLoadFile.findBulkLoadFilesByRecordedByEquals(String recordedBy, String sortFieldName, String sortOrder) {
        if (recordedBy == null || recordedBy.length() == 0) throw new IllegalArgumentException("The recordedBy argument is required");
        EntityManager em = BulkLoadFile.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM BulkLoadFile AS o WHERE o.recordedBy = :recordedBy");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<BulkLoadFile> q = em.createQuery(queryBuilder.toString(), BulkLoadFile.class);
        q.setParameter("recordedBy", recordedBy);
        return q;
    }
    
}
