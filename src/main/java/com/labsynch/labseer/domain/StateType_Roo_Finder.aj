// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StateType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect StateType_Roo_Finder {
    
    public static Long StateType.countFindStateTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = StateType.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM StateType AS o WHERE o.typeName = :typeName", Long.class);
        q.setParameter("typeName", typeName);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<StateType> StateType.findStateTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = StateType.entityManager();
        TypedQuery<StateType> q = em.createQuery("SELECT o FROM StateType AS o WHERE o.typeName = :typeName", StateType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
    public static TypedQuery<StateType> StateType.findStateTypesByTypeNameEquals(String typeName, String sortFieldName, String sortOrder) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = StateType.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM StateType AS o WHERE o.typeName = :typeName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<StateType> q = em.createQuery(queryBuilder.toString(), StateType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
}
