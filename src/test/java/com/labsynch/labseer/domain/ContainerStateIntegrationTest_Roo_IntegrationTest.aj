// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ContainerState;
import com.labsynch.labseer.domain.ContainerStateDataOnDemand;
import com.labsynch.labseer.domain.ContainerStateIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContainerStateIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ContainerStateIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ContainerStateIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ContainerStateIntegrationTest: @Transactional;
    
    @Autowired
    ContainerStateDataOnDemand ContainerStateIntegrationTest.dod;
    
    @Test
    public void ContainerStateIntegrationTest.testCountContainerStates() {
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", dod.getRandomContainerState());
        long count = ContainerState.countContainerStates();
        Assert.assertTrue("Counter for 'ContainerState' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ContainerStateIntegrationTest.testFindContainerState() {
        ContainerState obj = dod.getRandomContainerState();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to provide an identifier", id);
        obj = ContainerState.findContainerState(id);
        Assert.assertNotNull("Find method for 'ContainerState' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ContainerState' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ContainerStateIntegrationTest.testFindAllContainerStates() {
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", dod.getRandomContainerState());
        long count = ContainerState.countContainerStates();
        Assert.assertTrue("Too expensive to perform a find all test for 'ContainerState', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ContainerState> result = ContainerState.findAllContainerStates();
        Assert.assertNotNull("Find all method for 'ContainerState' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ContainerState' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ContainerStateIntegrationTest.testFindContainerStateEntries() {
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", dod.getRandomContainerState());
        long count = ContainerState.countContainerStates();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ContainerState> result = ContainerState.findContainerStateEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ContainerState' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ContainerState' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ContainerStateIntegrationTest.testFlush() {
        ContainerState obj = dod.getRandomContainerState();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to provide an identifier", id);
        obj = ContainerState.findContainerState(id);
        Assert.assertNotNull("Find method for 'ContainerState' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContainerState(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ContainerState' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ContainerStateIntegrationTest.testMergeUpdate() {
        ContainerState obj = dod.getRandomContainerState();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to provide an identifier", id);
        obj = ContainerState.findContainerState(id);
        boolean modified =  dod.modifyContainerState(obj);
        Integer currentVersion = obj.getVersion();
        ContainerState merged = (ContainerState)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ContainerState' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ContainerStateIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", dod.getRandomContainerState());
        ContainerState obj = dod.getNewTransientContainerState(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ContainerState' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ContainerState' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ContainerStateIntegrationTest.testRemove() {
        ContainerState obj = dod.getRandomContainerState();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ContainerState' failed to provide an identifier", id);
        obj = ContainerState.findContainerState(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ContainerState' with identifier '" + id + "'", ContainerState.findContainerState(id));
    }
    
}
