import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/screens/profile.dart';
import 'package:medichub/singleton.dart';

class DoctorsListScreen extends StatefulWidget {
  final String query;
  final Function(Map<String, dynamic>) iconPress;

  const DoctorsListScreen({super.key, required this.query, required this.iconPress});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  Singleton singleton = Singleton();

  late TextEditingController searchQuery;
  List<Map<String, dynamic>> filteredDoctors = [];

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
      filteredDoctors = singleton.doctors.where((doctor) {
        return (doctor['Nombre'] ?? '').toString().toLowerCase().contains(lowerQuery) ||
            (doctor['Especialidad'] ?? '').toString().toLowerCase().contains(lowerQuery);
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
          child: Container(
            color: Colors.white,
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
                            hintText: 'especialidad,enfermedad o nombre',
                            hintStyle: const TextStyle(
                              fontFamily: 'cuerpo',
                              fontSize: 16,
                              color: Color(0x80000000),
                            ),
                            suffixIcon:Icon(Icons.search, color:con.Prussian_Blue),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xff007EA7),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:BorderSide(
                                color: con.Cerulean,
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
                      Image.asset("assets/images/filter.png", height: 25),
                      const SizedBox(width: 8),
                      const Text(
                        'Filtrar',
                        style: TextStyle(
                          fontFamily: 'cuerpo',
                          fontSize: 14,
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
                            border: Border.all(color:con.Cerulean),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40000000),
                                blurRadius: 4,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.iconPress(doctor);
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.asset(
                                            "assets/images/doctor_avatar.jpg",
                                            height: 75,
                                            width: 75,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctor['Nombre'] ?? '',
                                              style: const TextStyle(
                                                fontFamily: 'butLog',
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              doctor['Especialidad'] ?? '',
                                              style: const TextStyle(
                                                fontFamily: 'cuerpo',
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              '${doctor['comentarios'].length} opiniones',
                                              style:TextStyle(
                                                  fontFamily: 'cuerpo',
                                                  fontSize: 14,
                                                  color: con.placeholder
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/gps.png', width: 20,),
                                                        SizedBox(width: 5,),
                                                        Text(
                                                          doctor['Direccion'] ?? 'Av Himno Nacional 815,Las Águilas 3ra Sección,78134',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3,),
                                                    Row(
                                                      children: [
                                                        SizedBox(width: 20,),
                                                        Text(
                                                          'Consultorio: ${doctor['Consultorio']}',
                                                          style: TextStyle(
                                                              color: con.placeholder,
                                                              fontSize: 13
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/cash.png', width: 20,),
                                                        SizedBox(width: 5,),
                                                        Text(
                                                          'Primera consulta:',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(
                                                          doctor['Costo'] != null ? '\$${doctor['Costo']}' : 'No especificado',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontFamily: 'butLog',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ],
                          )
                      );
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}