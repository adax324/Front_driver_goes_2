<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DriverGoes tworzenie użytkownika</title>
  <%@include file="../../dynamic/baseCss.jspf"%>

  
  
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <span  class="h1"><b>Driver</b>Goes</span>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Tworzenie nowego użytkownika</p>

      <form:form action='/user/signup' modelAttribute="user">
        <div class="input-group mb-3">
          <form:input path="name" type="text" class="form-control" placeholder="Imię i nazwisko"/>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <form:input path="password" type="password" class="form-control" placeholder="Hasło"/>


          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-12">
            <div class="form-group text-red">
              <form:errors path="password" cssClass="error"/>
              <form:errors path="role" cssClass="error"/>
              <form:errors path="name" cssClass="error"/>
            </div>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-12">
            <div class="form-group">
              <form:select path="role" class="form-control">
                <option hidden>Wybierz typ konta</option>
                <option value="admin">Admin</option>
                <option value="student">Student</option>
              </form:select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Rejestruj</button>
          </div>
          <!-- /.col -->
        </div>
      </form:form>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<%@include file="../../dynamic/baseJavascript.jspf"%>
</body>
</html>
