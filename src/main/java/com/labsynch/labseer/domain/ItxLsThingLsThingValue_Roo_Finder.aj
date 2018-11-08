// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxLsThingLsThingValue;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ItxLsThingLsThingValue_Roo_Finder {
    
    public static Long ItxLsThingLsThingValue.countFindItxLsThingLsThingValuesByLsKindEquals(String lsKind) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = ItxLsThingLsThingValue.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM ItxLsThingLsThingValue AS o WHERE o.lsKind = :lsKind", Long.class);
        q.setParameter("lsKind", lsKind);
        return ((Long) q.getSingleResult());
    }
    
    public static Long ItxLsThingLsThingValue.countFindItxLsThingLsThingValuesByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = ItxLsThingLsThingValue.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM ItxLsThingLsThingValue AS o WHERE o.lsTransaction = :lsTransaction", Long.class);
        q.setParameter("lsTransaction", lsTransaction);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<ItxLsThingLsThingValue> ItxLsThingLsThingValue.findItxLsThingLsThingValuesByLsKindEquals(String lsKind, String sortFieldName, String sortOrder) {
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        EntityManager em = ItxLsThingLsThingValue.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM ItxLsThingLsThingValue AS o WHERE o.lsKind = :lsKind");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<ItxLsThingLsThingValue> q = em.createQuery(queryBuilder.toString(), ItxLsThingLsThingValue.class);
        q.setParameter("lsKind", lsKind);
        return q;
    }
    
    public static TypedQuery<ItxLsThingLsThingValue> ItxLsThingLsThingValue.findItxLsThingLsThingValuesByLsTransactionEquals(Long lsTransaction, String sortFieldName, String sortOrder) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = ItxLsThingLsThingValue.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM ItxLsThingLsThingValue AS o WHERE o.lsTransaction = :lsTransaction");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<ItxLsThingLsThingValue> q = em.createQuery(queryBuilder.toString(), ItxLsThingLsThingValue.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
}
