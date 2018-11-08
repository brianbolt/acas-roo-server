// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Subject;
import com.labsynch.labseer.domain.SubjectState;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect SubjectState_Roo_Finder {
    
    public static Long SubjectState.countFindSubjectStatesByLsTypeEqualsAndLsKindEqualsAndSubject(String lsType, String lsKind, Subject subject) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (subject == null) throw new IllegalArgumentException("The subject argument is required");
        EntityManager em = SubjectState.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SubjectState AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.subject = :subject", Long.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("subject", subject);
        return ((Long) q.getSingleResult());
    }
    
    public static Long SubjectState.countFindSubjectStatesBySubject(Subject subject) {
        if (subject == null) throw new IllegalArgumentException("The subject argument is required");
        EntityManager em = SubjectState.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM SubjectState AS o WHERE o.subject = :subject", Long.class);
        q.setParameter("subject", subject);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<SubjectState> SubjectState.findSubjectStatesByLsTypeEqualsAndLsKindEqualsAndSubject(String lsType, String lsKind, Subject subject) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (subject == null) throw new IllegalArgumentException("The subject argument is required");
        EntityManager em = SubjectState.entityManager();
        TypedQuery<SubjectState> q = em.createQuery("SELECT o FROM SubjectState AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.subject = :subject", SubjectState.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("subject", subject);
        return q;
    }
    
    public static TypedQuery<SubjectState> SubjectState.findSubjectStatesByLsTypeEqualsAndLsKindEqualsAndSubject(String lsType, String lsKind, Subject subject, String sortFieldName, String sortOrder) {
        if (lsType == null || lsType.length() == 0) throw new IllegalArgumentException("The lsType argument is required");
        if (lsKind == null || lsKind.length() == 0) throw new IllegalArgumentException("The lsKind argument is required");
        if (subject == null) throw new IllegalArgumentException("The subject argument is required");
        EntityManager em = SubjectState.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SubjectState AS o WHERE o.lsType = :lsType  AND o.lsKind = :lsKind  AND o.subject = :subject");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SubjectState> q = em.createQuery(queryBuilder.toString(), SubjectState.class);
        q.setParameter("lsType", lsType);
        q.setParameter("lsKind", lsKind);
        q.setParameter("subject", subject);
        return q;
    }
    
    public static TypedQuery<SubjectState> SubjectState.findSubjectStatesBySubject(Subject subject, String sortFieldName, String sortOrder) {
        if (subject == null) throw new IllegalArgumentException("The subject argument is required");
        EntityManager em = SubjectState.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM SubjectState AS o WHERE o.subject = :subject");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<SubjectState> q = em.createQuery(queryBuilder.toString(), SubjectState.class);
        q.setParameter("subject", subject);
        return q;
    }
    
}
