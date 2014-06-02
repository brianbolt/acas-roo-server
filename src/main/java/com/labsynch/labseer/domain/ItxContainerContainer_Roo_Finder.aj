// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ItxContainerContainer;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ItxContainerContainer_Roo_Finder {
    
    public static TypedQuery<ItxContainerContainer> ItxContainerContainer.findItxContainerContainersByLsTransactionEquals(Long lsTransaction) {
        if (lsTransaction == null) throw new IllegalArgumentException("The lsTransaction argument is required");
        EntityManager em = ItxContainerContainer.entityManager();
        TypedQuery<ItxContainerContainer> q = em.createQuery("SELECT o FROM ItxContainerContainer AS o WHERE o.lsTransaction = :lsTransaction", ItxContainerContainer.class);
        q.setParameter("lsTransaction", lsTransaction);
        return q;
    }
    
}
