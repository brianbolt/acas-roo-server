// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.BulkLoadFile;
import com.labsynch.labseer.domain.Parent;
import com.labsynch.labseer.domain.SaltForm;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect SaltForm_Roo_Finder {
    
    public static Long SaltForm.countFindSaltFormsByBulkLoadFileEquals(BulkLoadFile bulkLoadFile) {
        if (bulkLoadFile == null) throw new IllegalArgumentException("The bulkLoadFile argument is required");
        EntityManager em = SaltForm.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SaltForm AS o WHERE o.bulkLoadFile = :bulkLoadFile", Long.class);
        q.setParameter("bulkLoadFile", bulkLoadFile);
        return ((Long) q.getSingleResult());
    }
    
    public static Long SaltForm.countFindSaltFormsByCdId(int CdId) {
        EntityManager em = SaltForm.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SaltForm AS o WHERE o.CdId = :CdId", Long.class);
        q.setParameter("CdId", CdId);
        return ((Long) q.getSingleResult());
    }
    
    public static Long SaltForm.countFindSaltFormsByCorpNameEquals(String corpName) {
        if (corpName == null || corpName.length() == 0) throw new IllegalArgumentException("The corpName argument is required");
        EntityManager em = SaltForm.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SaltForm AS o WHERE o.corpName = :corpName", Long.class);
        q.setParameter("corpName", corpName);
        return ((Long) q.getSingleResult());
    }
    
    public static Long SaltForm.countFindSaltFormsByCorpNameLike(String corpName) {
        if (corpName == null || corpName.length() == 0) throw new IllegalArgumentException("The corpName argument is required");
        corpName = corpName.replace('*', '%');
        if (corpName.charAt(0) != '%') {
            corpName = "%" + corpName;
        }
        if (corpName.charAt(corpName.length() - 1) != '%') {
            corpName = corpName + "%";
        }
        EntityManager em = SaltForm.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SaltForm AS o WHERE LOWER(o.corpName) LIKE LOWER(:corpName)", Long.class);
        q.setParameter("corpName", corpName);
        return ((Long) q.getSingleResult());
    }
    
    public static Long SaltForm.countFindSaltFormsByParent(Parent parent) {
        if (parent == null) throw new IllegalArgumentException("The parent argument is required");
        EntityManager em = SaltForm.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SaltForm AS o WHERE o.parent = :parent", Long.class);
        q.setParameter("parent", parent);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByBulkLoadFileEquals(BulkLoadFile bulkLoadFile) {
        if (bulkLoadFile == null) throw new IllegalArgumentException("The bulkLoadFile argument is required");
        EntityManager em = SaltForm.entityManager();
        TypedQuery<SaltForm> q = em.createQuery("SELECT o FROM SaltForm AS o WHERE o.bulkLoadFile = :bulkLoadFile", SaltForm.class);
        q.setParameter("bulkLoadFile", bulkLoadFile);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByBulkLoadFileEquals(BulkLoadFile bulkLoadFile, String sortFieldName, String sortOrder) {
        if (bulkLoadFile == null) throw new IllegalArgumentException("The bulkLoadFile argument is required");
        EntityManager em = SaltForm.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SaltForm AS o WHERE o.bulkLoadFile = :bulkLoadFile");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SaltForm> q = em.createQuery(queryBuilder.toString(), SaltForm.class);
        q.setParameter("bulkLoadFile", bulkLoadFile);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByCdId(int CdId) {
        EntityManager em = SaltForm.entityManager();
        TypedQuery<SaltForm> q = em.createQuery("SELECT o FROM SaltForm AS o WHERE o.CdId = :CdId", SaltForm.class);
        q.setParameter("CdId", CdId);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByCdId(int CdId, String sortFieldName, String sortOrder) {
        EntityManager em = SaltForm.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SaltForm AS o WHERE o.CdId = :CdId");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SaltForm> q = em.createQuery(queryBuilder.toString(), SaltForm.class);
        q.setParameter("CdId", CdId);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByCorpNameEquals(String corpName) {
        if (corpName == null || corpName.length() == 0) throw new IllegalArgumentException("The corpName argument is required");
        EntityManager em = SaltForm.entityManager();
        TypedQuery<SaltForm> q = em.createQuery("SELECT o FROM SaltForm AS o WHERE o.corpName = :corpName", SaltForm.class);
        q.setParameter("corpName", corpName);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByCorpNameEquals(String corpName, String sortFieldName, String sortOrder) {
        if (corpName == null || corpName.length() == 0) throw new IllegalArgumentException("The corpName argument is required");
        EntityManager em = SaltForm.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SaltForm AS o WHERE o.corpName = :corpName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SaltForm> q = em.createQuery(queryBuilder.toString(), SaltForm.class);
        q.setParameter("corpName", corpName);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByCorpNameLike(String corpName) {
        if (corpName == null || corpName.length() == 0) throw new IllegalArgumentException("The corpName argument is required");
        corpName = corpName.replace('*', '%');
        if (corpName.charAt(0) != '%') {
            corpName = "%" + corpName;
        }
        if (corpName.charAt(corpName.length() - 1) != '%') {
            corpName = corpName + "%";
        }
        EntityManager em = SaltForm.entityManager();
        TypedQuery<SaltForm> q = em.createQuery("SELECT o FROM SaltForm AS o WHERE LOWER(o.corpName) LIKE LOWER(:corpName)", SaltForm.class);
        q.setParameter("corpName", corpName);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByCorpNameLike(String corpName, String sortFieldName, String sortOrder) {
        if (corpName == null || corpName.length() == 0) throw new IllegalArgumentException("The corpName argument is required");
        corpName = corpName.replace('*', '%');
        if (corpName.charAt(0) != '%') {
            corpName = "%" + corpName;
        }
        if (corpName.charAt(corpName.length() - 1) != '%') {
            corpName = corpName + "%";
        }
        EntityManager em = SaltForm.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SaltForm AS o WHERE LOWER(o.corpName) LIKE LOWER(:corpName)");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SaltForm> q = em.createQuery(queryBuilder.toString(), SaltForm.class);
        q.setParameter("corpName", corpName);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByParent(Parent parent) {
        if (parent == null) throw new IllegalArgumentException("The parent argument is required");
        EntityManager em = SaltForm.entityManager();
        TypedQuery<SaltForm> q = em.createQuery("SELECT o FROM SaltForm AS o WHERE o.parent = :parent", SaltForm.class);
        q.setParameter("parent", parent);
        return q;
    }
    
    public static TypedQuery<SaltForm> SaltForm.findSaltFormsByParent(Parent parent, String sortFieldName, String sortOrder) {
        if (parent == null) throw new IllegalArgumentException("The parent argument is required");
        EntityManager em = SaltForm.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SaltForm AS o WHERE o.parent = :parent");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SaltForm> q = em.createQuery(queryBuilder.toString(), SaltForm.class);
        q.setParameter("parent", parent);
        return q;
    }
    
}
