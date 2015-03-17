package com.labsynch.labseer.api;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ItxExperimentExperiment;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"classpath:/META-INF/spring/applicationContext.xml",
		"classpath:/META-INF/spring/applicationContext-security.xml",
		"file:src/main/webapp/WEB-INF/spring/webmvc-config-test.xml"})
public class ApiItxExperimentExperimentControllerTest {

	private static final Logger logger = LoggerFactory.getLogger(ApiItxExperimentExperimentControllerTest.class);
	
    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }
    
    @Test
    @Transactional
    public void createFromJson() throws Exception {
    	Experiment firstExperiment = Experiment.findExperimentsByCodeNameEquals("EXPT-00000015").getSingleResult();
    	Experiment secondExperiment = Experiment.findExperimentsByCodeNameEquals("EXPT-00000018").getSingleResult();
    	ItxExperimentExperiment newItx = new ItxExperimentExperiment();
    	newItx.setFirstExperiment(firstExperiment);
    	newItx.setSecondExperiment(secondExperiment);
    	newItx.setRecordedBy("test");
    	newItx.setRecordedDate(new Date());
    	String json = newItx.toJson();
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/itxexperimentexperiments/")
    			.contentType(MediaType.APPLICATION_JSON)
    			.content(json)
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isCreated())
    			.andExpect(content().contentType("application/json"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	ItxExperimentExperiment postedItx = ItxExperimentExperiment.fromJsonToItxExperimentExperiment(responseJson);
    	logger.info(postedItx.toJson());
    }
    
    @Test
//    @Transactional
    public void createFromJson2() throws Exception {
        String json = "{\"deleted\":false,\"firstExperiment\":{\"codeName\":\"EXPT-00000015\",\"deleted\":false,\"id\":2165,\"ignored\":false,\"lsKind\":\"default\",\"lsLabels\":[{\"deleted\":false,\"id\":11053,\"ignored\":false,\"labelText\":\"Expt On2\",\"lsKind\":\"experiment name\",\"lsTransaction\":20,\"lsType\":\"name\",\"lsTypeAndKind\":\"name_experiment name\",\"physicallyLabled\":false,\"preferred\":true,\"recordedBy\":\"nouser\",\"recordedDate\":1396590049000,\"version\":0}],\"lsTransaction\":20,\"lsType\":\"default\",\"lsTypeAndKind\":\"default_default\",\"protocol\":{\"codeName\":\"PROT-00000010\",\"deleted\":false,\"id\":1599,\"ignored\":false,\"lsKind\":\"default\",\"lsTransaction\":15,\"lsType\":\"default\",\"lsTypeAndKind\":\"default_default\",\"recordedBy\":\"nouser\",\"recordedDate\":1396423362000,\"shortDescription\":\"protocol created by generic data parser\",\"version\":1},\"recordedBy\":\"nouser\",\"recordedDate\":1396590049000,\"shortDescription\":\"experiment created by generic data parser\",\"version\":1},\"id\":1466535,\"ignored\":false,\"lsTypeAndKind\":\"null_null\",\"recordedBy\":\"test\",\"recordedDate\":1426633674350,\"secondExperiment\":{\"codeName\":\"EXPT-00000018\",\"deleted\":false,\"id\":2183,\"ignored\":false,\"lsKind\":\"default\",\"lsLabels\":[{\"deleted\":false,\"id\":11056,\"ignored\":false,\"labelText\":\"Test Experiment 1\",\"lsKind\":\"experiment name\",\"lsTransaction\":23,\"lsType\":\"name\",\"lsTypeAndKind\":\"name_experiment name\",\"physicallyLabled\":false,\"preferred\":true,\"recordedBy\":\"nouser\",\"recordedDate\":1396930347000,\"version\":0}],\"lsTransaction\":23,\"lsType\":\"default\",\"lsTypeAndKind\":\"default_default\",\"protocol\":{\"codeName\":\"PROT-00000007\",\"deleted\":true,\"id\":1571,\"ignored\":true,\"lsKind\":\"default\",\"lsTransaction\":10,\"lsType\":\"default\",\"lsTypeAndKind\":\"default_default\",\"modifiedDate\":1418201390481,\"recordedBy\":\"egao\",\"recordedDate\":1418201389855,\"shortDescription\":\"protocol created by generic data parser\",\"version\":4},\"recordedBy\":\"nouser\",\"recordedDate\":1396930347000,\"shortDescription\":\"experiment created by generic data parser\",\"version\":1},\"version\":0}";
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/itxexperimentexperiments/")
    			.contentType(MediaType.APPLICATION_JSON)
    			.content(json)
    			.accept(MediaType.APPLICATION_JSON))
//    			.andExpect(status().isCreated())
//    			.andExpect(content().contentType("application/json"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	ItxExperimentExperiment postedItx = ItxExperimentExperiment.fromJsonToItxExperimentExperiment(responseJson);
    	logger.info(postedItx.toJson());
    }
    
}