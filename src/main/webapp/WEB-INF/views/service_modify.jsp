<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
<title>service_modify</title>

<!-- Bootstrap Core CSS -->
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
  rel="stylesheet " type='text/css' media='all'>

<!-- Custom CSS -->
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
  href="resources/bower_components/font-awesome/css/font-awesome.css"
  rel="stylesheet">

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
            <div class="panel-heading"><h3>Service Modify</h3></div>
          <div class="panel body">
            <div class="row"></div>
          <form class="form-horizontal">
          <div class="form-group">
            <label for="applicationName" class="col-sm-2 control-label">Name</label>
              <div class="col-sm-8">
              <input type="text" class="form-control" id="AppName" placeholder="Name">
            </div>
          </div>
        <div class="form-group">
          <label for="applicationDescription" class="col-sm-2 control-label">Description</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="pass" placeholder="Description">
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
        </form>

      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>
