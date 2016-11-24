<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-canche">
<meta http-equiv="Cahe-Control" content="no-canche">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/style.css">
<title>Boot Sample | Home</title>
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Task</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">Manage Task</a></li>
					<li><a href="all-tasks">All tasks</a></li>
				</ul>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${mode == 'MODE_HOME' }">
			<div class="container">
				<div class="jumbotrom text-center" id="homeDiv">
					<h1>Welcome </h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				</hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Date created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${task.dateCreated}" /></td>
									<td>${task.finished ==true?'YES':'NO'}</td>
									<td><a href="update-task?id=${task.id}"> <span
											class="glyphicon glyphicon-pencil"></span>
									</a></td>
									<td><a href="delete-task?id=${task.id}"> <span
											class="glyphicon glyphicon-trash"></span>
									</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_NEW' || mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr />
				<form class="form-horizontal" method="post" action="save-task">
				<input type="hidden" name="id" value="${task.id }"/>
				
				<div class="form-group"> 
				<label class="control-label col-md-3">Name: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="name" value="${task.name }"/>
				</div>
			</div>
			<div class="form-group"> 
				<label class="control-label col-md-3">Description: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="description" value="${task.description}"/>
				</div>
			</div>
			<div class="form-group"> 
				<label class="control-label col-md-3">Finished: </label>
				<div class="col-md-7">
				<input type="radio" class="col-sm-1" name="finished" value="true"/>
				<div class="col-sm-1">YES</div>
				<input type="radio" class="col-sm-1" name="finished" value="false" checked="checked"/>
				<div class="col-sm-1">NO</div>
				</div>
			</div>
			<div class="form-group">
			<input type="submit" class="btn btn-prymary" value="Save"/>
			</div>
				</form>
			</div>
		</c:when>
</c:choose>
	
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
</body>

</html>