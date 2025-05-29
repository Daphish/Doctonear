import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/singleton.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleDoctor extends StatefulWidget {
  const ScheduleDoctor({super.key});

  @override
  State<ScheduleDoctor> createState() => _ScheduleDoctorState();
}

class _ScheduleDoctorState extends State<ScheduleDoctor> {
  final Singleton singleton = Singleton();
  bool isLoading = true;
  List<Meeting> _appointments = [];
  CalendarView _calendarView = CalendarView.week; // VISTA POR SEMANA

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final citas = await singleton.getAppointmentsForDoctor(user.uid);

      _appointments = citas.map((cita) {
        final DateTime start = (cita['Inicio'] as Timestamp).toDate();
        final DateTime end = (cita['Final'] as Timestamp).toDate();
        final String nombrePaciente = cita['NombrePaciente'] ?? 'Cita';

        return Meeting(
          nombrePaciente,
          start,
          end,
          con.Cerulean,
          false,
        );
      }).toList();

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: con.Cerulean,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/icono.png', width: 48, height: 47),
                const SizedBox(width: 10),
                const Text(
                  'Agenda',
                  style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // Selector de vista
            DropdownButton<CalendarView>(
              value: _calendarView,
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.white,
              underline: Container(),
              items: const [
                DropdownMenuItem(
                  value: CalendarView.day,
                  child: Text("Día"),
                ),
                DropdownMenuItem(
                  value: CalendarView.week,
                  child: Text("Semana"),
                ),
                DropdownMenuItem(
                  value: CalendarView.month,
                  child: Text("Mes"),
                ),
                DropdownMenuItem(
                  value: CalendarView.schedule,
                  child: Text("Agenda"),
                ),
              ],
              onChanged: (view) {
                if (view != null) {
                  setState(() {
                    _calendarView = view;
                  });
                }
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: con.Cerulean))
            : SfCalendar(
          view: _calendarView,
          dataSource: MeetingDataSource(_appointments),
          allowViewNavigation: true, // permite moverse por fechas
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode:
            MonthAppointmentDisplayMode.appointment,
          ),
        ),
      ),
    );
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].from;

  @override
  DateTime getEndTime(int index) => appointments![index].to;

  @override
  String getSubject(int index) => appointments![index].eventName;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;
}
