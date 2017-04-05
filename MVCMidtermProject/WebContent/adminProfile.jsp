<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Account</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="profile.css">
</head>
<body>

	<div class="container">
		<h1>frugal</h1>
		<h2>Admin Dashboard</h2>
		<div class="row" id="accounts">
			<div class="col-sm-2"></div>
			<div class="col-sm-4 text-center">
				<div class="panel panel-default">
					<div class="panel-heading">Family Frugal Account</div>
					<div class="panel-body">
					$<fmt:formatNumber type="number" minFractionDigits="2" value="${member.account.frugalSum}"/>
					</div>
				</div>
			</div>
			<div class="col-sm-4 text-center">
				<div class="panel panel-default">
					<div class="panel-heading">Personal Account</div>
					<div class="panel-body">
					$<fmt:formatNumber type="number" minFractionDigits="2" value="${member.account.bankAccount}"/>
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

	<div class="container">
		<h2>Family Bills</h2>
		<table class="table-hover table-responsive">
			<thead>
				<tr>
					<th>Name</th>
					<th>Amount</th>
					<th>Date Due</th>
					<th>Date Paid</th>
					<th>Percent</th>
					<th colspan="3">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bill" items="${member.family.bills}">
					<tr>
						<c:forEach var="br" items="${bill.billResponsibilities}">
							<c:if test="${br.member.id == member.id}">
								<td class="spacing">${bill.name}</td>
								<td class="spacing">
								$<fmt:formatNumber type="number" minFractionDigits="2" value="${bill.amount}"/>
								</td>
								<td class="spacing">${bill.dateDue}</td>
								<td class="spacing">${bill.datePaid}</td>
								<td class="spacing">${br.percent}%</td>
								<td class="editButton"><form action="EditBillForm.do"
										method="POST">
										<button type="submit" name="id" value="${bill.id}"
											class="btn btn-sm btn-warning">Edit</button>
									</form></td>
								<td class="deleteButton"><form action="DeleteAdminBill.do"
										method="POST">
										<button type="submit" name="deleteid" value="${bill.id}"
											class="btn btn-sm btn-danger">Delete</button>
									</form></td>
								<td class="paidButton"><form action="PayBill.do"
										method="POST">
										<button type="submit" name="payid" value="${bill.id}"
											class="btn btn-sm btn-success">pay</button>
									</form></td>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div id="addBillButton">
				<form action="AddFamilyBillForm.do" method="POST">
					<button type="submit" name="addid"
						class="btn btn-md btn-primary btn-block">Add Family
						Bill</button>
				</form>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>

	<div class="container">
		<h2>Your Bills</h2>
		<table class="table-hover table-responsive">
			<thead>
				<tr>
					<th>Name</th>
					<th>Amount</th>
					<th>Date Due</th>
					<th>Date Paid</th>
					<th colspan="3">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bill" items="${member.bills}">
					<tr>
						<td class="spacing">${bill.name}</td>
						<td class="spacing">
						$<fmt:formatNumber type="number" minFractionDigits="2" value="${bill.amount}"/>
						</td>
						<td class="spacing">${bill.dateDue}</td>
						<td class="spacing">${bill.datePaid}</td>
						<td class="editButton"><form action="EditBillForm.do"
								method="POST">
								<button type="submit" name="id" value="${bill.id}"
									class="btn btn-sm btn-warning">Edit</button>
							</form></td>
						<td class="deleteButton"><form action="DeleteBill.do"
								method="POST">
								<button type="submit" name="deleteid" value="${bill.id}"
									class="btn btn-sm btn-danger">Delete</button>
							</form></td>
						<td class="paidButton"><form action="PayBill.do"
								method="POST">
								<button type="submit" name="id" value="${bill.id}"
									class="btn btn-sm btn-success">pay</button>
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div id="addBillButton">
				<form action="AddBillForm.do" method="POST">
					<button type="submit" name="id"
						class="btn btn-md btn-primary btn-block">Add Personal
						Bill</button>
				</form>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>

</body>
</html>