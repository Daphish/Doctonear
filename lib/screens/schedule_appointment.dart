import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/singleton.dart';

class ScheduleAppointment extends StatefulWidget {
  final List<Map<String, dynamic>> appointments;
  final Map<String, dynamic> doctor;
  final void Function() backPress;
  const ScheduleAppointment({super.key, required this.appointments, required this.backPress, required this.doctor});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  Singleton singleton = Singleton();
  DateTime? _selectedDate;
  String? _selectedHour;
  final List<String> horas = [
    '07:00', '08:00', '09:00', '10:00',
    '11:00', '12:00', '13:00', '14:00', '15:00',
    '16:00', '17:00', '18:00', '19:00', '20:00'
  ];

  bool genderIcon=true;

  List<String> getHorasOcupadasDelDia(DateTime fecha) {
    return widget.appointments.where((cita) {
      final DateTime inicio = (cita['Inicio'] as Timestamp).toDate();
      return inicio.year == fecha.year &&
          inicio.month == fecha.month &&
          inicio.day == fecha.day;
    }).map((cita) {
      final DateTime inicio = (cita['Inicio'] as Timestamp).toDate();
      return "${inicio.hour.toString().padLeft(2, '0')}:00";
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final horasOcupadas = _selectedDate != null ? getHorasOcupadasDelDia(_selectedDate!) : [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor:con.Cerulean,
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
              'Agendar cita',
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
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                        : '',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (picked != null) {
                      setState(() {
                        _selectedDate = picked;
                        _selectedHour = null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month_rounded, color: con.Prussian_Blue),
                    hintText: 'Fecha',
                    hintStyle: TextStyle(
                        fontFamily: 'cuerpo',
                        fontSize: 16,
                        color: Color(0x80000000)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xff007EA7), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xff007EA7), width: 2.0),
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
                      final bool ocupada = horasOcupadas.contains(hora);
                      final bool seleccionada = _selectedHour == hora;
                      return ElevatedButton(
                        onPressed: ocupada ? null : () {
                          setState(() {
                            _selectedHour = hora;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ocupada ? Colors.grey[300] : seleccionada ? con.Prussian_Blue : con.Mint_Green,
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(hora, style: TextStyle(fontSize: 16, color: ocupada || seleccionada ? Colors.white : Colors.black)),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () async {
                    if (_selectedDate != null && _selectedHour != null) {
                      await singleton.makeAppointment(widget.doctor, _selectedDate!, _selectedHour!);
                      widget.backPress();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selecciona una hora y un día.')),
                      );
                    }
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
