package com.softserve.webtester.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.validator.constraints.NotBlank;

/**
 * The DbValidation class represents {@code DbValidation} entity stored in the database.
 * 
 * @author Taras Oglabyak
 * @version 3.4
 */
public class DbValidation implements Serializable {

    private static final long serialVersionUID = 185946295991598992L;
    
    private int id;
    
    @NotBlank(message="dbValidation sqlQuery cannot be empty")
    private String sqlQuery;
    
    @NotBlank(message="dbValidation expectedValue cannot be empty")
    private String expectedValue;
    private Request request;

    public DbValidation() { }

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public String getSqlQuery() {
	return sqlQuery;
    }

    public void setSqlQuery(String sqlQuery) {
	this.sqlQuery = sqlQuery;
    }

    public String getExpectedValue() {
	return expectedValue;
    }

    public void setExpectedValue(String expectedValue) {
	this.expectedValue = expectedValue;
    }

    public Request getRequest() {
	return request;
    }

    public void setRequest(Request request) {
	this.request = request;
    }

    @Override
    public int hashCode() {
	return HashCodeBuilder.reflectionHashCode(this, true);
    }

    @Override
    public boolean equals(Object obj) {
	return EqualsBuilder.reflectionEquals(this, obj);
    }
    
    @Override
    public String toString() {
	return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}