import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as cons;

class Profile extends StatefulWidget {
  const Profile({super.key});

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
                          Image.asset("assets/images/rodBlack.png", height: 48),
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
                            'Dra. Giovana Rodríguez',
                            style: TextStyle(
                              fontFamily: 'bold',
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Ginecólogo',
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cons.Cerulean,
                                  padding: EdgeInsets.symmetric(horizontal: 45),


                                ),
                              ),
                              ElevatedButton(
                                onPressed: (){},
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cons.Cerulean,
                                  padding: EdgeInsets.symmetric(horizontal: 45),


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
                              Text(
                                'Soy la Dra. Guayaba Rodríguez  -Egresada de la Universidad Autónoma de San Luis Potosí. -Especialidad de Ginecologia y Obstetricia por parte de la UASLP...',
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
                                'CONTROL PRENATAL ATENCION DE PARTO VAGINAL ATENCION DE PARTO PORCESAREA CIRUGIA LAPAROSCOPICA GINECOLOGICA',
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
                              Text(
                                'Dirección',
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
                                'Av Himno Nacional 815,Las Águilas 3ra Sección 78134',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'cuerpo'
                                ),
                              )
                            ],
                          ),


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
