import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/singleton.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<AppointmentsScreen> {
  Singleton singleton = Singleton();
  bool isLoading = true;
  List<Map<String, dynamic>> appointments = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_MX', null).then((_) {
      fetchAppointments();
    });
  }

  Future<void> fetchAppointments() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final citas = await singleton.getAppointmentsForUser(user.uid);
      citas.sort((a, b) {
        final aInicio = (a['Inicio'] as Timestamp).toDate();
        final bInicio = (b['Inicio'] as Timestamp).toDate();
        return aInicio.compareTo(bInicio);
      });
      setState(() {
        appointments = citas;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:con.Cerulean,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/icono.png',width: 48,height: 47,),
              Text(
                'Citas',
                style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: 36,
                    color: Colors.white
                ),
              )
            ],
          )
      ),
      body: SafeArea(
          child:Container(
            color: Colors.white,
            child: Column(
                children:[
                  Expanded(
                    child: isLoading ? Center(child: CircularProgressIndicator(color: con.Cerulean)) :
                    appointments.isEmpty ? Center(child: Text('No tienes citas agendadas', style: TextStyle(fontFamily: 'bold', fontSize: 30),)) :
                    ListView.builder(
                      itemCount: appointments.length,
                      itemBuilder:(context,index){
                        final cita = appointments[index];
                        final nombreDoctor = cita['NombreDoctor'] ?? 'Sin nombre';
                        final direccion = cita['Direccion'] ?? '';
                        final especialidad = cita['Especialidad'] ?? '';
                        final inicio = (cita['Inicio'] as Timestamp).toDate();
                        final hora = DateFormat.Hm('es_MX').format(inicio);
                        final fecha = DateFormat('d MMMM y', 'es_MX').format(inicio);
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
                              mainAxisSize: MainAxisSize.min,
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            nombreDoctor,
                                            style: const TextStyle(
                                              fontFamily: 'butLog',
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            especialidad,
                                            style: const TextStyle(
                                              fontFamily: 'cuerpo',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/gps.png', width: 20),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                direccion,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                                softWrap: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // Hora
                                    Row(
                                      children: [
                                        Image.asset('assets/images/clock.png', width: 20,),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Hora:',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'butLog'
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          hora,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'cuerpo'
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    // Fecha
                                    Row(
                                      children: [
                                        Image.asset('assets/images/calendar_blue.png', width: 20,),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Fecha:',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'butLog'
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          fecha,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        final citaId = cita['id'];
                                        if (citaId != null) {
                                          try {
                                            await singleton.deleteAppointment(citaId);
                                            setState(() {
                                              appointments.removeAt(index);
                                            });
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Cita cancelada')),
                                            );
                                          } catch (e) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Error al cancelar la cita')),
                                            );
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(81, 33),
                                        side: BorderSide(color: con.link),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        backgroundColor:Colors.white,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                      ),
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color: con.link,
                                            fontFamily: 'butLog',
                                            fontSize: 13
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                        );
                      },
                    ),
                  )
                ]
            ),
          )
      ),
    );
  }
}