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
                        <h1>Nowy pracownik</h1>
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
                    <div class="col-xl-4 col-md-4 mb-4">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header py-3">
                                <h3 class="card-title">Dane pracownika</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post"
                                  action='<c:url value="/employees/add"/>'>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Imię</label>
                                            <input class="form-control form-control-sm" type="text" name="firstName"
                                                   placeholder="Imię...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Nazwisko</label>
                                            <input class="form-control form-control-sm" type="text" name="lastName"
                                                   placeholder="Nazwisko...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Stanowisko</label>

                                            <input class="form-control form-control-sm" type="text" name="position"
                                                   placeholder="Stanowisko...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Data urodzenia</label>
                                            <input class="form-control form-control-sm" type="date" name="birthDate"
                                                   placeholder="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Email</label>

                                            <input class="form-control form-control-sm" type="text" name="email"
                                                   placeholder="Email...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Telefon:</label>
                                            <input class="form-control form-control-sm" type="text" name="phoneNumber"
                                                   placeholder="Numer telefonu...">
                                        </div>
                                    </div>
                                </div>

                        </div>
                    </div>

                    <div class="col-xl-4 col-md-4 mb-4">
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
                                                <c:forEach items="${cities}" var="city">
                                                    <option>${city.cityName}</option>
                                                </c:forEach>
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

                            </div>
                        </div>
                    </div>
                </div>
                     <!-- zamyka dane szkoly -->

                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card card-primary">
                                <div class="card-header py-3">
                                    <h3 class="card-title">Uprawnienia instruktora</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group-row">
                                        <div class="col-sm-12">
                                            Szkoli w zakresie kategorii:
                                        </div>
                                    </div>
                                    <div class="form-group-row">
                                        <div class="col-sm-12">
                                            <label class="custom-checkbox" for="categoryA">A:</label>
                                            <input type="checkbox" id="categoryA">
                                            <label class="custom-checkbox" for="categoryA1">A1:</label>
                                            <input type="checkbox" id="categoryA1">
                                            <label class="custom-checkbox" for="categoryA2">A2:</label>
                                            <input type="checkbox" id="categoryA2">
                                            <label class="custom-checkbox" for="categoryAM">AM:</label>
                                            <input type="checkbox" id="categoryAM">
                                        </div>
                                    </div>

                                    <div class="form-group-row">
                                        <div class="col-sm-12">
                                            <label class="custom-checkbox" for="categoryB">B:</label>
                                            <input type="checkbox" id="categoryB">
                                            <label class="custom-checkbox" for="categoryB1">B1:</label>
                                            <input type="checkbox" id="categoryB1">
                                            <label class="custom-checkbox" for="categoryBE">BE:</label>
                                            <input type="checkbox" id="categoryBE">
                                        </div>
                                    </div>
                                    <div class="form-group-row">
                                        <div class="col-sm-12">
                                            <label class="custom-checkbox" for="categoryC">C:</label>
                                            <input type="checkbox" id="categoryC">
                                            <label class="custom-checkbox" for="categoryC1">C1:</label>
                                            <input type="checkbox" id="categoryC1">
                                            <label class="custom-checkbox" for="categoryCE">CE:</label>
                                            <input type="checkbox" id="categoryCE">
                                            <label class="custom-checkbox" for="categoryC1E">C1E:</label>
                                            <input type="checkbox" id="categoryC1E">
                                        </div>
                                    </div>
                                    <div class="form-group-row">
                                        <div class="col-sm-12">
                                            <label class="custom-checkbox" for="categoryD">D:</label>
                                            <input type="checkbox" id="categoryD">
                                            <label class="custom-checkbox" for="categoryD1">D1:</label>
                                            <input type="checkbox" id="categoryD1">
                                            <label class="custom-checkbox" for="categoryDE">DE:</label>
                                            <input type="checkbox" id="categoryDE">
                                            <label class="custom-checkbox" for="categoryD1E">D1E:</label>
                                            <input type="checkbox" id="categoryD1E">
                                        </div>
                                    </div>
                                    <div class="form-group-row">
                                        <div class="col-sm-12">
                                            <label class="custom-checkbox" for="categoryT">T:</label>
                                            <input type="checkbox" id="categoryT">

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>Numer licencji:</label>
                                            <input class="form-control form-control-sm" type="text" name="licenseNumber"
                                                   placeholder="Numer licencji...">
                                        </div>
                                    </div>

                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!--/.card card-primary -->
                        </div>






                <input class="mb-2 btn btn-success pull-left" type="submit" value="Dodaj" id="searchButton">
                </form>
                <button type="button" class=" mb-2 btn btn-danger" data-toggle="modal" data-target="#myModal">Anuluj
                </button>


                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Czy na pewno anulować?</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>


                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Nie</button>
                                <a style="text-decoration: none" href='<c:url value="/employees/employeesList"/>'>
                                    <button type="submit" class="btn btn-danger pull-left">Tak</button>
                                </a>
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
