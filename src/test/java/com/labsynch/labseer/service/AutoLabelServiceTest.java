/**
 * 
 */
package com.labsynch.labseer.service;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.labsynch.labseer.domain.DDictValue;
import com.labsynch.labseer.domain.LabelSequence;
import com.labsynch.labseer.dto.AutoLabelDTO;

/**
 * @author fairway
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/spring/applicationContext.xml", "classpath:/META-INF/spring/applicationContext-security.xml"})
@Configurable
public class AutoLabelServiceTest {
	
	private static final Logger logger = LoggerFactory.getLogger(DataDictionaryServiceImpl.class);
	
	@Autowired
	private AutoLabelService autoLabelService;

	/**
	 * Test method for {@link com.labsynch.labseer.domain.DDictValue#validate()}.
	 */
	@Test
	@Transactional
	public void testWithKnownParameters() {
		String thingTypeAndKind = "document_experiment";
		String labelTypeAndKind = "id_codeName";
		Long numberOfLabels = 1L;
		List<AutoLabelDTO> labels = autoLabelService.getAutoLabels(thingTypeAndKind, labelTypeAndKind, numberOfLabels );
		logger.debug("label 0: " + labels.get(0).toJson());
	}

	@Test
	@Transactional
	public void testWithUnknownThingKindParameters(){
		String thingTypeAndKind = "document_test";
		String labelTypeAndKind = "id_codeName";
		Long numberOfLabels = 1L;
		List<AutoLabelDTO> labels;
		try {
			labels = autoLabelService.getAutoLabels(thingTypeAndKind, labelTypeAndKind, numberOfLabels );
		} catch(NoResultException ex) {
			LabelSequence theSequence = new LabelSequence();
			theSequence.setDigits(6);
			theSequence.setGroupDigits(false);
			theSequence.setIgnored(false);
			theSequence.setLabelPrefix("DD");
			theSequence.setLabelSeparator("-");
			theSequence.setLabelTypeAndKind("id_codeName");
			theSequence.setLatestNumber(0L);
			theSequence.setModifiedDate((new Date()));
			theSequence.setThingTypeAndKind("document_test");
			theSequence.setVersion(0);
			theSequence.persist();
			
			labels = autoLabelService.getAutoLabels(thingTypeAndKind, labelTypeAndKind, numberOfLabels );
		}
		logger.debug("label 0: " + labels.get(0).toJson());
	}
	
	@Test
	@Transactional
	public void testWithKnownParametersMultipleLabels() {
		String thingTypeAndKind = "document_experiment";
		String labelTypeAndKind = "id_codeName";
		Long numberOfLabels = 3L;
		List<AutoLabelDTO> labels = autoLabelService.getAutoLabels(thingTypeAndKind, labelTypeAndKind, numberOfLabels );
		logger.debug("label Count: " + labels.size());
	}
}
