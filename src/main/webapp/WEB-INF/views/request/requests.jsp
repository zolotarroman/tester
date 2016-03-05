<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Requests</title>

  <!-- Bootstrap Core CSS -->
  <link href=<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" /> rel="stylesheet">

  <!-- Custom CSS -->
  <link href=<c:url value="/resources/dist/css/sb-admin-2.css" /> rel="stylesheet">

  <link href=<c:url value="/resources/dist/css/select2.min.css" /> rel="stylesheet" />

  <link href=<c:url value="/resources/dist/css/select2-bootstrap.css" /> rel="stylesheet" />

  <link href=<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" /> rel="stylesheet" >

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
          <!--   <label for="requestsTable">Requests</label> -->
            <a href=<c:url value="/tests/requests/create" /> class="btn btn-success">Create</a>
            <button id="runAll" class="btn btn-info">Run all</button>
            <button id="runSelected" class="btn btn-info">Run selected</button>
            <button id="deleteSelected" class="btn btn-danger">Delete selected</button>
            <form>
            <fieldset>
              <legend>Filters</legend>
              <div class="col-md-3">
                <!-- <label for="applicationFilter">applicationFilter</label> -->
                <select id="applicationFilter" name="applicationFilter" class="form-control input-md select2-multiple" 
                  multiple="multiple" data-placeholder="application filters">
				  <c:forEach items="${applications}" var="application">
					<option value="${application.id}"><c:out value="${application.name}" /></option>
				  </c:forEach>
			    </select>
              </div>
              <div class="col-md-3">
                <!-- <label for="serviceFilter">serviceFilter</label> -->
                <select id="serviceFilter" name="serviceFilter" class="form-control input-md select2-multiple" 
                  multiple="multiple"  data-placeholder="service filters">
                    <c:forEach items="${services}" var="service">
                      <option value="${service.id}"><c:out value="${service.name}" /></option>
                    </c:forEach>
                  </select>
              </div>
              <div class="col-md-3">
                <!-- <label for="labelFilter">labelFilter</label> -->
                <select id="labelFilter" name="labelFilter" class="form-control input-md select2-multiple" 
                  multiple="multiple" data-placeholder="label filters">
                    <c:forEach items="${labels}" var="label">
                      <option value="${label.id}"><c:out value="${label.name}" /></option>
                    </c:forEach>
                  </select>
              </div>
              <div class="col-md-3">
                <button id="resetFilters" class="btn btn-default">Reset</button>
                <input type="submit" class="btn btn-success" value="Filter" />
              </div>
            </fieldset>
           
            </form>
           </div>
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-condensed text-center panel-body" id="requests">
              <thead>
                <tr>
                  <th width="30px"><input id="selectAll" type="checkbox" title="Select all"></th>
                  <th>Name</th>
                  <th>Application</th>
                  <th>Service</th>
                  <th>Endpoint</th>
                  <th width="45px">Run</th>
                  <th width="90px">See results</th>
                  <th width="80px">Duplicate</th>
                  <th width="70px">Disable</th>
                  <th width="60px">Delete</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${requests}" var="request">
                  <tr class="dataRow">
                    <td>
                      <input id="${request.id}" type="checkbox" name="operateSelect">
                    </td>
                    <td>
                      <a href=<c:url value="/tests/requests/${request.id}" />>
                      <c:out value="${request.name}" />
                      </a>
                    </td>
                    <td>
                      <c:out value="${request.application.name}" />
                    </td>
                    <td>
                      <c:out value="${request.service.name}" />
                    </td>
                    <td title="${request.endpoint}">
                      <c:out value="${request.endpoint}" />
                    </td>
                    <td><a id="${request.id}" class="run"><i class="fa fa-play"></i></a></td>
                    <td><a href=<c:url value="/results/requests/${request.id}" />>results</a>
                    </td>
                    <td><a href=<c:url value="/tests/requests/create?fromId=${request.id}" />>
                      <i class="fa fa-copy fa-lg"></i></a>
                    </td>
                    <td><input id=<c:out value="${request.id}" /> type="checkbox" name="disableSelect"></td>
                    <td><a id="${request.id}" class="removeInstance"><i class="fa fa-trash fa-lg"></i></a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <input id="requestsToSend" type="hidden" />

  <div class="modal fade" id="environmentModal" tabindex="-1" role="dialog" aria-labelledby="environmentModalLabel">
    <div class="modal-dialog modal-sm" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="environmentModalLabel">Select environment</h4>
        </div>
        <div class="modal-body">
          <select id="environment" class="form-control">
          <c:forEach items="${environments}" var="environment">
            <option value="${environment.id}"><c:out value="${environment.name}" /></option>
          </c:forEach>
        </select>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" id="confirmEnvironmentModal" class="btn btn-primary">Start</button>
        </div>
      </div>
    </div>
  </div>


  <script src=<c:url value="/resources/bower_components/jquery/dist/jquery.min.js" />></script>

  <script src=<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js" />></script>

  <script src=<c:url value="/resources/dist/js/select2.min.js" />></script>

  <!-- Main page script -->
  <script src=<c:url value="/resources/js/requests.js" />></script>

</body>

</html>