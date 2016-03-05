<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
	<title>application_modify</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet"  type='text/css' media='all'>
	
	<!-- Custom CSS -->
	<link href="<c:url value="/resources/dist/css/sb-admin-2.css" />" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link
	  href="/resources/bower_components/font-awesome/css/font-awesome.css"
	  rel="stylesheet">
	
	  <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->

<style type="text/css">
th {
  text-align: center;
}

.row {
  margin: 3px;
}
</style>

</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading"><h3>Application Modify</h3></div>
          <div class="panel body">
            <div class="row"></div>
          <form:form cssClass="form-horizontal" action="" method="POST" modelAttribute="application">
          <div class="form-group">
          	<form:label path="name" cssClass="col-sm-2 control-label">Name:</form:label>
              <div class="col-sm-8">
              <form:input cssClass="form-control" path="name"/>
              <form:errors path="name" cssClass="help-block with-errors" />
            </div>
          </div>
        <div class="form-group">
		  <form:label path="description" cssClass="col-sm-2 control-label">Description:</form:label>
            <div class="col-sm-8">
              <form:input cssClass="form-control" path="description"/>
              <form:errors path="description" cssClass="help-block with-errors" />
            </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-success">Save</button> 
            <button type="submit" class="btn btn-info">Reset</button>
            <button type="submit" class="btn btn-danger">Cancel</button>
          </div>
        </div>
        </form:form>

      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>
