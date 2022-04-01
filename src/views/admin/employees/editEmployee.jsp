<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DriveGo</title>
    <%@include file="../../dynamic/baseCss.jspf" %>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href='<c:url value="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>'>
    <!-- Font Awesome -->
    <link rel="stylesheet" href='<c:url value="../../plugins/fontawesome-free/css/all.min.css"/>'>
    <!-- Theme style -->
    <link rel="stylesheet" href='<c:url value="../../dist/css/adminlte.min.css"/>'>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@include file="../../dynamic/Sidebar.jspf" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-2">
                        <h1>Edytuj pracownika</h1>
                    </div>
                    <div class="col-sm-10">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">General Form</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="container-fluid">

                <div class="row">
                    <!-- left column -->
                    <div class="col-xl-6 col-md-6 mb-6">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header py-3">
                                <h3 class="card-title">Dane pracownika</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post"
                                  action='<c:url value="/employees/edit/${employee.id}"/>'>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Imię</label>
                                            <input class="form-control form-control-sm" type="text" name="firstName"
                                                   value=${employee.firstName}>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Nazwisko</label>
                                            <input class="form-control form-control-sm" type="text" name="lastName"
                                                   value=${employee.lastName}>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Stanowisko</label>

                                            <input class="form-control form-control-sm" type="text" name="position"
                                                   value="stanowisko-todo">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Data urodzenia</label>
                                            <input class="form-control form-control-sm" type="date" name="birthDate"
                                                   value=${employee.birthDate}>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Email</label>

                                            <input class="form-control form-control-sm" type="text" name="email"
                                                   value=${employee.email}>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Telefon:</label>
                                            <input class="form-control form-control-sm" type="text" name="phoneNumber"
                                                   value=${employee.phoneNumber}>
                                        </div>
                                    </div>
                                </div>

                        </div>
                    </div>

                    <div class="col-xl-6 col-md-6 mb-6">
                        <div class="card card-primary">
                            <div class="card-header py-3">
                                <h3 class="card-title">Dane szkoły</h3>
                            </div>

                            <div class="card-body">

                                <div class="form-group row">

                                    <div class="col-sm-12">
                                        <!-- select -->
                                        <div class="form-group">
                                            <label>Miasto</label>
                                            <select class="form-control">
                                                <option>Poznań</option>
                                                <option>Wrocław</option>
                                                <option>Gdańsk</option>
                                                <option>Lublin</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Oddział</label>
                                            <select class="form-control" disabled>
                                                <option>POZ</option>
                                                <option>WRO</option>
                                                <option>GDN</option>
                                                <option>LUB</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                </div>
                            </div>
                        </div>

                        <!-- /.card-body -->
                    </div>

                </div>

                <input class="mb-2 btn btn-primary pull-left" type="submit" value="Zapisz" id="searchButton">
                </form>

<%--                <form method="post" action='<c:url value="/employees/delete/${employee.id}"/>'>--%>
<%--                <input class="mb-2 btn btn-warning" type="submit" value="Usuń" id="searchButton2">--%>
<%--                </form>--%>
                <button type="button" class="mb-2 btn btn-danger" data-toggle="modal" data-target="#deleteModal">Usuń</button>
                <button type="button" class="mb-2 btn btn-warning" data-toggle="modal" data-target="#cancelModal">Anuluj</button>

                <!-- Cancel Modal -->
                <div class="modal" id="cancelModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Cancel Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Czy na pewno anulować?</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>


                            <!-- Cancel Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Nie</button>
                                <a style="text-decoration: none" href='<c:url value="/employees/employeesList"/>'>
                                    <button type="submit" class="btn btn-danger pull-left">Tak</button>
                                </a>
                            </div>

                        </div>

                    </div>
                </div>

                <!-- Delete Modal -->
                <div class="modal" id="deleteModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Delete Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Czy na pewno chcesz usunąć?</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Delete Modal footer -->


                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Nie</button>
                                <form method="post" action='<c:url value="/employees/delete/${employee.id}"/>'>
                                    <input class="btn btn-danger" type="submit" value="Tak" id="searchButton2">
                                </form>
                                <%--                                <a style="text-decoration: none" href='<c:url value="/employees/employeesList"/>'>--%>
<%--                                    <button type="submit" class="btn btn-danger pull-left">Tak</button>--%>
<%--                                </a>--%>
                            </div>

                        </div>

                    </div>
                </div>

            </div>

        </section>
    </div>
    <!-- /.content -->
    <!-- /.content-wrapper -->
    <%@include file="../../dynamic/footer.jspf" %>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src='<c:url value="/resources/plugins/jquery/jquery.min.js"/>'></script>
<!-- Bootstrap 4 -->
<script src='<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"/>'></script>
<!-- bs-custom-file-input -->
<script src='<c:url value="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"/>'></script>
<!-- AdminLTE App -->
<script src='<c:url value="/resources/dist/js/adminlte.min.js"/>'></script>
<!-- Page specific script -->
<script>
    $(function () {
        bsCustomFileInput.init();
    });
</script>
</body>
</html>
