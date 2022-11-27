<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Szkoła jazdy | Lista Kursantów</title>
  <%@include file="../../dynamic/baseCss.jspf"%>


  <!-- DataTables -->
  <link rel="stylesheet" href='<c:url value="/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>'>
  <link rel="stylesheet" href='<c:url value="/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>'>
  <link rel="stylesheet" href='<c:url value="/resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>'>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%@include file="../../dynamic/Sidebar.jspf"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Grupy</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Strona główna</a></li>
              <li class="breadcrumb-item active">Uprawnienia</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            
            <!-- /.card -->

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Uprawnienia </h3>
              </div>
              <!-- /.card-header -->
              
              <div class="card-body">
                <div class="row">
                  <div class = " mb-2 col-sm-2 col-md-2">                    
                    <a href='<c:url value="/user/signup"/>' class="btn btn-success">+ Dodaj nowego użytkownika</a>
                  </div>
                </div>
               
               
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Nazwa</th>
                    <th>Grupa nadrzędna</th>

                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>Administrator ROCKY</td>
                    <td>Administrator ROCKY</td>
                  </tr>
                  <tr>
                    <td>Właściciel</td>
                    <td>Administrator ROCKY</td>
                  </tr>
                  <tr>
                    <td>Kierownik oddziału</td>
                    <td>Właściciel</td>
                  </tr>
                  <tr>
                    <td>Instruktor</td>
                    <td>Kierownik oddziału</td>
                  </tr>
                  <tr>
                    <td>Student</td>
                    <td>Instruktor</td>
                  </tr>

                  </tbody>
                  <tfoot>
                    <tr>
                      <th>Nazwa</th>
                      <th>Grupa nadrzędna</th>

                    </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="../../dynamic/footer.jspf"%>


</div>
<!-- ./wrapper -->

<%@include file="../../dynamic/baseJavascript.jspf"%>
<!-- DataTables  & Plugins -->
<%@include file="../../dynamic/dataTableScripts.jspf"%>


<!-- Page specific script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>
