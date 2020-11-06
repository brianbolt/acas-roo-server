package com.labsynch.labseer.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.SequenceGenerator;
import javax.persistence.TypedQuery;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@Configurable
@Entity
@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "UNITS_TYPE_PKSEQ", finders = { "findUnitTypesByTypeNameEquals" })
@RooJson
public class UnitType {

    @NotNull
    @Column(unique = true)
    @Size(max = 64)
    private String typeName;

	@Id
    @SequenceGenerator(name = "unitTypeGen", sequenceName = "UNITS_TYPE_PKSEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "unitTypeGen")
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;

	public Long getId() {
        return this.id;
    }

	public void setId(Long id) {
        this.id = id;
    }

	public Integer getVersion() {
        return this.version;
    }

	public void setVersion(Integer version) {
        this.version = version;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final List<String> fieldNames4OrderClauseFilter = java.util.Arrays.asList("typeName", "id", "version");

	public static final EntityManager entityManager() {
        EntityManager em = new UnitType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countUnitTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UnitType o", Long.class).getSingleResult();
    }

	public static List<UnitType> findAllUnitTypes() {
        return entityManager().createQuery("SELECT o FROM UnitType o", UnitType.class).getResultList();
    }

	public static List<UnitType> findAllUnitTypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM UnitType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, UnitType.class).getResultList();
    }

	public static UnitType findUnitType(Long id) {
        if (id == null) return null;
        return entityManager().find(UnitType.class, id);
    }

	public static List<UnitType> findUnitTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UnitType o", UnitType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	public static List<UnitType> findUnitTypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM UnitType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, UnitType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public void persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }

	@Transactional
    public void remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UnitType attached = UnitType.findUnitType(this.id);
            this.entityManager.remove(attached);
        }
    }

	@Transactional
    public void flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }

	@Transactional
    public void clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }

	@Transactional
    public UnitType merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UnitType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public static Long countFindUnitTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = UnitType.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM UnitType AS o WHERE o.typeName = :typeName", Long.class);
        q.setParameter("typeName", typeName);
        return ((Long) q.getSingleResult());
    }

	public static TypedQuery<UnitType> findUnitTypesByTypeNameEquals(String typeName) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = UnitType.entityManager();
        TypedQuery<UnitType> q = em.createQuery("SELECT o FROM UnitType AS o WHERE o.typeName = :typeName", UnitType.class);
        q.setParameter("typeName", typeName);
        return q;
    }

	public static TypedQuery<UnitType> findUnitTypesByTypeNameEquals(String typeName, String sortFieldName, String sortOrder) {
        if (typeName == null || typeName.length() == 0) throw new IllegalArgumentException("The typeName argument is required");
        EntityManager em = UnitType.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM UnitType AS o WHERE o.typeName = :typeName");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<UnitType> q = em.createQuery(queryBuilder.toString(), UnitType.class);
        q.setParameter("typeName", typeName);
        return q;
    }

	public String getTypeName() {
        return this.typeName;
    }

	public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

	public String toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }

	public String toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }

	public static UnitType fromJsonToUnitType(String json) {
        return new JSONDeserializer<UnitType>()
        .use(null, UnitType.class).deserialize(json);
    }

	public static String toJsonArray(Collection<UnitType> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }

	public static String toJsonArray(Collection<UnitType> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }

	public static Collection<UnitType> fromJsonArrayToUnitTypes(String json) {
        return new JSONDeserializer<List<UnitType>>()
        .use("values", UnitType.class).deserialize(json);
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
