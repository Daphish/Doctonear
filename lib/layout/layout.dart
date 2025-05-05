import 'package:flutter/material.dart';
import 'package:medichub/screens/profile_screen.dart';
import '../screens/home_screen.dart';
import '../screens/doctors_list_screen.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPageIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DoctorsListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
            NavigationDestination(
              icon: Icon(Icons.alarm, color: currentPageIndex == 0 ? Color(0xFF007EA7) : Colors.white),
              label: 'Citas',
            ),
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
