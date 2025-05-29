import 'package:flutter/material.dart';
import 'package:medichub/const.dart' as con;
import 'package:medichub/singleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Singleton singleton = Singleton();

  String? _selectedGenre;
  final List<String> _genres = ['Femenino', 'Masculino','No-binario'];

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
                           singleton.userData['Nombre'],
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
                                         singleton.userData['Edad'].toString(),
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
                                         singleton.userData['Genero'],
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
                                         singleton.userData['Telefono'].toString(),
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
                                         singleton.userData['Rol'],
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
                     ...singleton.userData['Rol'] == 'Doctor' ? [
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
                                         singleton.userData['Cedula'],
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
                                     singleton.userData['Consultorio'],
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
                                           singleton.userData['Costo'].toString(),
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
                                     singleton.userData['Descripcion'],
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
                                     singleton.userData['Direccion'],
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
                                           singleton.userData['Especialidad'],
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
                                     singleton.userData['Servicios'],
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

                               ////variables
                               String nombre=singleton.userData['Nombre'];
                               int edad=singleton.userData['Edad'];
                               String genero=singleton.userData['Genero'];
                               String cedula=singleton.userData['Cedula'];
                               String consultorio=singleton.userData['Consultorio'];
                               String descrip=singleton.userData['Descripcion'];
                               String direccion=singleton.userData['Direccion'];
                               String especialidad=singleton.userData['Especialidad'];
                               String servicios=singleton.userData['Servicios'];
                               int tel=singleton.userData['Telefono'];
                               int costo=singleton.userData['Costo'];

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
                                               initialValue: singleton.userData['Nombre'],
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
                                                 initialValue: singleton.userData['Edad'].toString(),
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
                                               value: singleton.userData['Genero'],
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
                                               initialValue: singleton.userData['Telefono'].toString(),
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
                                               initialValue: singleton.userData['Cedula'],
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
                                               initialValue: singleton.userData['Consultorio'],
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
                                               initialValue: singleton.userData['Costo'].toString(),
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
                                               initialValue: singleton.userData['Descripcion'],
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
                                               initialValue: singleton.userData['Direccion'],
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
                                               initialValue: singleton.userData['Especialidad'],
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
                                               initialValue: singleton.userData['Servicios'],
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
                                               onPressed: () {
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
                             onPressed:(){},
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
                               String nombre=singleton.userData['Nombre'];
                               int edad=singleton.userData['Edad'];
                               String genero=singleton.userData['Genero'];
                               int tel=singleton.userData['Telefono'];

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
                                               initialValue: singleton.userData['Nombre'],
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
                                               initialValue: singleton.userData['Edad'].toString(),
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
                                               value: singleton.userData['Genero'],
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
                                               initialValue: singleton.userData['Telefono'].toString(),
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
                                               onPressed: () {
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
                             onPressed:(){},
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
