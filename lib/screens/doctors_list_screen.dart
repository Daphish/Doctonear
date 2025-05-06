import 'package:flutter/material.dart';

class DoctorsListScreen extends StatefulWidget {
  final String query;

  const DoctorsListScreen({super.key, required this.query});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final List<Map<String, String>> allDoctors = [
    {'name': 'Dr. Juan Pérez', 'specialty': 'Cardiólogo', 'hospital': 'Hospital Central'},
    {'name': 'Dra. Ana Torres', 'specialty': 'Dermatóloga', 'hospital': 'Clínica Vida'},
    {'name': 'Dr. Luis Gómez', 'specialty': 'Pediatra', 'hospital': 'Hospital Infantil'},
    {'name': 'Dra. Marta Ruiz', 'specialty': 'Ginecóloga', 'hospital': 'Clínica Mujer'},
  ];

  late TextEditingController searchQuery;
  List<Map<String, String>> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    searchQuery = TextEditingController(text: widget.query);

    _filterDoctors(widget.query);

    searchQuery.addListener(() {
      _filterDoctors(searchQuery.text);
    });
  }

  void _filterDoctors(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredDoctors = allDoctors.where((doctor) {
        return doctor['name']!.toLowerCase().contains(lowerQuery) ||
            doctor['specialty']!.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Image.asset("assets/images/rodBlack.png", height: 40),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: searchQuery,
                      style: const TextStyle(
                        fontFamily: 'cuerpo',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Rol',
                        hintStyle: const TextStyle(
                          fontFamily: 'cuerpo',
                          fontSize: 16,
                          color: Color(0x80000000),
                        ),
                        suffixIcon: const Icon(Icons.search, color: Color(0xFF003459)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff007EA7),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff007EA7),
                            width: 2.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/filter.png", height: 40),
                  const SizedBox(width: 8),
                  const Text(
                    'Filtrar',
                    style: TextStyle(
                      fontFamily: 'cuerpo',
                      fontSize: 16,
                      color: Color(0xFF003459),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFF007EA7)),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/images/doctor_avatar.jpg",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor['name'] ?? '',
                              style: const TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              doctor['specialty'] ?? '',
                              style: const TextStyle(
                                fontFamily: 'cuerpo',
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
