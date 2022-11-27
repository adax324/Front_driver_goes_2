<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <jsp:useBean id="now" class="java.util.Date" />
    <%@ page contentType="text/html; charset=UTF-8" %>

      <!DOCTYPE html>
      <html lang="pl-PL">

      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DriverGoes</title>
        <%@include file="../../dynamic/baseCss.jspf" %>
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
                      <h1>Nowe Zadanie</h1>
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
                          <h3 class="card-title">Dane:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form method="post" action='<c:url value="/quests/edit/${questToEdit.questId}"/>'>
                          <div class="card-body">
                            <div class="form-group row">
                              <div class="col-12">
                                <div class="form-group">
                                  <label>Kursant</label>
                                  <select class="form-control" name="student.id">
                                    <option hidden value="${questToEdit.student.id}">${questToEdit.student.firstName}
                                      ${questToEdit.student.lastName}</option>
                                    <c:forEach items="${students}" var="student">
                                      <option value="${student.id}">${student.firstName} ${student.lastName}</option>
                                    </c:forEach>
                                  </select>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row">
                              <div class="col-12">
                                <div class="form-group">
                                  <label>Rodzaj zajęć</label>
                                  <select class="form-control" name="questType">
                                    <option hidden value="${questToEdit.questType}">
                                      <c:if test="${questToEdit.questType.equals('theory')}">
                                        Zajęcia Teoretyczne
                                      </c:if>
                                      <c:if test="${questToEdit.questType.equals('practice')}">
                                        Zajęcia Praktyczne
                                      </c:if>
                                      <c:if test="${questToEdit.questType.equals('theoryTest')}">
                                        Teoria Test
                                      </c:if>
                                      <c:if test="${questToEdit.questType.equals('practiceTest')}">
                                        Praktyka Test
                                      </c:if>
                                      <c:if test="${questToEdit.questType.equals('homework')}">
                                        Zadanie Domowe
                                      </c:if>
                                    </option>
                                    <option value="theory">Zajęcia teoretyczne</option>
                                    <option value="practice">Zajęcia praktyczne</option>
                                    <option value="theoryTest">Egzamin wewnętrzny teoretyczny</option>
                                    <option value="practiceTest">Egzamin wewnętrzny praktyczny</option>
                                    <option value="homework">Zadanie domowe</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                            <div class="form-group row">
                              <div class="col-12">
                                <div class="form-group">
                                  <label>Termin</label>
                                  <input type="date" class="form-control" name="date" value="${questToEdit.date}">
                                </div>
                              </div>

                            </div>
                            <div class="form-group row">
                              <div class="col-12">
                                <div class="form-group">
                                  <label>Godzina</label>
                                  <input type="time" class="form-control" name="time" value="${questToEdit.time}">
                                </div>
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
                                <select class="form-control" id="citySelect" disabled>

                                  <option value="${questToEdit.department.departmentCityLocation.cityId}" selected>
                                    ${questToEdit.department.departmentCityLocation.cityName}
                                  </option>


                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="form-group row">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label>Oddział</label>
                                <select class="form-control" disabled>
                                  <option selected>
                                    ${questToEdit.department.departmentCode}
                                  </option>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="form-group row">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label>Instruktor</label>
                                <select class="form-control" name="instructor.id">
                                  <option hidden value="${questToEdit.instructor.id}">
                                    ${questToEdit.instructor.firstName} ${questToEdit.instructor.lastName}</option>
                                  <c:forEach items="${instructors}" var="instructor">
                                    <option value="${instructor.id}">
                                      ${instructor.firstName} ${instructor.lastName}
                                    </option>
                                  </c:forEach>
                                </select>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- /.card-body -->
                    </div>

                  </div>
                  <div class="row mb-2">
                    <div class="col-2">
                      <input class="btn btn-success btn-block mr-1" type="submit" value="Zapisz" id="searchButton">
                      </form>
                    </div>
                    <div class="col-2">
                      <button type="button" class="btn btn-secondary btn-block" data-toggle="modal"
                        data-target="#myModal">
                        Wstecz
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
                              <a style="text-decoration: none" href='<c:url value="/quests/list"/>'><button
                                  type="submit" class="btn btn-danger pull-left">Tak</button></a>
                            </div>

                          </div>

                        </div>
                      </div>
                    </div>


                  </div>
                  <div class="row mb-2">
                    <div class="col-4">
                      <form method="post" action=<c:url value="/quests/delete/${questToEdit.questId}" />>
                      <button class="btn btn-danger btn-block" type="modal" data-target="#deleteModal">Usuń</button>
                      <div class="modal" id="deleteModal">
                        <div class="modal-dialog">
                          <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">Czy na pewno chcesz usunąć?</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>


                            <!-- Modal footer -->
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-dismiss="modal">Nie</button>
                              <button
                                  type="submit" class="btn btn-danger pull-left">Tak</button>
                            </div>

                          </div>

                        </div>
                      </div>
                      </form>
                    </div>
                  </div>


                </div>

              </section>
            </div>

            <!-- /.content -->

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