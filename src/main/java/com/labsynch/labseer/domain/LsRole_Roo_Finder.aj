// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsRole;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect LsRole_Roo_Finder {
    
    public static Long LsRole.countFindLsRolesByLsKindEquals(String lsKind) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM LsRole AS o WHERE o.lsKind = :lsKind", Long.class);
        q.setParameter("lsKind", lsKind);
        return ((Long) q.getSingleResult());
    }
    
    public static Long LsRole.countFindLsRolesByLsTypeEquals(String lsType) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM LsRole AS o WHERE o.lsType = :lsType", Long.class);
        q.setParameter("lsType", lsType);
        return ((Long) q.getSingleResult());
    }
    
    public static Long LsRole.countFindLsRolesByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM LsRole AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind", Long.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return ((Long) q.getSingleResult());
    }
    
    public static Long LsRole.countFindLsRolesByLsTypeEqualsAndLsKindEqualsAndRoleNameEquals(String lsType, String lsKind, String roleName) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM LsRole AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.roleName = :roleName", Long.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("roleName", roleName);
        return ((Long) q.getSingleResult());
    }
    
    public static Long LsRole.countFindLsRolesByLsTypeEqualsAndRoleNameEquals(String lsType, String roleName) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM LsRole AS o WHERE o.lsType = :lsType  AND o.roleName = :roleName", Long.class);
        q.setParameter("lsType", lsType);
        q.setParameter("roleName", roleName);
        return ((Long) q.getSingleResult());
    }
    
    public static Long LsRole.countFindLsRolesByRoleNameEquals(String roleName) {
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM LsRole AS o WHERE o.roleName = :roleName", Long.class);
        q.setParameter("roleName", roleName);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsKindEquals(String lsKind) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery<LsRole> q = em.createQuery("SELECT o FROM LsRole AS o WHERE o.lsKind = :lsKind", LsRole.class);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsKindEquals(String lsKind, String sortFieldName, String sortOrder) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = LsRole.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM LsRole AS o WHERE o.lsKind = :lsKind");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<LsRole> q = em.createQuery(queryBuilder.toString(), LsRole.class);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEquals(String lsType) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery<LsRole> q = em.createQuery("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType", LsRole.class);
        q.setParameter("lsType", lsType);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEquals(String lsType, String sortFieldName, String sortOrder) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        EntityManager em = LsRole.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<LsRole> q = em.createQuery(queryBuilder.toString(), LsRole.class);
        q.setParameter("lsType", lsType);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery<LsRole> q = em.createQuery("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind", LsRole.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEqualsAndLsKindEquals(String lsType, String lsKind, String sortFieldName, String sortOrder) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = LsRole.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<LsRole> q = em.createQuery(queryBuilder.toString(), LsRole.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEqualsAndLsKindEqualsAndRoleNameEquals(String lsType, String lsKind, String roleName) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery<LsRole> q = em.createQuery("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.roleName = :roleName", LsRole.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("roleName", roleName);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEqualsAndLsKindEqualsAndRoleNameEquals(String lsType, String lsKind, String roleName, String sortFieldName, String sortOrder) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.roleName = :roleName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<LsRole> q = em.createQuery(queryBuilder.toString(), LsRole.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("roleName", roleName);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEqualsAndRoleNameEquals(String lsType, String roleName) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        TypedQuery<LsRole> q = em.createQuery("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType  AND o.roleName = :roleName", LsRole.class);
        q.setParameter("lsType", lsType);
        q.setParameter("roleName", roleName);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByLsTypeEqualsAndRoleNameEquals(String lsType, String roleName, String sortFieldName, String sortOrder) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM LsRole AS o WHERE o.lsType = :lsType  AND o.roleName = :roleName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<LsRole> q = em.createQuery(queryBuilder.toString(), LsRole.class);
        q.setParameter("lsType", lsType);
        q.setParameter("roleName", roleName);
        return q;
    }
    
    public static TypedQuery<LsRole> LsRole.findLsRolesByRoleNameEquals(String roleName, String sortFieldName, String sortOrder) {
        if (roleName == null || roleName.length() == 0) throw new IllegalArgumentException("The roleName argument is required");
        EntityManager em = LsRole.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM LsRole AS o WHERE o.roleName = :roleName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<LsRole> q = em.createQuery(queryBuilder.toString(), LsRole.class);
        q.setParameter("roleName", roleName);
        return q;
    }
    
}
