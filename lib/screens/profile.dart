import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as cons;
import 'package:medichub/singleton.dart';

class Profile extends StatefulWidget {
  final void Function() backPress;
  final Function(List<Map<String, dynamic>>) appointmentPress;
  final void Function() commentPress;
  final Map<String, dynamic> doctor;

  const Profile({super.key, required this.backPress, required this.appointmentPress, required this.commentPress, required this.doctor});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  Singleton singleton = Singleton();

  @override
  void initState() {
    super.initState();
    _loadAppointmentsInBackground();
  }

  Future<void> _loadAppointmentsInBackground() async {
    await singleton.getAppointments(widget.doctor['id']);
  }

  Future<void> _handleAppointment() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (singleton.appointments.isEmpty) {
        await singleton.getAppointments(widget.doctor['id']);
      }

      widget.appointmentPress(singleton.appointments);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar citas: $e'))
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cons.Cerulean,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                widget.backPress();
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
            ),
            SizedBox(width: 10),
            Text(
              'Perfil',
              style: TextStyle(
                fontFamily: 'bold',
                fontSize: 26,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  ...widget.doctor['Genero'] == "Femenino"?[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/doctora.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]:[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/doctor.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],

                  SizedBox(height: 8),
                  Text(
                    widget.doctor['Nombre'],
                    style: TextStyle(
                      fontFamily: 'bold',
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.doctor['Especialidad'],
                    style: TextStyle(
                      fontFamily: 'butLog',
                      fontSize: 20,
                      color: cons.Prussian_Blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  ...singleton.userData['Rol'] == 'Doctor' ? [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            widget.commentPress();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cons.Cerulean,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 20),
                              Image.asset('assets/images/comments_white.png', width: 20),
                              SizedBox(width: 10),
                              Text(
                                'Comentar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cuerpo',
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: isLoading ? null : _handleAppointment,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cons.Cerulean,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/calendar_white.png', width: 20),
                              SizedBox(width: 10),
                              Text(
                                'Agendar cita',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cuerpo',
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.commentPress();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cons.Cerulean,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Image.asset('assets/images/comments_white.png', width: 20),
                              SizedBox(width: 10),
                              Text(
                                'Comentar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'cuerpo',
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],

                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sobre mí',
                        style: TextStyle(fontSize: 20, fontFamily: 'bold'),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.doctor['Descripcion'],
                          style: TextStyle(fontSize: 14, fontFamily: 'cuerpo'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Servicios',
                        style: TextStyle(fontSize: 20, fontFamily: 'bold'),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctor['Servicios'],
                        style: TextStyle(fontSize: 14, fontFamily: 'cuerpo'),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Dirección',
                          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.doctor['Direccion'],
                          style: TextStyle(fontSize: 14, fontFamily: 'cuerpo'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comentarios',
                        style: TextStyle(fontSize: 20, fontFamily: 'bold'),
                      )
                    ],
                  ),
                  if (widget.doctor['comentarios'] != null &&
                      (widget.doctor['comentarios'] as List).isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (widget.doctor['comentarios'] as List).length,
                      itemBuilder: (context, index) {
                        final comentario =
                        (widget.doctor['comentarios'] as List)[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: cons.Cerulean,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comentario['NombrePaciente'] ??
                                    'Nombre del usuario no disponible',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'bold',
                                  color: cons.Prussian_Blue,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                comentario['Comentario'] ??
                                    'Comentario no disponible',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'cuerpo',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
