// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StateKind;
import com.labsynch.labseer.domain.StateType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect StateKind_Roo_Finder {
    
    public static TypedQuery<StateKind> StateKind.findStateKindsByKindNameEquals(String kindName) {
        if (kindName == null || kindName.length() == 0) throw new IllegalArgumentException("The kindName argument is required");
        EntityManager em = StateKind.entityManager();
        TypedQuery<StateKind> q = em.createQuery("SELECT o FROM StateKind AS o WHERE o.kindName = :kindName", StateKind.class);
        q.setParameter("kindName", kindName);
        return q;
    }
    
    public static TypedQuery<StateKind> StateKind.findStateKindsByKindNameEqualsAndLsType(String kindName, StateType lsType) {
        if (kindName == null || kindName.length() == 0) throw new IllegalArgumentException("The kindName argument is required");
        if (lsType == null) throw new IllegalArgumentException("The lsType argument is required");
        EntityManager em = StateKind.entityManager();
        TypedQuery<StateKind> q = em.createQuery("SELECT o FROM StateKind AS o WHERE o.kindName = :kindName  AND o.lsType = :lsType", StateKind.class);
        q.setParameter("kindName", kindName);
        q.setParameter("lsType", lsType);
        return q;
    }
    
    public static TypedQuery<StateKind> StateKind.findStateKindsByLsType(StateType lsType) {
        if (lsType == null) throw new IllegalArgumentException("The lsType argument is required");
        EntityManager em = StateKind.entityManager();
        TypedQuery<StateKind> q = em.createQuery("SELECT o FROM StateKind AS o WHERE o.lsType = :lsType", StateKind.class);
        q.setParameter("lsType", lsType);
        return q;
    }
    
}
