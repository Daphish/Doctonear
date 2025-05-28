import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  final List<String> horas = [
    '11:00', '12:00', '13:00', '14:00', '15:00',
    '16:00', '17:00', '18:00', '19:00',
    '11:00', '12:00', '13:00', '14:00', '15:00',
    '16:00', '17:00', '18:00', '19:00',
    '11:00', '12:00', '13:00', '14:00', '15:00',
    '16:00', '17:00', '18:00', '19:00',
  ];

  bool genderIcon=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:con.Cerulean,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios,color: Colors.white,size: 35,),
            Text(
              'Agendar cita',
              style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 26,
                  color: Colors.white
              ),
            )

          ],
        ),
      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Escoge una fecha',
                      style: TextStyle(
                          fontFamily: "bold",
                          fontSize: 24
                      ),

                    )
                  ],
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: 'cuerpo',
                    fontSize: 16,
                  ),
                  obscureText: genderIcon,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month_rounded,color: con.Prussian_Blue,),
                    hintText:'Fecha',
                    hintStyle:TextStyle(
                        fontFamily: 'cuerpo',
                        fontSize: 16,
                        color: Color(0x80000000)
                    ) ,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xff007EA7),
                        width: 2.0, // grosor
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xff007EA7),
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      'Escoge una hora',
                      style: TextStyle(
                          fontFamily: "bold",
                          fontSize: 24
                      ),

                    )
                  ],
                ),
                SingleChildScrollView(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 16,
                    childAspectRatio: 4,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: horas.map((hora) {
                      return ElevatedButton(
                        onPressed: () {
                          // Acción al seleccionar la hora
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: con.Mint_Green,
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(hora, style: TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.Prussian_Blue,
                    padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
                    elevation: 5,
                  ),
                  child: Text(
                    'Agendar cita',
                    style: TextStyle(
                        fontFamily: 'butLOg',
                        fontSize: 22,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
