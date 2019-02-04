// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.domain.ProtocolState;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ProtocolState_Roo_Finder {
    
    public static Long ProtocolState.countFindProtocolStatesByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = ProtocolState.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM ProtocolState AS o WHERE o.lsTransaction = :lsTransaction", Long.class);
        q.setParameter("lsTransaction", lsTransaction);
        return ((Long) q.getSingleResult());
    }
    
    public static Long ProtocolState.countFindProtocolStatesByProtocol(Protocol protocol) {
        if (protocol == null) throw new IllegalArgumentException("The protocol argument is required");
        EntityManager em = ProtocolState.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM ProtocolState AS o WHERE o.protocol = :protocol", Long.class);
        q.setParameter("protocol", protocol);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<ProtocolState> ProtocolState.findProtocolStatesByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = ProtocolState.entityManager();
        TypedQuery<ProtocolState> q = em.createQuery("SELECT o FROM ProtocolState AS o WHERE o.lsTransaction = :lsTransaction", ProtocolState.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
    public static TypedQuery<ProtocolState> ProtocolState.findProtocolStatesByLsTransactionEquals(Long lsTransaction, String sortFieldName, String sortOrder) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = ProtocolState.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM ProtocolState AS o WHERE o.lsTransaction = :lsTransaction");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<ProtocolState> q = em.createQuery(queryBuilder.toString(), ProtocolState.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
    public static TypedQuery<ProtocolState> ProtocolState.findProtocolStatesByProtocol(Protocol protocol) {
        if (protocol == null) throw new IllegalArgumentException("The protocol argument is required");
        EntityManager em = ProtocolState.entityManager();
        TypedQuery<ProtocolState> q = em.createQuery("SELECT o FROM ProtocolState AS o WHERE o.protocol = :protocol", ProtocolState.class);
        q.setParameter("protocol", protocol);
        return q;
    }
    
    public static TypedQuery<ProtocolState> ProtocolState.findProtocolStatesByProtocol(Protocol protocol, String sortFieldName, String sortOrder) {
        if (protocol == null) throw new IllegalArgumentException("The protocol argument is required");
        EntityManager em = ProtocolState.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM ProtocolState AS o WHERE o.protocol = :protocol");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<ProtocolState> q = em.createQuery(queryBuilder.toString(), ProtocolState.class);
        q.setParameter("protocol", protocol);
        return q;
    }
    
}
