package com.labsynch.labseer.utils;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.ldap.userdetails.LdapUserDetails;
import org.springframework.security.ldap.userdetails.InetOrgPerson;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.labsynch.labseer.domain.Author;
import com.labsynch.labseer.service.AuthorRoleService;
import com.labsynch.labseer.service.AuthorService;

@Service
public class SecurityUtils {

	static Logger logger = LoggerFactory.getLogger(SecurityUtils.class);
	
	@Autowired
    private PropertiesUtilService propertiesUtilService;
	
	@Autowired
    private AuthorRoleService authorRoleService;
	
	@Autowired
    private AuthorService authorService;

	@Transactional
	public void updateAuthorInfo(Authentication authentication) {

		String userName = authentication.getName();

		List<Author> authors = Author.findAuthorsByUserName(userName).getResultList();
		Author author;
		if (authors.size() > 1){
			logger.error("ERROR. Found multiple authors with the same user name");
			author = authors.get(0);
		} else if (authors.size() == 1){
			author = authors.get(0);
		} else {
			author = createAuthor(authentication);
		}
		logger.debug("Updated author: "+author.getUserName());
		if (propertiesUtilService.getSyncLdapAuthRoles()){
			Collection<? extends GrantedAuthority> auths = authentication.getAuthorities();
			Collection<String> grantedAuths = new HashSet<String>();
			for (GrantedAuthority auth : auths){
				grantedAuths.add(auth.getAuthority());
			}
			try{
				author = authorRoleService.syncRoles(author, grantedAuths);
			}catch (Exception e){
				logger.error("Caught error trying to update author roles.",e);
			}
			logger.debug("Finished syncing roles for "+author.getUserName());
		}
		

	}

    private Author createAuthor(Authentication authentication) {

		Object principal = authentication.getPrincipal();

		String principalUserName = null;
		String userDN = null;
		
		Author author = new Author();

		if (principal instanceof InetOrgPerson) {
			InetOrgPerson inetOrgPerson = (InetOrgPerson) principal;
			principalUserName = inetOrgPerson.getUsername();
			logger.debug("username: " + principalUserName);
			String fullName = inetOrgPerson.getCn()[0];
			logger.debug("fullName: " + fullName);
			String [] parts = fullName.split(" ", 2);
			if (parts.length != 2) {
				logger.error("Could not get user first name and last name from cn '" + fullName + "'  Please provide a cn which can be split into first and last name by a space e.g. 'Test User'");
			} 
			String firstName = parts[0];
			String lastName = parts[1];
			author.setUserName(principalUserName);
			author.setFirstName(firstName);
			author.setLastName(lastName);
			author.setEmailAddress(inetOrgPerson.getMail());
			author.setPassword(principalUserName);
			author.setRecordedBy("acas");
			author.setRecordedDate(new Date());
			author.setLsType("default");
			author.setLsKind("default");
			author = authorService.saveAuthor(author);

		} else if (principal instanceof LdapUserDetails) {
			LdapUserDetails ldapPrincipal = (LdapUserDetails) principal;
			principalUserName = ldapPrincipal.getUsername();
			logger.debug("username: " + principalUserName);
			String dn = ldapPrincipal.getDn();
			int beginIndex = dn.indexOf("cn=") + 3;
			int endIndex = dn.indexOf(",");
			String fullName = dn.substring(beginIndex, endIndex);
			logger.debug("fullName: " + fullName);
			String [] parts = fullName.split(" ", 2);
			if (parts.length != 2) {
				logger.error("Could not get user first name and last name from cn '" + fullName + "'  Please provide a cn which can be split into first and last name by a space e.g. 'Test User'");
			}
			String firstName = parts[0];
			String lastName = parts[1];
			author.setUserName(principalUserName);
			author.setFirstName(firstName);
			author.setLastName(lastName);
			author.setEmailAddress(principalUserName);
			author.setPassword(principalUserName);
			author.setRecordedBy("acas");
			author.setRecordedDate(new Date());
			author.setLsType("default");
			author.setLsKind("default");
			author = authorService.saveAuthor(author);

		} else {
			principalUserName = ((User)principal).getUsername();
			logger.info("not LDAP user Name " + principalUserName);
			author.setUserName(principalUserName);
			author.setFirstName(principalUserName);
			author.setLastName(principalUserName);
			author.setEmailAddress(principalUserName);
			author.setPassword(principalUserName);
			author.setRecordedBy("acas");
			author.setRecordedDate(new Date());
			author.setLsType("default");
			author.setLsKind("default");
			author = authorService.saveAuthor(author);
		}
		

		logger.info("just created new user in the database: " + author.toJson());

		return author;
	}

}
