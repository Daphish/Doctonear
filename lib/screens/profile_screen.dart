import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/login.dart';
import 'package:medichub/singleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Singleton singleton = Singleton();
  Map<String, dynamic> data = {};
  String? _selectedGenre;
  final List<String> _genres = ['Femenino', 'Masculino','No-binario'];

  @override
  void initState() {
    super.initState();
    data = singleton.userData;
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
                'Perfil',
                style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: 36,
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
             child:Padding(
               padding: EdgeInsets.all(15),
               child: SingleChildScrollView(
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
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           data['Nombre'],
                           style: TextStyle(
                               fontFamily: 'bold',
                               fontSize: 30
                           ),
                         )
                       ],
                     ),
                     //edad
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Edad',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         data['Edad'].toString(),
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'butLog',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                         ],
                       ),
                     ),
                     //genero
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Género',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         data['Genero'],
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'butLog',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     //telefono
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Teléfono',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         data['Telefono'].toString(),
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'butLog',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Rol',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         data['Rol'],
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'butLog',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           ),
                         ],
                       ),
                     ),
                     ...data['Rol'] == 'Doctor' ? [
                     Divider(
                       color: con.Cerulean,
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 10,right: 10),
                       child: Row(
                         children: [
                           Expanded(
                               flex:5,
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Cédula profesional',
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'bold',
                                             color: con.Cerulean
                                         ),
                                       ),
                                       Text(
                                         data['Cedula'],
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'butLog',
                                             color: Colors.black
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                           )
                         ],
                       ),
                     ),
                     Divider(
                       color: con.Cerulean,
                     ),
                       Padding(
                         padding: EdgeInsets.only(left: 10,right: 10),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Text(
                                   'Consultorio',
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'bold',
                                       color: con.Cerulean
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Expanded(
                                   child: Text(
                                     data['Consultorio'],
                                     style: TextStyle(
                                         fontSize: 16,
                                         fontFamily: 'butLog',
                                         color: Colors.black
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),
                       ),
                       Divider(
                         color: con.Cerulean,
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10,right: 10),
                         child: Row(
                           children: [
                             Expanded(
                                 flex:5,
                                 child: Row(
                                   children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           'Costo de consulta',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           data['Costo'].toString(),
                                           style: TextStyle(
                                               fontSize: 16,
                                               fontFamily: 'butLog',
                                               color: Colors.black
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 )
                             )
                           ],
                         ),
                       ),
                       Divider(
                         color: con.Cerulean,
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10,right: 10),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Text(
                                   'Descripción',
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'bold',
                                       color: con.Cerulean
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Expanded(
                                   child: Text(
                                     data['Descripcion'],
                                     style: TextStyle(
                                         fontSize: 16,
                                         fontFamily: 'butLog',
                                         color: Colors.black
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),
                       ),
                       Divider(
                         color: con.Cerulean,
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10,right: 10),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Text(
                                   'Dirección',
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'bold',
                                       color: con.Cerulean
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Expanded(
                                   child: Text(
                                     data['Direccion'],
                                     style: TextStyle(
                                         fontSize: 16,
                                         fontFamily: 'butLog',
                                         color: Colors.black
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),
                       ),
                       Divider(
                         color: con.Cerulean,
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10,right: 10),
                         child: Row(
                           children: [
                             Expanded(
                                 flex:5,
                                 child: Row(
                                   children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           'Especialidad',
                                           style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'bold',
                                               color: con.Cerulean
                                           ),
                                         ),
                                         Text(
                                           data['Especialidad'],
                                           style: TextStyle(
                                               fontSize: 16,
                                               fontFamily: 'butLog',
                                               color: Colors.black
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 )
                             )
                           ],
                         ),
                       ),
                       Divider(
                         color: con.Cerulean,
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10,right: 10),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Text(
                                   'Servicios',
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'bold',
                                       color: con.Cerulean
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Expanded(
                                   child: Text(
                                     data['Servicios'],
                                     style: TextStyle(
                                         fontSize: 16,
                                         fontFamily: 'butLog',
                                         color: Colors.black
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),
                       ),
                       Divider(
                         color: con.Cerulean,
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           ElevatedButton(
                             onPressed:(){
                               String nombre=data['Nombre'];
                               int edad=data['Edad'];
                               String genero=data['Genero'];
                               String cedula=data['Cedula'];
                               String consultorio=data['Consultorio'];
                               String descrip=data['Descripcion'];
                               String direccion=data['Direccion'];
                               String especialidad=data['Especialidad'];
                               String servicios=data['Servicios'];
                               int tel=data['Telefono'];
                               int costo=data['Costo'];

                               showDialog(
                                   context: context,
                                   builder:(BuildContext){
                                     return AlertDialog(
                                       title: Text(
                                         'Editar datos',
                                       ),
                                       backgroundColor: Colors.white,
                                       content: SingleChildScrollView(
                                         child: Column(
                                           children: [
                                             TextFormField(
                                               initialValue: data['Nombre'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Nombre',
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
                                               onChanged: (value){
                                                 nombre=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                                 initialValue: data['Edad'].toString(),
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Edad',
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
                                               onChanged: (value){
                                                 edad=int.tryParse(value) ?? 0;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             DropdownButtonFormField<String>(
                                               iconEnabledColor: con.Cerulean,
                                               dropdownColor: Colors.white,
                                               icon: Icon(Icons.keyboard_arrow_down_outlined),
                                               value: data['Genero'],
                                               items: _genres.map((genre) {
                                                 return DropdownMenuItem(
                                                   value: genre,
                                                   child: Text(genre,style: TextStyle(color:Colors.black),),
                                                 );
                                               }).toList(),
                                               onChanged: (value) {
                                                 setState(() {
                                                   genero=value!;
                                                   _selectedGenre = value;
                                                 });
                                               },
                                               validator: (value) => value == null ? 'Selecciona un género' : null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText: 'Género',
                                                 hintStyle: TextStyle(
                                                     fontFamily: 'cuerpo',
                                                     fontSize: 16,
                                                     color: Color(0x80000000)
                                                 ),
                                                 enabledBorder: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(20),
                                                     borderSide: BorderSide(
                                                       color: Color(0xff007EA7),
                                                       width: 2.0,
                                                     )
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
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Telefono'].toString(),
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Telefono',
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
                                               onChanged: (value){
                                                 tel=int.tryParse(value) ?? 0;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Cedula'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Cedula Profesional',
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
                                               onChanged: (value){
                                                 cedula=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Consultorio'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Consultorio',
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
                                               onChanged: (value){
                                                 consultorio=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Costo'].toString(),
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Costo consulta',
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
                                               onChanged: (value){
                                                 costo=int.tryParse(value) ?? 0;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Descripcion'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Descripción',
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
                                               onChanged: (value){
                                                 descrip=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Direccion'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Dirección',
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
                                               onChanged: (value){
                                                 direccion=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Especialidad'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Especialidad',
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
                                               onChanged: (value){
                                                 especialidad=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Servicios'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Servicios',
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
                                               onChanged: (value){
                                                 servicios=value;
                                               },
                                             ),

                                           ],
                                         ),
                                       ),
                                       actions: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           children: [
                                             ElevatedButton(
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: con.Cerulean,
                                               ),
                                               child: Text(
                                                 'Guardar',
                                                 style: TextStyle(
                                                   color: Colors.white,
                                                   fontFamily: 'cuerpo',
                                                   fontSize: 16,
                                                 ),
                                               ),
                                               onPressed: () async {
                                                 var newData = {
                                                   'Cedula': cedula,
                                                   'Consultorio': consultorio,
                                                   'Costo': costo,
                                                   'Descripcion': descrip,
                                                   'Direccion': direccion,
                                                   'Edad': edad,
                                                   'Especialidad': especialidad,
                                                   'Genero': genero,
                                                   'Nombre': nombre,
                                                   'Rol': data['Rol'],
                                                   'Servicios': servicios,
                                                   'Telefono': tel
                                                 };
                                                 await singleton.updateDoctorProfile(newData);
                                                 setState(() {
                                                   data = newData;
                                                 });
                                                 Navigator.of(context).pop();
                                               },
                                             ),
                                             ElevatedButton(
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: Colors.red,
                                               ),
                                               child: Text(
                                                 'Cancelar',
                                                 style: TextStyle(
                                                   color: Colors.white,
                                                   fontFamily: 'cuerpo',
                                                   fontSize: 16,
                                                 ),
                                               ),
                                               onPressed: () {
                                                 Navigator.of(context).pop();
                                               },
                                             ),
                                           ],
                                         ),

                                       ],
                                     );
                                   }
                               );
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: con.Cerulean,
                               padding: EdgeInsets.symmetric(horizontal: 20),
                             ),
                             child: Text(
                               'Editar datos',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'cuerpo',
                                 fontSize: 16,
                               ),
                             ),
                           ),
                           ElevatedButton(
                             onPressed:() async {
                               await singleton.signOut();
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: con.Cerulean,
                               padding: EdgeInsets.symmetric(horizontal: 20),
                             ),
                             child: Text(
                               'Cerrar sesión',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'cuerpo',
                                 fontSize: 16,
                               ),
                             ),
                           ),
                         ],
                       )
                     ] : [
                       Divider(
                         color: con.Cerulean,
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           ElevatedButton(
                             onPressed:(){

                               ////variables
                               String nombre=data['Nombre'];
                               int edad=data['Edad'];
                               String genero=data['Genero'];
                               int tel=data['Telefono'];

                               showDialog(
                                   context: context,
                                   builder:(BuildContext){
                                     return AlertDialog(
                                       title: Text(
                                         'Editar datos',
                                       ),
                                       backgroundColor: Colors.white,
                                       content: SingleChildScrollView(
                                         child: Column(
                                           children: [
                                             TextFormField(
                                               initialValue: data['Nombre'],
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Nombre',
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
                                               onChanged: (value){
                                                 nombre=value;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Edad'].toString(),
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Edad',
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
                                               onChanged: (value){
                                                 edad=int.tryParse(value) ?? 0;
                                               },
                                             ),
                                             SizedBox(height: 5,),
                                             DropdownButtonFormField<String>(
                                               iconEnabledColor: con.Cerulean,
                                               dropdownColor: Colors.white,
                                               icon: Icon(Icons.keyboard_arrow_down_outlined),
                                               value: data['Genero'],
                                               items: _genres.map((genre) {
                                                 return DropdownMenuItem(
                                                   value: genre,
                                                   child: Text(genre,style: TextStyle(color:Colors.black),),
                                                 );
                                               }).toList(),
                                               onChanged: (value) {
                                                 setState(() {
                                                   genero=value!;
                                                   _selectedGenre = value;
                                                 });
                                               },
                                               validator: (value) => value == null ? 'Selecciona un género' : null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText: 'Género',
                                                 hintStyle: TextStyle(
                                                     fontFamily: 'cuerpo',
                                                     fontSize: 16,
                                                     color: Color(0x80000000)
                                                 ),
                                                 enabledBorder: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(20),
                                                     borderSide: BorderSide(
                                                       color: Color(0xff007EA7),
                                                       width: 2.0,
                                                     )
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
                                             SizedBox(height: 5,),
                                             TextFormField(
                                               initialValue: data['Telefono'].toString(),
                                               keyboardType: TextInputType.multiline,
                                               minLines: 1,
                                               maxLines: null,
                                               style: TextStyle(
                                                 fontFamily: 'cuerpo',
                                                 fontSize: 16,
                                               ),
                                               decoration: InputDecoration(
                                                 hintText:'Telefono',
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
                                               onChanged: (value){
                                                 tel=int.tryParse(value) ?? 0;
                                               },
                                             ),
                                           ],
                                         ),
                                       ),
                                       actions: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           children: [
                                             ElevatedButton(
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: con.Cerulean,
                                               ),
                                               child: Text(
                                                 'Guardar',
                                                 style: TextStyle(
                                                   color: Colors.white,
                                                   fontFamily: 'cuerpo',
                                                   fontSize: 16,
                                                 ),
                                               ),
                                               onPressed: () async {
                                                 var newData = {
                                                   'Edad': edad,
                                                   'Genero': genero,
                                                   'Nombre': nombre,
                                                   'Rol': data['Rol'],
                                                   'Telefono': tel
                                                 };

                                                 await singleton.updatePatientProfile(newData);
                                                 setState(() {
                                                   data = newData;
                                                 });
                                                 Navigator.of(context).pop();
                                               },
                                             ),
                                             ElevatedButton(
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: Colors.red,
                                               ),
                                               child: Text(
                                                 'Cancelar',
                                                 style: TextStyle(
                                                   color: Colors.white,
                                                   fontFamily: 'cuerpo',
                                                   fontSize: 16,
                                                 ),
                                               ),
                                               onPressed: () {
                                                 Navigator.of(context).pop();
                                               },
                                             ),
                                           ],
                                         ),

                                       ],
                                     );
                                   }
                               );
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: con.Cerulean,
                               padding: EdgeInsets.symmetric(horizontal: 20),
                             ),
                             child: Text(
                               'Editar datos',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'cuerpo',
                                 fontSize: 16,
                               ),
                             ),
                           ),
                           ElevatedButton(
                             onPressed:() async {
                               await singleton.signOut();
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: con.Cerulean,
                               padding: EdgeInsets.symmetric(horizontal: 20),
                             ),
                             child: Text(
                               'Cerrar sesión',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'cuerpo',
                                 fontSize: 16,
                               ),
                             ),
                           ),
                         ],
                       )
                     ],

                   ],
                 ),
               )
             )
         ),
       ),
    );
  }
}
