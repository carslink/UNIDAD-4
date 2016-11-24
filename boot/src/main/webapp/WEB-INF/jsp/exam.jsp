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
			<a href="/" class="navbar-brand">Exam</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-exam">Manage Exam</a></li>
					<li><a href="all-exams">All Exams</a></li>
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
	
		<c:when test="${mode == 'MODE_EXAMS' }">
			<div class="container text-center" id="examsDiv">
				<h3>My Exams</h3>
				</hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Result</th>
								<th>Date application</th>
								<th>Reprobate</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="exam" items="${exams}">
								<tr>
									<td>${exam.id}</td>
									<td>${exam.title}</td>
									<td>${exam.result}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${exam.dateApplication}" /></td>
									<td>${exam.reprobate ==true?'YES':'NO'}</td>
									<td><a href="update-exam?id=${exam.id}"> <span
											class="glyphicon glyphicon-pencil"></span>
									</a></td>
									<td><a href="delete-exam?id=${exam.id}"> <span
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
				<h3>Manage Exam</h3>
				<hr />
				<form class="form-horizontal" method="post" action="save-exam">
				<input type="hidden" name="id" value="${exam.id }"/>
				
				<div class="form-group"> 
				<label class="control-label col-md-3">Title: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="title" value="${exam.title }"/>
				</div>
			</div>
			<div class="form-group"> 
				<label class="control-label col-md-3">Result: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="result" value="${exam.result}"/>
				</div>
			</div>
			<div class="form-group"> 
				<label class="control-label col-md-3">Reprobate: </label>
				<div class="col-md-7">
				<input type="radio" class="col-sm-1" name="reprobate" value="true"/>
				<div class="col-sm-1">YES</div>
				<input type="radio" class="col-sm-1" name="reprobate" value="false" checked="checked"/>
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