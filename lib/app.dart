import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Text('Hola'),
    );
  }
}

