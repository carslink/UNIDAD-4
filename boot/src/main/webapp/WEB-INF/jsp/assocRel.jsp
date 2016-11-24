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
			<a href="/" class="navbar-brand">Assoc_rels</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-assoc_rel">Manage Assoc_rel</a></li>
					<li><a href="all-assocRels">All Assoc_rels</a></li>
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
		<c:when test="${mode == 'MODE_ASSOCRELS' }">
			<div class="container text-center" id="assoc_relsDiv">
				<h3>My Assoc_rels</h3>
				</hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>From_id</th>
								<th>To_id</th>
								<th>Relationship_type_id</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="assoc_rel" items="${assoc_rels}">
								<tr>
									<td>${assoc_rel.id}</td>
									<td>${assoc_rel.fromId}</td>
									<td>${assoc_rel.toId}</td>
									<td>${assoc_rel.relationshipTypeId}</td>
									<td><a href="update-assoc_rel?id=${assoc_rel.id}"> <span
											class="glyphicon glyphicon-pencil"></span>
									</a></td>
									<td><a href="delete-assoc_rel?id=${assoc_rel.id}"> <span
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
				<h3>Manage Assoc_rel</h3>
				<hr />
				<form class="form-horizontal" method="post" action="save-assoc_rel">
				<input type="hidden" name="id" value="${assoc_rel.id }"/>
				
				<div class="form-group"> 
				<label class="control-label col-md-3">From_id: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="fromId" value="${assoc_rel.fromId }"/>
				</div>
			</div>
			<div class="form-group"> 
				<label class="control-label col-md-3">To_id: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="toId" value="${assoc_rel.toId}"/>
				</div>
			</div>
			<div class="form-group"> 
				<label class="control-label col-md-3">RelationshipTypeId: </label>
				<div class="col-md-7">
				<input type="text" class="form-control" name="relationshipTypeId" value="${assoc_rel.relationshipTypeId}"/>
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