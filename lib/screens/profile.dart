import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as cons;
import 'package:medichub/screens/doctors_list_screen.dart';
import 'package:medichub/screens/home_screen.dart';

class Profile extends StatefulWidget {
  final void Function() backPress;
  final Map<String, dynamic> doctor;

  const Profile({super.key, required this.backPress, required this.doctor});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              widget.backPress();
                            },
                            child:Image.asset("assets/images/rodBlack.png", height: 48) ,
                          ),
                          const SizedBox(width:10),
                          Expanded(
                            child: TextFormField(
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
                                suffixIcon:Icon(Icons.search, color:cons.Prussian_Blue),
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
                                    color: cons.Cerulean,
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
                      padding: const EdgeInsets.only(right: 20.0, bottom: 8, left: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/doctor_avatar.jpg",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.doctor['Nombre'],
                            style: TextStyle(
                              fontFamily: 'bold',
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.doctor['Especialidad'],
                            style: TextStyle(
                              fontFamily: 'butLog',
                              fontSize: 20,
                              color: cons.Prussian_Blue,
                            ),
                          ),
                          SizedBox(width: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cons.Cerulean,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/images/calendar_white.png',width: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                      'Agendar cita',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'cuerpo',
                                          fontSize: 14
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cons.Cerulean,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/images/comments_white.png',width: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                      'Comentar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'cuerpo',
                                          fontSize: 14
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sobre mí',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'bold'
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.doctor['Descripcion'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'cuerpo'
                                  ),
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'bold'
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.doctor['Servicios'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'cuerpo'
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Expanded(
                               child:  Text(
                                 'Dirección',
                                 style: TextStyle(
                                     fontSize: 20,
                                     fontFamily: 'bold'
                                 ),
                               ),
                             )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child:Text(
                                  widget.doctor['Direccion'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'cuerpo'
                                  ),
                                )
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comentarios',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'bold'
                                ),
                              )
                            ],
                          ),
                          TextFormField(
                            style: TextStyle(
                              fontFamily: 'cuerpo',
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Agrega comentario'
                            ),
                          ),
                          Text(
                            'Buen doctor'
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            )
        ),
      )
    );
  }
}
