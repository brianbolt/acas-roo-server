// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.InteractionType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect InteractionType_Roo_Finder {
    
    public static Long InteractionType.countFindInteractionTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = InteractionType.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM InteractionType AS o WHERE o.typeName = :typeName", Long.class);
        q.setParameter("typeName", typeName);
        return ((Long) q.getSingleResult());
    }
    
    public static Long InteractionType.countFindInteractionTypesByTypeNameEqualsAndTypeVerbEquals(String typeName, String typeVerb) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        if (typeVerb == null || typeVerb.length() == 0) throw new IllegalArgumentException("The typeVerb argument is required");
        EntityManager em = InteractionType.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM InteractionType AS o WHERE o.typeName = :typeName  AND o.typeVerb = :typeVerb", Long.class);
        q.setParameter("typeName", typeName);
        q.setParameter("typeVerb", typeVerb);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<InteractionType> InteractionType.findInteractionTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = InteractionType.entityManager();
        TypedQuery<InteractionType> q = em.createQuery("SELECT o FROM InteractionType AS o WHERE o.typeName = :typeName", InteractionType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
    public static TypedQuery<InteractionType> InteractionType.findInteractionTypesByTypeNameEquals(String typeName, String sortFieldName, String sortOrder) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = InteractionType.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM InteractionType AS o WHERE o.typeName = :typeName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<InteractionType> q = em.createQuery(queryBuilder.toString(), InteractionType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
    public static TypedQuery<InteractionType> InteractionType.findInteractionTypesByTypeNameEqualsAndTypeVerbEquals(String typeName, String typeVerb) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        if (typeVerb == null || typeVerb.length() == 0) throw new IllegalArgumentException("The typeVerb argument is required");
        EntityManager em = InteractionType.entityManager();
        TypedQuery<InteractionType> q = em.createQuery("SELECT o FROM InteractionType AS o WHERE o.typeName = :typeName  AND o.typeVerb = :typeVerb", InteractionType.class);
        q.setParameter("typeName", typeName);
        q.setParameter("typeVerb", typeVerb);
        return q;
    }
    
    public static TypedQuery<InteractionType> InteractionType.findInteractionTypesByTypeNameEqualsAndTypeVerbEquals(String typeName, String typeVerb, String sortFieldName, String sortOrder) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        if (typeVerb == null || typeVerb.length() == 0) throw new IllegalArgumentException("The typeVerb argument is required");
        EntityManager em = InteractionType.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM InteractionType AS o WHERE o.typeName = :typeName  AND o.typeVerb = :typeVerb");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<InteractionType> q = em.createQuery(queryBuilder.toString(), InteractionType.class);
        q.setParameter("typeName", typeName);
        q.setParameter("typeVerb", typeVerb);
        return q;
    }
    
}
