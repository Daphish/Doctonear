import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<AppointmentsScreen> {
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
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder:(context,index){
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dra. Giovana Rodríguez',
                                      style: const TextStyle(
                                        fontFamily: 'butLog',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Ginecologa',
                                      style: const TextStyle(
                                        fontFamily: 'cuerpo',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset('assets/images/gps.png', width: 20),
                                                SizedBox(width: 5),
                                                Text(
                                                  'Av Himno Nacional 815,Las Águilas 3ra '
                                                      'Sección,78134',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                  softWrap: true,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 3,),
                                            Row(
                                              children: [
                                                SizedBox(width: 20,),
                                                Text(
                                                  'Clínica de Maternidad, Consultorio 14',
                                                  style: TextStyle(
                                                      color: con.placeholder,
                                                      fontSize: 13
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Image.asset('assets/images/clock.png', width: 20,),
                                                SizedBox(width: 5,),
                                                Text(
                                                  'Hora:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'butLog'
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  '10:15',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'cuerpo'
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Image.asset('assets/images/calendar_blue.png', width: 20,),
                                                SizedBox(width: 5,),
                                                Text(
                                                  'Fecha:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'butLog'
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  '9 de abril de 2025',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14
                                                  ),
                                                )
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
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color: con.link,
                                            fontFamily: 'butLog',
                                            fontSize: 13
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(81, 33),
                                    side: BorderSide(color: con.link),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    backgroundColor:Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
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
