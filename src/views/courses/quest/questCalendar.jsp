<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Kalendarz</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>'>
  <!-- Font Awesome -->

  <link rel="stylesheet" href='<c:url value="/resources/plugins/fontawesome-free/css/all.min.css"/>'>
  <!-- fullCalendar -->
  <link rel="stylesheet" href='<c:url value="/resources/plugins/fullcalendar/main.css"/>'>
  <!-- Theme style -->
  <link rel="stylesheet" href='<c:url value="/resources/dist/css/adminlte.min.css"/>'>
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
            <h1>Moja chora jazda</h1>
          </div>
          
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Zadania</h4>
                </div>
                <div class="card-body">
                  <!-- the events -->
                  
                    <div class="row">
                      <h3 class="bg-success w-100 text-center form-control">Zajęcia teoretyczne</h3>
                    </div>
                    <div class="row">
                      <h3 class="bg-warning w-100 text-center form-control">Zajęcia praktyczne</h3>
                    </div>
                    <div class="row">
                      <h3 class="bg-info w-100 text-center form-control">Zadanie domowe</h3>
                    </div>
                    
                    
                </div>
                <!-- /.card-body -->
              </div>
              
              
            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 0.1
    </div>
    <strong>Copyright &copy; 2021 <a href="https://adminlte.io">DriveGo</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->

<script src='<c:url value="/resources/plugins/jquery/jquery.min.js"/>'></script>
<!-- Bootstrap -->
<script src='<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"/>'></script>
<!-- jQuery UI -->
<script src='<c:url value="/resources/plugins/jquery-ui/jquery-ui.min.js"/>'></script>
<!-- AdminLTE App -->
<script src='<c:url value="/resources/dist/js/adminlte.min.js"/>'></script>
<!-- fullCalendar 2.2.5 -->
<script src='<c:url value="/resources/plugins/moment/moment.min.js"/>'></script>
<script src='<c:url value="/resources/plugins/fullcalendar/main.js"/>'></script>
<!-- AdminLTE for demo purposes -->
<script src='<c:url value="/resources/dist/js/demo.js"/>'></script>
<!-- Page specific script -->
<script>
  $(function () {

    

    

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [{
        title: 'Praktyka Nazwisko',
        start: '2021-09-26 12:00:00'
      }],
      editable  : false,
      droppable : false // this allows things to be dropped onto the calendar !!!
      
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

     

      // Remove event from text input
      $('#new-event').val('')
    })
  })
</script>
</body>
</html>
