// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.Author;
import com.labsynch.labseer.domain.AuthorDataOnDemand;
import com.labsynch.labseer.domain.AuthorTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuthorTest_Roo_IntegrationTest {
    
    declare @type: AuthorTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AuthorTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AuthorTest: @Transactional;
    
    @Autowired
    AuthorDataOnDemand AuthorTest.dod;
    
    @Test
    public void AuthorTest.testCountAuthors() {
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());
        long count = Author.countAuthors();
        Assert.assertTrue("Counter for 'Author' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AuthorTest.testFindAuthor() {
        Author obj = dod.getRandomAuthor();
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);
        obj = Author.findAuthor(id);
        Assert.assertNotNull("Find method for 'Author' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Author' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AuthorTest.testFindAllAuthors() {
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());
        long count = Author.countAuthors();
        Assert.assertTrue("Too expensive to perform a find all test for 'Author', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Author> result = Author.findAllAuthors();
        Assert.assertNotNull("Find all method for 'Author' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Author' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AuthorTest.testFindAuthorEntries() {
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());
        long count = Author.countAuthors();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Author> result = Author.findAuthorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Author' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Author' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AuthorTest.testFlush() {
        Author obj = dod.getRandomAuthor();
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);
        obj = Author.findAuthor(id);
        Assert.assertNotNull("Find method for 'Author' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAuthor(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Author' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AuthorTest.testMergeUpdate() {
        Author obj = dod.getRandomAuthor();
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);
        obj = Author.findAuthor(id);
        boolean modified =  dod.modifyAuthor(obj);
        Integer currentVersion = obj.getVersion();
        Author merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Author' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AuthorTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());
        Author obj = dod.getNewTransientAuthor(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Author' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Author' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Author' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AuthorTest.testRemove() {
        Author obj = dod.getRandomAuthor();
        Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);
        obj = Author.findAuthor(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Author' with identifier '" + id + "'", Author.findAuthor(id));
    }
    
}
