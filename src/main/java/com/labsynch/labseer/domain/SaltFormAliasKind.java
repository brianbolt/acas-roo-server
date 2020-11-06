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
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.transaction.annotation.Transactional;

@Configurable
@Entity
public class SaltFormAliasKind {
	
    @NotNull
    @ManyToOne
    private SaltFormAliasType lsType;

    @Size(max = 255)
    private String kindName;
    

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

	public static final List<String> fieldNames4OrderClauseFilter = java.util.Arrays.asList("lsType", "kindName");

	public static final EntityManager entityManager() {
        EntityManager em = new SaltFormAliasKind().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countSaltFormAliasKinds() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SaltFormAliasKind o", Long.class).getSingleResult();
    }

	public static List<SaltFormAliasKind> findAllSaltFormAliasKinds() {
        return entityManager().createQuery("SELECT o FROM SaltFormAliasKind o", SaltFormAliasKind.class).getResultList();
    }

	public static List<SaltFormAliasKind> findAllSaltFormAliasKinds(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SaltFormAliasKind o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SaltFormAliasKind.class).getResultList();
    }

	public static SaltFormAliasKind findSaltFormAliasKind(Long id) {
        if (id == null) return null;
        return entityManager().find(SaltFormAliasKind.class, id);
    }

	public static List<SaltFormAliasKind> findSaltFormAliasKindEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SaltFormAliasKind o", SaltFormAliasKind.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	public static List<SaltFormAliasKind> findSaltFormAliasKindEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SaltFormAliasKind o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SaltFormAliasKind.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            SaltFormAliasKind attached = SaltFormAliasKind.findSaltFormAliasKind(this.id);
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
    public SaltFormAliasKind merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SaltFormAliasKind merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }

	public String toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }

	public static SaltFormAliasKind fromJsonToSaltFormAliasKind(String json) {
        return new JSONDeserializer<SaltFormAliasKind>()
        .use(null, SaltFormAliasKind.class).deserialize(json);
    }

	public static String toJsonArray(Collection<SaltFormAliasKind> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }

	public static String toJsonArray(Collection<SaltFormAliasKind> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }

	public static Collection<SaltFormAliasKind> fromJsonArrayToSaltFormAliasKinds(String json) {
        return new JSONDeserializer<List<SaltFormAliasKind>>()
        .use("values", SaltFormAliasKind.class).deserialize(json);
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public SaltFormAliasType getLsType() {
        return this.lsType;
    }

	public void setLsType(SaltFormAliasType lsType) {
        this.lsType = lsType;
    }

	public String getKindName() {
        return this.kindName;
    }

	public void setKindName(String kindName) {
        this.kindName = kindName;
    }
}
