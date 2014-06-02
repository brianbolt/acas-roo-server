// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ExperimentType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ExperimentType_Roo_Finder {
    
    public static TypedQuery<ExperimentType> ExperimentType.findExperimentTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = ExperimentType.entityManager();
        TypedQuery<ExperimentType> q = em.createQuery("SELECT o FROM ExperimentType AS o WHERE o.typeName = :typeName", ExperimentType.class);
        q.setParameter("typeName", typeName);
        return q;
    }
    
}
