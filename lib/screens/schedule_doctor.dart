import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
class ScheduleDoctor extends StatefulWidget {
  const ScheduleDoctor({super.key});

  @override
  State<ScheduleDoctor> createState() => _ScheduleDoctorState();
}

class _ScheduleDoctorState extends State<ScheduleDoctor> {
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
                'Agenda',
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
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text('Hola'),
          ),
        )
      ),
    );
  }
}
