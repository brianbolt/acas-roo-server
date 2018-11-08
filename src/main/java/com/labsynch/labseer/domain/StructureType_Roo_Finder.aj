// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StructureType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect StructureType_Roo_Finder {
    
    public static Long StructureType.countFindStructureTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = StructureType.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM StructureType AS o WHERE o.typeName = :typeName", Long.class);
        q.setParameter("typeName", typeName);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<StructureType> StructureType.findStructureTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = StructureType.entityManager();
        TypedQuery<StructureType> q = em.createQuery("SELECT o FROM StructureType AS o WHERE o.typeName = :typeName", StructureType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
    public static TypedQuery<StructureType> StructureType.findStructureTypesByTypeNameEquals(String typeName, String sortFieldName, String sortOrder) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = StructureType.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM StructureType AS o WHERE o.typeName = :typeName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<StructureType> q = em.createQuery(queryBuilder.toString(), StructureType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
}
