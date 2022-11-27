<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pl-PL">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Szkoła jazdy | Lista Kursantów</title>
    <%@include file="../../dynamic/baseCss.jspf" %>
    <!-- DataTables -->
    <link rel="stylesheet" href='<c:url value="/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>'>
    <link rel="stylesheet"
          href='<c:url value="/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>'>
    <link rel="stylesheet"
          href='<c:url value="/resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>'>
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
                    <div class="col-sm-6">
                        <h1>Zajęcia</h1>
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

                            <!-- /.card-header -->

                            <div class="card-body">
                                <div class="row">
                                    <div class=" mb-2 col-sm-2 col-md-2">
                                        <a href='<c:url value="/quests/city"/>' class="btn btn-success">+ Dodaj
                                            lekcję</a>
                                    </div>
                                </div>

                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Student</th>
                                        <th>Instruktor</th>
                                        <th>Typ zajęć</th>
                                        <th>Data</th>
                                        <th>Godzina</th>
                                        <th>Oddział</th>
                                        <th>Edycja</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${quests}" var="quest">
                                        <tr>
                                            <td>
                                                    ${quest.student.firstName} ${quest.student.lastName}
                                            </td>
                                            <td>
                                                    ${quest.instructor.firstName} ${quest.instructor.lastName}
                                            </td>
                                            <td>
                                                <c:if test="${quest.questType.equals('theory')}">
                                                    Zajęcia Teoretyczne
                                                </c:if>
                                                <c:if test="${quest.questType.equals('practice')}">
                                                    Zajęcia Praktyczne
                                                </c:if>
                                                <c:if test="${quest.questType.equals('theoryTest')}">
                                                    Teoria Test
                                                </c:if>
                                                <c:if test="${quest.questType.equals('practiceTest')}">
                                                    Praktyka Test
                                                </c:if>
                                                <c:if test="${quest.questType.equals('homework')}">
                                                    Zadanie Domowe
                                                </c:if>
                                            </td>
                                            <td>
                                                    ${quest.date}
                                            </td>
                                            <td>
                                                    ${quest.time}
                                            </td>
                                            <td>
                                                    ${quest.department.departmentCode}
                                            </td>
                                            <td>
                                                <a style="text-decoration: none"
                                                   href='<c:url value="/quests/edit/${quest.questId}"/>'>
                                                    <button class="btn btn-sm btn-secondary btn-block">
                                                        Edytuj
                                                    </button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Student</th>
                                        <th>Instruktor</th>
                                        <th>Typ zajęć</th>
                                        <th>Data</th>
                                        <th>Godzina</th>
                                        <th>Oddział</th>
                                        <th>Edycja</th>
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
    <%@include file="../../dynamic/footer.jspf" %>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


<%@include file="../../dynamic/baseJavascript.jspf" %>
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
