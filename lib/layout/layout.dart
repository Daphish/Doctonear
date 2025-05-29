import 'package:flutter/material.dart';
import 'package:medichub/screens/comments_screen.dart';
import 'package:medichub/screens/profile.dart';
import 'package:medichub/screens/appointments_screen.dart';
import 'package:medichub/screens/profile_screen.dart';
import 'package:medichub/screens/schedule_appointment.dart';
import 'package:medichub/screens/schedule_doctor.dart';
import '../screens/home_screen.dart';
import '../screens/doctors_list_screen.dart';
import '../singleton.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  int currentPageIndex = 1;
  int homeSubPageIndex = 0;
  String searchQuery = "";
  Map<String, dynamic> profileDoc = {};
  List<Map<String, dynamic>> appointmentsDoc = [];
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _homeSectionScreens = [
      HomeScreen(onSearchPressed: (String query) {
        setState(() {
          homeSubPageIndex = 1;
          searchQuery = query;
        });
      }),
      DoctorsListScreen(query: searchQuery, iconPress: (Map<String, dynamic> doctor){
        setState(() {
          homeSubPageIndex=2;
          profileDoc = doctor;
        });
      }),
      Profile(doctor: profileDoc, backPress:(){
        setState(() {
          homeSubPageIndex=1;
        });
      }, appointmentPress: (List<Map<String, dynamic>> appointments){
        setState(() {
          homeSubPageIndex=3;
          appointmentsDoc = appointments;
        });
      }, commentPress: (){
        setState(() {
          homeSubPageIndex=4;
        });
      }),
      ScheduleAppointment(appointments: appointmentsDoc, doctor: profileDoc, backPress:(){
        setState(() {
          homeSubPageIndex=2;
        });
      }),
      CommentsScreen(doctor: profileDoc, backPress:(Map<String, dynamic> doctor){
        setState(() {
          homeSubPageIndex=2;
          profileDoc = doctor;
        });
      })
    ];

    final List<Widget> _screens = [
      singleton.userData['Rol'] == 'Doctor'
          ? ScheduleDoctor()
          : AppointmentsScreen(),
      _homeSectionScreens[homeSubPageIndex],
      ProfileScreen(),
    ];

    return Scaffold(
      body: _screens[currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(color: Color(0xFFCEFDFF))
                  : const TextStyle(color: Colors.white)
          ),
        ),
        child: NavigationBar(
          destinations: [
            ...singleton.userData['Rol'] == 'Doctor' ? [
              NavigationDestination(
                icon: Icon(Icons.alarm, color: currentPageIndex == 0 ? Color(0xFF007EA7) : Colors.white),
                label: 'Agenda',
              ),
            ]:[
              NavigationDestination(
                icon: Icon(Icons.alarm, color: currentPageIndex == 0 ? Color(0xFF007EA7) : Colors.white),
                label: 'Citas',
              ),
            ],
            NavigationDestination(
              icon: Icon(Icons.home, color: currentPageIndex == 1 ? Color(0xFF007EA7) : Colors.white),
              label: 'Inicio',
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: currentPageIndex == 2 ? Color(0xFF007EA7) : Colors.white),
              label: 'Perfil',
            )
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              if (index == 1) {
                homeSubPageIndex = 0;
              }
            });
          },
          backgroundColor: Color(0xFF007EA7),
          animationDuration: Duration(microseconds: 1000),
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
